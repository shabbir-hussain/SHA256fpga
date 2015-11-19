; ModuleID = 'sha256.bc'
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
  %2 = phi i32 [ %7, %3 ], [ 0, %0 ]
  %exitcond = icmp eq i64 %indvar1, %msgLen
  br i1 %exitcond, label %8, label %3

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
  %13 = and i32 %i.1, 63
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %16, label %15

; <label>:15                                      ; preds = %12
  %scevgep = getelementptr i8* %data, i32 %i.1
  store i8 0, i8* %scevgep, align 1
  %indvar.next = add i32 %indvar, 1
  br label %12

; <label>:16                                      ; preds = %12
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
  %1 = icmp sgt i32 %numBlocks, 0
  %smax = select i1 %1, i32 %numBlocks, i32 0
  br label %2

; <label>:2                                       ; preds = %115, %0
  %h7.0 = phi i32 [ 1541459225, %0 ], [ %116, %115 ]
  %h6.0 = phi i32 [ 528734635, %0 ], [ %117, %115 ]
  %h5.0 = phi i32 [ -1694144372, %0 ], [ %118, %115 ]
  %h4.0 = phi i32 [ 1359893119, %0 ], [ %119, %115 ]
  %h3.0 = phi i32 [ -1521486534, %0 ], [ %120, %115 ]
  %h2.0 = phi i32 [ 1013904242, %0 ], [ %121, %115 ]
  %h1.0 = phi i32 [ -1150833019, %0 ], [ %122, %115 ]
  %h0.0 = phi i32 [ 1779033703, %0 ], [ %123, %115 ]
  %3 = phi i32 [ 0, %0 ], [ %124, %115 ]
  %4 = shl i32 %3, 6
  %5 = or i32 %4, 1
  %6 = or i32 %4, 2
  %7 = or i32 %4, 3
  %exitcond14 = icmp eq i32 %3, %smax
  br i1 %exitcond14, label %125, label %8

; <label>:8                                       ; preds = %2
  br label %9

; <label>:9                                       ; preds = %32, %8
  %10 = phi i32 [ 0, %8 ], [ %33, %32 ]
  %11 = shl i32 %10, 2
  %exitcond = icmp eq i32 %10, 16
  br i1 %exitcond, label %34, label %12

; <label>:12                                      ; preds = %9
  %scevgep = getelementptr [64 x i32]* %W, i32 0, i32 %10
  %13 = add i32 %7, %11
  %scevgep1 = getelementptr i8* %data, i32 %13
  %14 = add i32 %6, %11
  %scevgep2 = getelementptr i8* %data, i32 %14
  %15 = add i32 %5, %11
  %scevgep3 = getelementptr i8* %data, i32 %15
  %16 = add i32 %4, %11
  %scevgep4 = getelementptr i8* %data, i32 %16
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

; <label>:32                                      ; preds = %12
  %33 = add nsw i32 %10, 1
  br label %9

; <label>:34                                      ; preds = %9
  br label %35

; <label>:35                                      ; preds = %68, %34
  %indvar = phi i32 [ %indvar.next, %68 ], [ 0, %34 ]
  %36 = add i32 %indvar, 1
  %scevgep8 = getelementptr [64 x i32]* %W, i32 0, i32 %36
  %37 = add i32 %indvar, 14
  %scevgep10 = getelementptr [64 x i32]* %W, i32 0, i32 %37
  %exitcond5 = icmp eq i32 %indvar, 48
  br i1 %exitcond5, label %69, label %38

; <label>:38                                      ; preds = %35
  %39 = add i32 %indvar, 9
  %scevgep9 = getelementptr [64 x i32]* %W, i32 0, i32 %39
  %scevgep7 = getelementptr [64 x i32]* %W, i32 0, i32 %indvar
  %t.1 = add i32 %indvar, 16
  %scevgep6 = getelementptr [64 x i32]* %W, i32 0, i32 %t.1
  %40 = load i32* %scevgep10, align 4
  %41 = lshr i32 %40, 17
  %42 = shl i32 %40, 15
  %43 = or i32 %41, %42
  %44 = lshr i32 %40, 19
  %45 = shl i32 %40, 13
  %46 = or i32 %44, %45
  %47 = xor i32 %43, %46
  %48 = load i32* %scevgep10, align 4
  %49 = lshr i32 %48, 10
  %50 = xor i32 %47, %49
  %51 = load i32* %scevgep9, align 4
  %52 = add i32 %50, %51
  %53 = load i32* %scevgep8, align 4
  %54 = lshr i32 %53, 7
  %55 = shl i32 %53, 25
  %56 = or i32 %54, %55
  %57 = lshr i32 %53, 18
  %58 = shl i32 %53, 14
  %59 = or i32 %57, %58
  %60 = xor i32 %56, %59
  %61 = load i32* %scevgep8, align 4
  %62 = lshr i32 %61, 3
  %63 = xor i32 %60, %62
  %64 = add i32 %52, %63
  %65 = load i32* %scevgep7, align 4
  %66 = add i32 %64, %65
  store i32 %66, i32* %scevgep6, align 4
  %67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 %66) #3
  br label %68

; <label>:68                                      ; preds = %38
  %indvar.next = add i32 %indvar, 1
  br label %35

; <label>:69                                      ; preds = %35
  br label %70

; <label>:70                                      ; preds = %94, %69
  %h.0 = phi i32 [ %h7.0, %69 ], [ %g.0, %94 ]
  %g.0 = phi i32 [ %h6.0, %69 ], [ %f.0, %94 ]
  %f.0 = phi i32 [ %h5.0, %69 ], [ %e.0, %94 ]
  %e.0 = phi i32 [ %h4.0, %69 ], [ %112, %94 ]
  %d.0 = phi i32 [ %h3.0, %69 ], [ %c.0, %94 ]
  %c.0 = phi i32 [ %h2.0, %69 ], [ %b.0, %94 ]
  %b.0 = phi i32 [ %h1.0, %69 ], [ %a.0, %94 ]
  %a.0 = phi i32 [ %h0.0, %69 ], [ %111, %94 ]
  %71 = phi i32 [ 0, %69 ], [ %113, %94 ]
  %exitcond11 = icmp eq i32 %71, 64
  br i1 %exitcond11, label %114, label %72

; <label>:72                                      ; preds = %70
  %scevgep13 = getelementptr [64 x i32]* @k, i32 0, i32 %71
  %scevgep12 = getelementptr [64 x i32]* %W, i32 0, i32 %71
  %73 = lshr i32 %e.0, 6
  %74 = shl i32 %e.0, 26
  %75 = or i32 %73, %74
  %76 = lshr i32 %e.0, 11
  %77 = shl i32 %e.0, 21
  %78 = or i32 %76, %77
  %79 = xor i32 %75, %78
  %80 = lshr i32 %e.0, 25
  %81 = shl i32 %e.0, 7
  %82 = or i32 %80, %81
  %83 = xor i32 %79, %82
  %84 = add i32 %h.0, %83
  %85 = and i32 %e.0, %f.0
  %86 = xor i32 %e.0, -1
  %87 = and i32 %g.0, %86
  %88 = xor i32 %85, %87
  %89 = add i32 %84, %88
  %90 = load i32* %scevgep13, align 4
  %91 = add i32 %89, %90
  %92 = load i32* %scevgep12, align 4
  %93 = add i32 %91, %92
  br label %94

; <label>:94                                      ; preds = %72
  %95 = lshr i32 %a.0, 2
  %96 = shl i32 %a.0, 30
  %97 = or i32 %95, %96
  %98 = lshr i32 %a.0, 13
  %99 = shl i32 %a.0, 19
  %100 = or i32 %98, %99
  %101 = xor i32 %97, %100
  %102 = lshr i32 %a.0, 22
  %103 = shl i32 %a.0, 10
  %104 = or i32 %102, %103
  %105 = xor i32 %101, %104
  %106 = xor i32 %b.0, %c.0
  %107 = and i32 %a.0, %106
  %108 = and i32 %b.0, %c.0
  %109 = xor i32 %107, %108
  %110 = add i32 %105, %109
  %111 = add i32 %93, %110
  %112 = add i32 %d.0, %93
  %113 = add nsw i32 %71, 1
  br label %70

; <label>:114                                     ; preds = %70
  br label %115

; <label>:115                                     ; preds = %114
  %116 = add i32 %h.0, %h7.0
  %117 = add i32 %g.0, %h6.0
  %118 = add i32 %f.0, %h5.0
  %119 = add i32 %e.0, %h4.0
  %120 = add i32 %d.0, %h3.0
  %121 = add i32 %c.0, %h2.0
  %122 = add i32 %b.0, %h1.0
  %123 = add i32 %a.0, %h0.0
  %124 = add nsw i32 %3, 1
  br label %2

; <label>:125                                     ; preds = %2
  store i32 %h0.0, i32* %digest, align 4
  %126 = getelementptr inbounds i32* %digest, i32 1
  store i32 %h1.0, i32* %126, align 4
  %127 = getelementptr inbounds i32* %digest, i32 2
  store i32 %h2.0, i32* %127, align 4
  %128 = getelementptr inbounds i32* %digest, i32 3
  store i32 %h3.0, i32* %128, align 4
  %129 = getelementptr inbounds i32* %digest, i32 4
  store i32 %h4.0, i32* %129, align 4
  %130 = getelementptr inbounds i32* %digest, i32 5
  store i32 %h5.0, i32* %130, align 4
  %131 = getelementptr inbounds i32* %digest, i32 6
  store i32 %h6.0, i32* %131, align 4
  %132 = getelementptr inbounds i32* %digest, i32 7
  store i32 %h7.0, i32* %132, align 4
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
  %exitcond = icmp eq i32 %5, 8
  br i1 %exitcond, label %11, label %6

; <label>:6                                       ; preds = %4
  %scevgep = getelementptr [8 x i32]* @gDigest, i32 0, i32 %5
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
