; ModuleID = 'sha256.prelto.bc'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%04x\0A\00", align 1
@k = internal constant [64 x i32] [i32 1116352408, i32 1899447441, i32 -1245643825, i32 -373957723, i32 961987163, i32 1508970993, i32 -1841331548, i32 -1424204075, i32 -670586216, i32 310598401, i32 607225278, i32 1426881987, i32 1925078388, i32 -2132889090, i32 -1680079193, i32 -1046744716, i32 -459576895, i32 -272742522, i32 264347078, i32 604807628, i32 770255983, i32 1249150122, i32 1555081692, i32 1996064986, i32 -1740746414, i32 -1473132947, i32 -1341970488, i32 -1084653625, i32 -958395405, i32 -710438585, i32 113926993, i32 338241895, i32 666307205, i32 773529912, i32 1294757372, i32 1396182291, i32 1695183700, i32 1986661051, i32 -2117940946, i32 -1838011259, i32 -1564481375, i32 -1474664885, i32 -1035236496, i32 -949202525, i32 -778901479, i32 -694614492, i32 -200395387, i32 275423344, i32 430227734, i32 506948616, i32 659060556, i32 883997877, i32 958139571, i32 1322822218, i32 1537002063, i32 1747873779, i32 1955562222, i32 2024104815, i32 -2067236844, i32 -1933114872, i32 -1866530822, i32 -1538233109, i32 -1090935817, i32 -965641998], align 4
@gData = common global [192 x i8] zeroinitializer, align 1
@.str1 = private unnamed_addr constant [21 x i8] c"padded to %d blocks\0A\00", align 1
@gDigest = common global [8 x i32] zeroinitializer, align 4
@main.msg = private unnamed_addr constant [3 x i8] c"abc", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str3 = private unnamed_addr constant [5 x i8] c"%04x\00", align 1

; Function Attrs: noinline nounwind
define i32 @pad(i8* %data, i8* %msg, i64 %msgLen) #0 {
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
  %11 = add nsw i32 %i.0, 1
  br label %12

; <label>:12                                      ; preds = %15, %9
  %i.1 = phi i32 [ %11, %9 ], [ %17, %15 ]
  %13 = srem i32 %i.1, 64
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %12
  %16 = getelementptr inbounds i8* %data, i32 %i.1
  store i8 0, i8* %16, align 1
  %17 = add nsw i32 %i.1, 1
  br label %12

; <label>:18                                      ; preds = %12
  %19 = mul i64 %msgLen, 8
  %20 = and i64 %19, -4294967296
  %21 = trunc i64 %20 to i8
  %22 = sub nsw i32 %i.1, 2
  %23 = getelementptr inbounds i8* %data, i32 %22
  store i8 %21, i8* %23, align 1
  %24 = and i64 %19, 4294967295
  %25 = trunc i64 %24 to i8
  %26 = sub nsw i32 %i.1, 1
  %27 = getelementptr inbounds i8* %data, i32 %26
  store i8 %25, i8* %27, align 1
  %28 = sdiv i32 %i.1, 64
  ret i32 %28
}

; Function Attrs: noinline nounwind
define void @outerloop(i32* %digest, i8* %data, i32 %numBlocks) #0 {
  %W = alloca [64 x i32], align 4
  br label %1

; <label>:1                                       ; preds = %163, %0
  %h7.0 = phi i32 [ 1541459225, %0 ], [ %161, %163 ]
  %h6.0 = phi i32 [ 528734635, %0 ], [ %160, %163 ]
  %h5.0 = phi i32 [ -1694144372, %0 ], [ %159, %163 ]
  %h4.0 = phi i32 [ 1359893119, %0 ], [ %158, %163 ]
  %h3.0 = phi i32 [ -1521486534, %0 ], [ %157, %163 ]
  %h2.0 = phi i32 [ 1013904242, %0 ], [ %156, %163 ]
  %h1.0 = phi i32 [ -1150833019, %0 ], [ %155, %163 ]
  %h0.0 = phi i32 [ 1779033703, %0 ], [ %154, %163 ]
  %Mi.0 = phi i8* [ %data, %0 ], [ %162, %163 ]
  %i.0 = phi i32 [ 0, %0 ], [ %164, %163 ]
  %2 = icmp slt i32 %i.0, %numBlocks
  br i1 %2, label %3, label %165

; <label>:3                                       ; preds = %1
  br label %4

; <label>:4                                       ; preds = %36, %3
  %t.0 = phi i32 [ 0, %3 ], [ %37, %36 ]
  %5 = icmp slt i32 %t.0, 16
  br i1 %5, label %6, label %38

; <label>:6                                       ; preds = %4
  %7 = mul nsw i32 4, %t.0
  %8 = getelementptr inbounds i8* %Mi.0, i32 %7
  %9 = load i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = shl i32 %10, 24
  %12 = mul nsw i32 4, %t.0
  %13 = add nsw i32 %12, 1
  %14 = getelementptr inbounds i8* %Mi.0, i32 %13
  %15 = load i8* %14, align 1
  %16 = zext i8 %15 to i32
  %17 = shl i32 %16, 16
  %18 = add nsw i32 %11, %17
  %19 = mul nsw i32 4, %t.0
  %20 = add nsw i32 %19, 2
  %21 = getelementptr inbounds i8* %Mi.0, i32 %20
  %22 = load i8* %21, align 1
  %23 = zext i8 %22 to i32
  %24 = shl i32 %23, 8
  %25 = add nsw i32 %18, %24
  %26 = mul nsw i32 4, %t.0
  %27 = add nsw i32 %26, 3
  %28 = getelementptr inbounds i8* %Mi.0, i32 %27
  %29 = load i8* %28, align 1
  %30 = zext i8 %29 to i32
  %31 = add nsw i32 %25, %30
  %32 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %t.0
  store i32 %31, i32* %32, align 4
  %33 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %t.0
  %34 = load i32* %33, align 4
  %35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 %34) #3
  br label %36

; <label>:36                                      ; preds = %6
  %37 = add nsw i32 %t.0, 1
  br label %4

; <label>:38                                      ; preds = %4
  br label %39

; <label>:39                                      ; preds = %103, %38
  %t.1 = phi i32 [ %t.0, %38 ], [ %104, %103 ]
  %40 = icmp slt i32 %t.1, 64
  br i1 %40, label %41, label %105

; <label>:41                                      ; preds = %39
  %42 = sub nsw i32 %t.1, 2
  %43 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %42
  %44 = load i32* %43, align 4
  %45 = lshr i32 %44, 17
  %46 = sub nsw i32 %t.1, 2
  %47 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %46
  %48 = load i32* %47, align 4
  %49 = shl i32 %48, 15
  %50 = or i32 %45, %49
  %51 = sub nsw i32 %t.1, 2
  %52 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %51
  %53 = load i32* %52, align 4
  %54 = lshr i32 %53, 19
  %55 = sub nsw i32 %t.1, 2
  %56 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %55
  %57 = load i32* %56, align 4
  %58 = shl i32 %57, 13
  %59 = or i32 %54, %58
  %60 = xor i32 %50, %59
  %61 = sub nsw i32 %t.1, 2
  %62 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %61
  %63 = load i32* %62, align 4
  %64 = lshr i32 %63, 10
  %65 = xor i32 %60, %64
  %66 = sub nsw i32 %t.1, 7
  %67 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %66
  %68 = load i32* %67, align 4
  %69 = add i32 %65, %68
  %70 = sub nsw i32 %t.1, 15
  %71 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %70
  %72 = load i32* %71, align 4
  %73 = lshr i32 %72, 7
  %74 = sub nsw i32 %t.1, 15
  %75 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %74
  %76 = load i32* %75, align 4
  %77 = shl i32 %76, 25
  %78 = or i32 %73, %77
  %79 = sub nsw i32 %t.1, 15
  %80 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %79
  %81 = load i32* %80, align 4
  %82 = lshr i32 %81, 18
  %83 = sub nsw i32 %t.1, 15
  %84 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %83
  %85 = load i32* %84, align 4
  %86 = shl i32 %85, 14
  %87 = or i32 %82, %86
  %88 = xor i32 %78, %87
  %89 = sub nsw i32 %t.1, 15
  %90 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %89
  %91 = load i32* %90, align 4
  %92 = lshr i32 %91, 3
  %93 = xor i32 %88, %92
  %94 = add i32 %69, %93
  %95 = sub nsw i32 %t.1, 16
  %96 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %95
  %97 = load i32* %96, align 4
  %98 = add i32 %94, %97
  %99 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %t.1
  store i32 %98, i32* %99, align 4
  %100 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %t.1
  %101 = load i32* %100, align 4
  %102 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 %101) #3
  br label %103

; <label>:103                                     ; preds = %41
  %104 = add nsw i32 %t.1, 1
  br label %39

; <label>:105                                     ; preds = %39
  br label %106

; <label>:106                                     ; preds = %151, %105
  %h.0 = phi i32 [ %h7.0, %105 ], [ %g.0, %151 ]
  %g.0 = phi i32 [ %h6.0, %105 ], [ %f.0, %151 ]
  %f.0 = phi i32 [ %h5.0, %105 ], [ %e.0, %151 ]
  %e.0 = phi i32 [ %h4.0, %105 ], [ %149, %151 ]
  %d.0 = phi i32 [ %h3.0, %105 ], [ %c.0, %151 ]
  %c.0 = phi i32 [ %h2.0, %105 ], [ %b.0, %151 ]
  %b.0 = phi i32 [ %h1.0, %105 ], [ %a.0, %151 ]
  %a.0 = phi i32 [ %h0.0, %105 ], [ %150, %151 ]
  %t.2 = phi i32 [ 0, %105 ], [ %152, %151 ]
  %107 = icmp slt i32 %t.2, 64
  br i1 %107, label %108, label %153

; <label>:108                                     ; preds = %106
  %109 = lshr i32 %e.0, 6
  %110 = shl i32 %e.0, 26
  %111 = or i32 %109, %110
  %112 = lshr i32 %e.0, 11
  %113 = shl i32 %e.0, 21
  %114 = or i32 %112, %113
  %115 = xor i32 %111, %114
  %116 = lshr i32 %e.0, 25
  %117 = shl i32 %e.0, 7
  %118 = or i32 %116, %117
  %119 = xor i32 %115, %118
  %120 = add i32 %h.0, %119
  %121 = and i32 %e.0, %f.0
  %122 = xor i32 %e.0, -1
  %123 = and i32 %122, %g.0
  %124 = xor i32 %121, %123
  %125 = add i32 %120, %124
  %126 = getelementptr inbounds [64 x i32]* @k, i32 0, i32 %t.2
  %127 = load i32* %126, align 4
  %128 = add i32 %125, %127
  %129 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %t.2
  %130 = load i32* %129, align 4
  %131 = add i32 %128, %130
  %132 = lshr i32 %a.0, 2
  %133 = shl i32 %a.0, 30
  %134 = or i32 %132, %133
  %135 = lshr i32 %a.0, 13
  %136 = shl i32 %a.0, 19
  %137 = or i32 %135, %136
  %138 = xor i32 %134, %137
  %139 = lshr i32 %a.0, 22
  %140 = shl i32 %a.0, 10
  %141 = or i32 %139, %140
  %142 = xor i32 %138, %141
  %143 = and i32 %a.0, %b.0
  %144 = and i32 %a.0, %c.0
  %145 = xor i32 %143, %144
  %146 = and i32 %b.0, %c.0
  %147 = xor i32 %145, %146
  %148 = add i32 %142, %147
  %149 = add i32 %d.0, %131
  %150 = add i32 %131, %148
  br label %151

; <label>:151                                     ; preds = %108
  %152 = add nsw i32 %t.2, 1
  br label %106

; <label>:153                                     ; preds = %106
  %154 = add i32 %a.0, %h0.0
  %155 = add i32 %b.0, %h1.0
  %156 = add i32 %c.0, %h2.0
  %157 = add i32 %d.0, %h3.0
  %158 = add i32 %e.0, %h4.0
  %159 = add i32 %f.0, %h5.0
  %160 = add i32 %g.0, %h6.0
  %161 = add i32 %h.0, %h7.0
  %162 = getelementptr inbounds i8* %Mi.0, i32 64
  br label %163

; <label>:163                                     ; preds = %153
  %164 = add nsw i32 %i.0, 1
  br label %1

; <label>:165                                     ; preds = %1
  %166 = getelementptr inbounds i32* %digest, i32 0
  store i32 %h0.0, i32* %166, align 4
  %167 = getelementptr inbounds i32* %digest, i32 1
  store i32 %h1.0, i32* %167, align 4
  %168 = getelementptr inbounds i32* %digest, i32 2
  store i32 %h2.0, i32* %168, align 4
  %169 = getelementptr inbounds i32* %digest, i32 3
  store i32 %h3.0, i32* %169, align 4
  %170 = getelementptr inbounds i32* %digest, i32 4
  store i32 %h4.0, i32* %170, align 4
  %171 = getelementptr inbounds i32* %digest, i32 5
  store i32 %h5.0, i32* %171, align 4
  %172 = getelementptr inbounds i32* %digest, i32 6
  store i32 %h6.0, i32* %172, align 4
  %173 = getelementptr inbounds i32* %digest, i32 7
  store i32 %h7.0, i32* %173, align 4
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind
define void @SHA256(i8* %msg, i64 %msgLen) #0 {
  %1 = call i32 @pad(i8* getelementptr inbounds ([192 x i8]* @gData, i32 0, i32 0), i8* %msg, i64 %msgLen) #3
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 %1) #3
  call void @outerloop(i32* getelementptr inbounds ([8 x i32]* @gDigest, i32 0, i32 0), i8* getelementptr inbounds ([192 x i8]* @gData, i32 0, i32 0), i32 %1) #3
  ret void
}

; Function Attrs: noinline nounwind
define i32 @main() #0 {
  %msg = alloca [3 x i8], align 1
  %1 = bitcast [3 x i8]* %msg to i8*
  call void @legup_memcpy_1(i8* %1, i8* getelementptr inbounds ([3 x i8]* @main.msg, i32 0, i32 0), i32 3)
  %2 = getelementptr inbounds [3 x i8]* %msg, i32 0, i32 0
  call void @SHA256(i8* %2, i64 3) #3
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
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i32, i1) #2

declare void @legup_memcpy_1(i8*, i8*, i32)

attributes #0 = { noinline nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nobuiltin }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
