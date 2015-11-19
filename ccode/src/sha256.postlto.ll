; ModuleID = 'sha256.postlto.bc'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%04x\0A\00", align 1
@k = internal constant [64 x i32] [i32 1116352408, i32 1899447441, i32 -1245643825, i32 -373957723, i32 961987163, i32 1508970993, i32 -1841331548, i32 -1424204075, i32 -670586216, i32 310598401, i32 607225278, i32 1426881987, i32 1925078388, i32 -2132889090, i32 -1680079193, i32 -1046744716, i32 -459576895, i32 -272742522, i32 264347078, i32 604807628, i32 770255983, i32 1249150122, i32 1555081692, i32 1996064986, i32 -1740746414, i32 -1473132947, i32 -1341970488, i32 -1084653625, i32 -958395405, i32 -710438585, i32 113926993, i32 338241895, i32 666307205, i32 773529912, i32 1294757372, i32 1396182291, i32 1695183700, i32 1986661051, i32 -2117940946, i32 -1838011259, i32 -1564481375, i32 -1474664885, i32 -1035236496, i32 -949202525, i32 -778901479, i32 -694614492, i32 -200395387, i32 275423344, i32 430227734, i32 506948616, i32 659060556, i32 883997877, i32 958139571, i32 1322822218, i32 1537002063, i32 1747873779, i32 1955562222, i32 2024104815, i32 -2067236844, i32 -1933114872, i32 -1866530822, i32 -1538233109, i32 -1090935817, i32 -965641998], align 4
@gData = internal global [192 x i8] zeroinitializer, align 1
@.str1 = private unnamed_addr constant [21 x i8] c"padded to %d blocks\0A\00", align 1
@gDigest = internal global [8 x i32] zeroinitializer, align 4
@main.msg = private unnamed_addr constant [3 x i8] c"abc", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str3 = private unnamed_addr constant [5 x i8] c"%04x\00", align 1

; Function Attrs: noinline nounwind
define internal i32 @pad(i8* %data, i8* %msg, i64 %msgLen) #0 {
  br label %1

; <label>:1                                       ; preds = %4, %0
  %i.0 = phi i32 [ 0, %0 ], [ %8, %4 ]
  %2 = sext i32 %i.0 to i64
  %3 = icmp ult i64 %2, %msgLen
  br i1 %3, label %4, label %9

; <label>:4                                       ; preds = %1
  %5 = getelementptr inbounds i8* %msg, i32 %i.0
  %6 = load i8* %5, align 1
  %7 = getelementptr inbounds i8* %data, i32 %i.0
  store i8 %6, i8* %7, align 1
  %8 = add nsw i32 %i.0, 1
  br label %1

; <label>:9                                       ; preds = %1
  %10 = getelementptr inbounds i8* %data, i32 %i.0
  store i8 -128, i8* %10, align 1
  br label %11

; <label>:11                                      ; preds = %14, %9
  %i.1.in = phi i32 [ %i.0, %9 ], [ %i.1, %14 ]
  %i.1 = add nsw i32 %i.1.in, 1
  %12 = and i32 %i.1, 63
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %16, label %14

; <label>:14                                      ; preds = %11
  %15 = getelementptr inbounds i8* %data, i32 %i.1
  store i8 0, i8* %15, align 1
  br label %11

; <label>:16                                      ; preds = %11
  %17 = shl i64 %msgLen, 3
  %18 = add nsw i32 %i.1.in, -1
  %19 = getelementptr inbounds i8* %data, i32 %18
  store i8 0, i8* %19, align 1
  %20 = trunc i64 %17 to i8
  %21 = getelementptr inbounds i8* %data, i32 %i.1.in
  store i8 %20, i8* %21, align 1
  %22 = sdiv i32 %i.1, 64
  ret i32 %22
}

; Function Attrs: noinline nounwind
define internal void @outerloop(i32* %digest, i8* %data, i32 %numBlocks) #0 {
  %W = alloca [64 x i32], align 4
  br label %1

; <label>:1                                       ; preds = %149, %0
  %h7.0 = phi i32 [ 1541459225, %0 ], [ %151, %149 ]
  %h6.0 = phi i32 [ 528734635, %0 ], [ %152, %149 ]
  %h5.0 = phi i32 [ -1694144372, %0 ], [ %153, %149 ]
  %h4.0 = phi i32 [ 1359893119, %0 ], [ %154, %149 ]
  %h3.0 = phi i32 [ -1521486534, %0 ], [ %155, %149 ]
  %h2.0 = phi i32 [ 1013904242, %0 ], [ %156, %149 ]
  %h1.0 = phi i32 [ -1150833019, %0 ], [ %157, %149 ]
  %h0.0 = phi i32 [ 1779033703, %0 ], [ %158, %149 ]
  %Mi.0 = phi i8* [ %data, %0 ], [ %150, %149 ]
  %i.0 = phi i32 [ 0, %0 ], [ %159, %149 ]
  %2 = icmp slt i32 %i.0, %numBlocks
  br i1 %2, label %3, label %160

; <label>:3                                       ; preds = %1
  br label %4

; <label>:4                                       ; preds = %34, %3
  %t.0 = phi i32 [ 0, %3 ], [ %35, %34 ]
  %5 = icmp slt i32 %t.0, 16
  br i1 %5, label %6, label %36

; <label>:6                                       ; preds = %4
  %7 = shl nsw i32 %t.0, 2
  %8 = getelementptr inbounds i8* %Mi.0, i32 %7
  %9 = load i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = shl nuw i32 %10, 24
  %12 = shl nsw i32 %t.0, 2
  %13 = or i32 %12, 1
  %14 = getelementptr inbounds i8* %Mi.0, i32 %13
  %15 = load i8* %14, align 1
  %16 = zext i8 %15 to i32
  %17 = shl nuw nsw i32 %16, 16
  %18 = or i32 %11, %17
  %19 = shl nsw i32 %t.0, 2
  %20 = or i32 %19, 2
  %21 = getelementptr inbounds i8* %Mi.0, i32 %20
  %22 = load i8* %21, align 1
  %23 = zext i8 %22 to i32
  %24 = shl nuw nsw i32 %23, 8
  %25 = or i32 %18, %24
  %26 = shl nsw i32 %t.0, 2
  %27 = or i32 %26, 3
  %28 = getelementptr inbounds i8* %Mi.0, i32 %27
  %29 = load i8* %28, align 1
  %30 = zext i8 %29 to i32
  %31 = or i32 %25, %30
  %32 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %t.0
  store i32 %31, i32* %32, align 4
  %33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 %31) #3
  br label %34

; <label>:34                                      ; preds = %6
  %35 = add nsw i32 %t.0, 1
  br label %4

; <label>:36                                      ; preds = %4
  br label %37

; <label>:37                                      ; preds = %99, %36
  %t.1 = phi i32 [ %t.0, %36 ], [ %100, %99 ]
  %38 = icmp slt i32 %t.1, 64
  br i1 %38, label %39, label %101

; <label>:39                                      ; preds = %37
  %40 = add nsw i32 %t.1, -2
  %41 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %40
  %42 = load i32* %41, align 4
  %43 = lshr i32 %42, 17
  %44 = add nsw i32 %t.1, -2
  %45 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %44
  %46 = load i32* %45, align 4
  %47 = shl i32 %46, 15
  %48 = or i32 %43, %47
  %49 = add nsw i32 %t.1, -2
  %50 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %49
  %51 = load i32* %50, align 4
  %52 = lshr i32 %51, 19
  %53 = add nsw i32 %t.1, -2
  %54 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %53
  %55 = load i32* %54, align 4
  %56 = shl i32 %55, 13
  %57 = or i32 %52, %56
  %58 = xor i32 %48, %57
  %59 = add nsw i32 %t.1, -2
  %60 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %59
  %61 = load i32* %60, align 4
  %62 = lshr i32 %61, 10
  %63 = xor i32 %58, %62
  %64 = add nsw i32 %t.1, -7
  %65 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %64
  %66 = load i32* %65, align 4
  %67 = add i32 %63, %66
  %68 = add nsw i32 %t.1, -15
  %69 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %68
  %70 = load i32* %69, align 4
  %71 = lshr i32 %70, 7
  %72 = add nsw i32 %t.1, -15
  %73 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %72
  %74 = load i32* %73, align 4
  %75 = shl i32 %74, 25
  %76 = or i32 %71, %75
  %77 = add nsw i32 %t.1, -15
  %78 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %77
  %79 = load i32* %78, align 4
  %80 = lshr i32 %79, 18
  %81 = add nsw i32 %t.1, -15
  %82 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %81
  %83 = load i32* %82, align 4
  %84 = shl i32 %83, 14
  %85 = or i32 %80, %84
  %86 = xor i32 %76, %85
  %87 = add nsw i32 %t.1, -15
  %88 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %87
  %89 = load i32* %88, align 4
  %90 = lshr i32 %89, 3
  %91 = xor i32 %86, %90
  %92 = add i32 %67, %91
  %93 = add nsw i32 %t.1, -16
  %94 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %93
  %95 = load i32* %94, align 4
  %96 = add i32 %92, %95
  %97 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %t.1
  store i32 %96, i32* %97, align 4
  %98 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 %96) #3
  br label %99

; <label>:99                                      ; preds = %39
  %100 = add nsw i32 %t.1, 1
  br label %37

; <label>:101                                     ; preds = %37
  br label %102

; <label>:102                                     ; preds = %128, %101
  %h.0 = phi i32 [ %h7.0, %101 ], [ %g.0, %128 ]
  %g.0 = phi i32 [ %h6.0, %101 ], [ %f.0, %128 ]
  %f.0 = phi i32 [ %h5.0, %101 ], [ %e.0, %128 ]
  %e.0 = phi i32 [ %h4.0, %101 ], [ %146, %128 ]
  %d.0 = phi i32 [ %h3.0, %101 ], [ %c.0, %128 ]
  %c.0 = phi i32 [ %h2.0, %101 ], [ %b.0, %128 ]
  %b.0 = phi i32 [ %h1.0, %101 ], [ %a.0, %128 ]
  %a.0 = phi i32 [ %h0.0, %101 ], [ %145, %128 ]
  %t.2 = phi i32 [ 0, %101 ], [ %147, %128 ]
  %103 = icmp slt i32 %t.2, 64
  br i1 %103, label %104, label %148

; <label>:104                                     ; preds = %102
  %105 = lshr i32 %e.0, 6
  %106 = shl i32 %e.0, 26
  %107 = or i32 %105, %106
  %108 = lshr i32 %e.0, 11
  %109 = shl i32 %e.0, 21
  %110 = or i32 %108, %109
  %111 = xor i32 %107, %110
  %112 = lshr i32 %e.0, 25
  %113 = shl i32 %e.0, 7
  %114 = or i32 %112, %113
  %115 = xor i32 %111, %114
  %116 = add i32 %h.0, %115
  %117 = and i32 %e.0, %f.0
  %118 = xor i32 %e.0, -1
  %119 = and i32 %g.0, %118
  %120 = xor i32 %117, %119
  %121 = add i32 %116, %120
  %122 = getelementptr inbounds [64 x i32]* @k, i32 0, i32 %t.2
  %123 = load i32* %122, align 4
  %124 = add i32 %121, %123
  %125 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %t.2
  %126 = load i32* %125, align 4
  %127 = add i32 %124, %126
  br label %128

; <label>:128                                     ; preds = %104
  %129 = lshr i32 %a.0, 2
  %130 = shl i32 %a.0, 30
  %131 = or i32 %129, %130
  %132 = lshr i32 %a.0, 13
  %133 = shl i32 %a.0, 19
  %134 = or i32 %132, %133
  %135 = xor i32 %131, %134
  %136 = lshr i32 %a.0, 22
  %137 = shl i32 %a.0, 10
  %138 = or i32 %136, %137
  %139 = xor i32 %135, %138
  %140 = xor i32 %b.0, %c.0
  %141 = and i32 %a.0, %140
  %142 = and i32 %b.0, %c.0
  %143 = xor i32 %141, %142
  %144 = add i32 %139, %143
  %145 = add i32 %127, %144
  %146 = add i32 %d.0, %127
  %147 = add nsw i32 %t.2, 1
  br label %102

; <label>:148                                     ; preds = %102
  br label %149

; <label>:149                                     ; preds = %148
  %150 = getelementptr inbounds i8* %Mi.0, i32 64
  %151 = add i32 %h.0, %h7.0
  %152 = add i32 %g.0, %h6.0
  %153 = add i32 %f.0, %h5.0
  %154 = add i32 %e.0, %h4.0
  %155 = add i32 %d.0, %h3.0
  %156 = add i32 %c.0, %h2.0
  %157 = add i32 %b.0, %h1.0
  %158 = add i32 %a.0, %h0.0
  %159 = add nsw i32 %i.0, 1
  br label %1

; <label>:160                                     ; preds = %1
  store i32 %h0.0, i32* %digest, align 4
  %161 = getelementptr inbounds i32* %digest, i32 1
  store i32 %h1.0, i32* %161, align 4
  %162 = getelementptr inbounds i32* %digest, i32 2
  store i32 %h2.0, i32* %162, align 4
  %163 = getelementptr inbounds i32* %digest, i32 3
  store i32 %h3.0, i32* %163, align 4
  %164 = getelementptr inbounds i32* %digest, i32 4
  store i32 %h4.0, i32* %164, align 4
  %165 = getelementptr inbounds i32* %digest, i32 5
  store i32 %h5.0, i32* %165, align 4
  %166 = getelementptr inbounds i32* %digest, i32 6
  store i32 %h6.0, i32* %166, align 4
  %167 = getelementptr inbounds i32* %digest, i32 7
  store i32 %h7.0, i32* %167, align 4
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind
define internal void @SHA256(i8* %msg, i64 %msgLen) #0 {
  %1 = call i32 @pad(i8* getelementptr inbounds ([192 x i8]* @gData, i32 0, i32 0), i8* %msg, i64 %msgLen) #4
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 %1) #3
  call void @outerloop(i32* getelementptr inbounds ([8 x i32]* @gDigest, i32 0, i32 0), i8* getelementptr inbounds ([192 x i8]* @gData, i32 0, i32 0), i32 %1) #4
  ret void
}

; Function Attrs: noinline nounwind
define i32 @main() #0 {
  %msg = alloca [3 x i8], align 1
  %1 = getelementptr inbounds [3 x i8]* %msg, i32 0, i32 0
  call void @legup_memcpy_1(i8* %1, i8* getelementptr inbounds ([3 x i8]* @main.msg, i32 0, i32 0), i32 3)
  %2 = getelementptr inbounds [3 x i8]* %msg, i32 0, i32 0
  call void @SHA256(i8* %2, i64 3) #4
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)) #3
  br label %4

; <label>:4                                       ; preds = %10, %0
  %i.0 = phi i32 [ 0, %0 ], [ %11, %10 ]
  %5 = icmp slt i32 %i.0, 8
  br i1 %5, label %6, label %12

; <label>:6                                       ; preds = %4
  %7 = getelementptr inbounds [8 x i32]* @gDigest, i32 0, i32 %i.0
  %8 = load i32* %7, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str3, i32 0, i32 0), i32 %8) #3
  br label %10

; <label>:10                                      ; preds = %6
  %11 = add nsw i32 %i.0, 1
  br label %4

; <label>:12                                      ; preds = %4
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)) #3
  ret i32 0
}

; Function Attrs: nounwind
define internal void @legup_memcpy_1(i8* %d, i8* %s, i32 %n) #2 {
  %1 = alloca i32, align 4
  %dt = alloca i8*, align 4
  %st = alloca i8*, align 4
  store i32 %n, i32* %1, align 4
  store i8* %d, i8** %dt, align 4
  store i8* %s, i8** %st, align 4
  br label %2

; <label>:2                                       ; preds = %6, %0
  %3 = load i32* %1, align 4
  %4 = add i32 %3, -1
  store i32 %4, i32* %1, align 4
  %5 = icmp eq i32 %3, 0
  br i1 %5, label %12, label %6

; <label>:6                                       ; preds = %2
  %7 = load i8** %st, align 4
  %8 = getelementptr inbounds i8* %7, i32 1
  store i8* %8, i8** %st, align 4
  %9 = load i8* %7, align 1
  %10 = load i8** %dt, align 4
  %11 = getelementptr inbounds i8* %10, i32 1
  store i8* %11, i8** %dt, align 4
  store i8 %9, i8* %10, align 1
  br label %2

; <label>:12                                      ; preds = %2
  ret void
}

attributes #0 = { noinline nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nobuiltin nounwind }
attributes #4 = { nobuiltin }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}

!0 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
