; ModuleID = 'sha256.1.bc'
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

; <label>:1                                       ; preds = %3, %0
  %indvar1 = phi i64 [ %indvar.next2, %3 ], [ 0, %0 ]
  %2 = phi i32 [ 0, %0 ], [ %7, %3 ]
  %exitcond = icmp ne i64 %indvar1, %msgLen
  br i1 %exitcond, label %3, label %8

; <label>:3                                       ; preds = %1
  %4 = getelementptr inbounds i8* %msg, i32 %2
  %5 = load i8* %4, align 1
  %6 = getelementptr inbounds i8* %data, i32 %2
  store i8 %5, i8* %6, align 1
  %7 = add nsw i32 %2, 1
  %indvar.next2 = add i64 %indvar1, 1
  br label %1

; <label>:8                                       ; preds = %1
  %9 = trunc i64 %msgLen to i32
  %10 = getelementptr inbounds i8* %data, i32 %9
  store i8 -128, i8* %10, align 1
  %11 = add i32 %9, 1
  br label %12

; <label>:12                                      ; preds = %15, %8
  %indvar = phi i32 [ %indvar.next, %15 ], [ 0, %8 ]
  %i.1.in = add i32 %9, %indvar
  %i.1 = add i32 %11, %indvar
  %scevgep = getelementptr i8* %data, i32 %i.1
  %13 = and i32 %i.1, 63
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %16, label %15

; <label>:15                                      ; preds = %12
  store i8 0, i8* %scevgep, align 1
  %indvar.next = add i32 %indvar, 1
  br label %12

; <label>:16                                      ; preds = %12
  %i.1.lcssa = phi i32 [ %i.1, %12 ]
  %i.1.in.lcssa = phi i32 [ %i.1.in, %12 ]
  %17 = shl i64 %msgLen, 3
  %18 = add nsw i32 %i.1.in.lcssa, -1
  %19 = getelementptr inbounds i8* %data, i32 %18
  store i8 0, i8* %19, align 1
  %20 = trunc i64 %17 to i8
  %21 = getelementptr inbounds i8* %data, i32 %i.1.in.lcssa
  store i8 %20, i8* %21, align 1
  %22 = sdiv i32 %i.1.lcssa, 64
  ret i32 %22
}

; Function Attrs: noinline nounwind
define internal void @outerloop(i32* %digest, i8* %data, i32 %numBlocks) #0 {
  %W = alloca [64 x i32], align 4
  %1 = icmp sgt i32 %numBlocks, 0
  %smax = select i1 %1, i32 %numBlocks, i32 0
  br label %2

; <label>:2                                       ; preds = %121, %0
  %h7.0 = phi i32 [ 1541459225, %0 ], [ %122, %121 ]
  %h6.0 = phi i32 [ 528734635, %0 ], [ %123, %121 ]
  %h5.0 = phi i32 [ -1694144372, %0 ], [ %124, %121 ]
  %h4.0 = phi i32 [ 1359893119, %0 ], [ %125, %121 ]
  %h3.0 = phi i32 [ -1521486534, %0 ], [ %126, %121 ]
  %h2.0 = phi i32 [ 1013904242, %0 ], [ %127, %121 ]
  %h1.0 = phi i32 [ -1150833019, %0 ], [ %128, %121 ]
  %h0.0 = phi i32 [ 1779033703, %0 ], [ %129, %121 ]
  %3 = phi i32 [ 0, %0 ], [ %130, %121 ]
  %4 = mul i32 %3, 64
  %5 = add i32 %4, 1
  %6 = add i32 %4, 2
  %7 = add i32 %4, 3
  %exitcond14 = icmp ne i32 %3, %smax
  br i1 %exitcond14, label %8, label %131

; <label>:8                                       ; preds = %2
  br label %9

; <label>:9                                       ; preds = %32, %8
  %10 = phi i32 [ 0, %8 ], [ %33, %32 ]
  %11 = mul i32 %10, 4
  %12 = add i32 %4, %11
  %scevgep4 = getelementptr i8* %data, i32 %12
  %13 = add i32 %5, %11
  %scevgep3 = getelementptr i8* %data, i32 %13
  %14 = add i32 %6, %11
  %scevgep2 = getelementptr i8* %data, i32 %14
  %15 = add i32 %7, %11
  %scevgep1 = getelementptr i8* %data, i32 %15
  %scevgep = getelementptr [64 x i32]* %W, i32 0, i32 %10
  %exitcond = icmp ne i32 %10, 16
  br i1 %exitcond, label %16, label %34

; <label>:16                                      ; preds = %9
  %17 = load i8* %scevgep4, align 1
  %18 = zext i8 %17 to i32
  %19 = shl nuw i32 %18, 24
  %20 = load i8* %scevgep3, align 1
  %21 = zext i8 %20 to i32
  %22 = shl nuw nsw i32 %21, 16
  %23 = or i32 %19, %22
  %24 = load i8* %scevgep2, align 1
  %25 = zext i8 %24 to i32
  %26 = shl nuw nsw i32 %25, 8
  %27 = or i32 %23, %26
  %28 = load i8* %scevgep1, align 1
  %29 = zext i8 %28 to i32
  %30 = or i32 %27, %29
  store i32 %30, i32* %scevgep, align 4
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 %30) #3
  br label %32

; <label>:32                                      ; preds = %16
  %33 = add nsw i32 %10, 1
  br label %9

; <label>:34                                      ; preds = %9
  br label %35

; <label>:35                                      ; preds = %74, %34
  %indvar = phi i32 [ %indvar.next, %74 ], [ 0, %34 ]
  %t.1 = add i32 %indvar, 16
  %scevgep6 = getelementptr [64 x i32]* %W, i32 0, i32 %t.1
  %scevgep7 = getelementptr [64 x i32]* %W, i32 0, i32 %indvar
  %36 = add i32 %indvar, 1
  %scevgep8 = getelementptr [64 x i32]* %W, i32 0, i32 %36
  %37 = add i32 %indvar, 9
  %scevgep9 = getelementptr [64 x i32]* %W, i32 0, i32 %37
  %38 = add i32 %indvar, 14
  %scevgep10 = getelementptr [64 x i32]* %W, i32 0, i32 %38
  %exitcond5 = icmp ne i32 %indvar, 48
  br i1 %exitcond5, label %39, label %75

; <label>:39                                      ; preds = %35
  %40 = load i32* %scevgep10, align 4
  %41 = lshr i32 %40, 17
  %42 = load i32* %scevgep10, align 4
  %43 = shl i32 %42, 15
  %44 = or i32 %41, %43
  %45 = load i32* %scevgep10, align 4
  %46 = lshr i32 %45, 19
  %47 = load i32* %scevgep10, align 4
  %48 = shl i32 %47, 13
  %49 = or i32 %46, %48
  %50 = xor i32 %44, %49
  %51 = load i32* %scevgep10, align 4
  %52 = lshr i32 %51, 10
  %53 = xor i32 %50, %52
  %54 = load i32* %scevgep9, align 4
  %55 = add i32 %53, %54
  %56 = load i32* %scevgep8, align 4
  %57 = lshr i32 %56, 7
  %58 = load i32* %scevgep8, align 4
  %59 = shl i32 %58, 25
  %60 = or i32 %57, %59
  %61 = load i32* %scevgep8, align 4
  %62 = lshr i32 %61, 18
  %63 = load i32* %scevgep8, align 4
  %64 = shl i32 %63, 14
  %65 = or i32 %62, %64
  %66 = xor i32 %60, %65
  %67 = load i32* %scevgep8, align 4
  %68 = lshr i32 %67, 3
  %69 = xor i32 %66, %68
  %70 = add i32 %55, %69
  %71 = load i32* %scevgep7, align 4
  %72 = add i32 %70, %71
  store i32 %72, i32* %scevgep6, align 4
  %73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 %72) #3
  br label %74

; <label>:74                                      ; preds = %39
  %indvar.next = add i32 %indvar, 1
  br label %35

; <label>:75                                      ; preds = %35
  br label %76

; <label>:76                                      ; preds = %100, %75
  %h.0 = phi i32 [ %h7.0, %75 ], [ %g.0, %100 ]
  %g.0 = phi i32 [ %h6.0, %75 ], [ %f.0, %100 ]
  %f.0 = phi i32 [ %h5.0, %75 ], [ %e.0, %100 ]
  %e.0 = phi i32 [ %h4.0, %75 ], [ %118, %100 ]
  %d.0 = phi i32 [ %h3.0, %75 ], [ %c.0, %100 ]
  %c.0 = phi i32 [ %h2.0, %75 ], [ %b.0, %100 ]
  %b.0 = phi i32 [ %h1.0, %75 ], [ %a.0, %100 ]
  %a.0 = phi i32 [ %h0.0, %75 ], [ %117, %100 ]
  %77 = phi i32 [ 0, %75 ], [ %119, %100 ]
  %scevgep12 = getelementptr [64 x i32]* %W, i32 0, i32 %77
  %scevgep13 = getelementptr [64 x i32]* @k, i32 0, i32 %77
  %exitcond11 = icmp ne i32 %77, 64
  br i1 %exitcond11, label %78, label %120

; <label>:78                                      ; preds = %76
  %79 = lshr i32 %e.0, 6
  %80 = shl i32 %e.0, 26
  %81 = or i32 %79, %80
  %82 = lshr i32 %e.0, 11
  %83 = shl i32 %e.0, 21
  %84 = or i32 %82, %83
  %85 = xor i32 %81, %84
  %86 = lshr i32 %e.0, 25
  %87 = shl i32 %e.0, 7
  %88 = or i32 %86, %87
  %89 = xor i32 %85, %88
  %90 = add i32 %h.0, %89
  %91 = and i32 %e.0, %f.0
  %92 = xor i32 %e.0, -1
  %93 = and i32 %g.0, %92
  %94 = xor i32 %91, %93
  %95 = add i32 %90, %94
  %96 = load i32* %scevgep13, align 4
  %97 = add i32 %95, %96
  %98 = load i32* %scevgep12, align 4
  %99 = add i32 %97, %98
  br label %100

; <label>:100                                     ; preds = %78
  %101 = lshr i32 %a.0, 2
  %102 = shl i32 %a.0, 30
  %103 = or i32 %101, %102
  %104 = lshr i32 %a.0, 13
  %105 = shl i32 %a.0, 19
  %106 = or i32 %104, %105
  %107 = xor i32 %103, %106
  %108 = lshr i32 %a.0, 22
  %109 = shl i32 %a.0, 10
  %110 = or i32 %108, %109
  %111 = xor i32 %107, %110
  %112 = xor i32 %b.0, %c.0
  %113 = and i32 %a.0, %112
  %114 = and i32 %b.0, %c.0
  %115 = xor i32 %113, %114
  %116 = add i32 %111, %115
  %117 = add i32 %99, %116
  %118 = add i32 %d.0, %99
  %119 = add nsw i32 %77, 1
  br label %76

; <label>:120                                     ; preds = %76
  %a.0.lcssa = phi i32 [ %a.0, %76 ]
  %b.0.lcssa = phi i32 [ %b.0, %76 ]
  %c.0.lcssa = phi i32 [ %c.0, %76 ]
  %d.0.lcssa = phi i32 [ %d.0, %76 ]
  %e.0.lcssa = phi i32 [ %e.0, %76 ]
  %f.0.lcssa = phi i32 [ %f.0, %76 ]
  %g.0.lcssa = phi i32 [ %g.0, %76 ]
  %h.0.lcssa = phi i32 [ %h.0, %76 ]
  br label %121

; <label>:121                                     ; preds = %120
  %122 = add i32 %h.0.lcssa, %h7.0
  %123 = add i32 %g.0.lcssa, %h6.0
  %124 = add i32 %f.0.lcssa, %h5.0
  %125 = add i32 %e.0.lcssa, %h4.0
  %126 = add i32 %d.0.lcssa, %h3.0
  %127 = add i32 %c.0.lcssa, %h2.0
  %128 = add i32 %b.0.lcssa, %h1.0
  %129 = add i32 %a.0.lcssa, %h0.0
  %130 = add nsw i32 %3, 1
  br label %2

; <label>:131                                     ; preds = %2
  %h0.0.lcssa = phi i32 [ %h0.0, %2 ]
  %h1.0.lcssa = phi i32 [ %h1.0, %2 ]
  %h2.0.lcssa = phi i32 [ %h2.0, %2 ]
  %h3.0.lcssa = phi i32 [ %h3.0, %2 ]
  %h4.0.lcssa = phi i32 [ %h4.0, %2 ]
  %h5.0.lcssa = phi i32 [ %h5.0, %2 ]
  %h6.0.lcssa = phi i32 [ %h6.0, %2 ]
  %h7.0.lcssa = phi i32 [ %h7.0, %2 ]
  store i32 %h0.0.lcssa, i32* %digest, align 4
  %132 = getelementptr inbounds i32* %digest, i32 1
  store i32 %h1.0.lcssa, i32* %132, align 4
  %133 = getelementptr inbounds i32* %digest, i32 2
  store i32 %h2.0.lcssa, i32* %133, align 4
  %134 = getelementptr inbounds i32* %digest, i32 3
  store i32 %h3.0.lcssa, i32* %134, align 4
  %135 = getelementptr inbounds i32* %digest, i32 4
  store i32 %h4.0.lcssa, i32* %135, align 4
  %136 = getelementptr inbounds i32* %digest, i32 5
  store i32 %h5.0.lcssa, i32* %136, align 4
  %137 = getelementptr inbounds i32* %digest, i32 6
  store i32 %h6.0.lcssa, i32* %137, align 4
  %138 = getelementptr inbounds i32* %digest, i32 7
  store i32 %h7.0.lcssa, i32* %138, align 4
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

; <label>:4                                       ; preds = %9, %0
  %5 = phi i32 [ 0, %0 ], [ %10, %9 ]
  %scevgep = getelementptr [8 x i32]* @gDigest, i32 0, i32 %5
  %exitcond = icmp ne i32 %5, 8
  br i1 %exitcond, label %6, label %11

; <label>:6                                       ; preds = %4
  %7 = load i32* %scevgep, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str3, i32 0, i32 0), i32 %7) #3
  br label %9

; <label>:9                                       ; preds = %6
  %10 = add nsw i32 %5, 1
  br label %4

; <label>:11                                      ; preds = %4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)) #3
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
