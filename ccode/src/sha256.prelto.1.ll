; ModuleID = 'sha256.prelto.1.bc'
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
  %1 = alloca i8*, align 4
  %2 = alloca i8*, align 4
  %3 = alloca i64, align 8
  %i = alloca i32, align 4
  %numBlocks = alloca i32, align 4
  store i8* %data, i8** %1, align 4
  store i8* %msg, i8** %2, align 4
  store i64 %msgLen, i64* %3, align 8
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %9, %0
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = load i64* %3, align 8
  %8 = icmp ult i64 %6, %7
  br i1 %8, label %9, label %19

; <label>:9                                       ; preds = %4
  %10 = load i32* %i, align 4
  %11 = load i8** %2, align 4
  %12 = getelementptr inbounds i8* %11, i32 %10
  %13 = load i8* %12, align 1
  %14 = load i32* %i, align 4
  %15 = load i8** %1, align 4
  %16 = getelementptr inbounds i8* %15, i32 %14
  store i8 %13, i8* %16, align 1
  %17 = load i32* %i, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %i, align 4
  br label %4

; <label>:19                                      ; preds = %4
  %20 = load i32* %i, align 4
  %21 = load i8** %1, align 4
  %22 = getelementptr inbounds i8* %21, i32 %20
  store i8 -128, i8* %22, align 1
  %23 = load i32* %i, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %i, align 4
  br label %25

; <label>:25                                      ; preds = %29, %19
  %26 = load i32* %i, align 4
  %27 = srem i32 %26, 64
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %35

; <label>:29                                      ; preds = %25
  %30 = load i32* %i, align 4
  %31 = load i8** %1, align 4
  %32 = getelementptr inbounds i8* %31, i32 %30
  store i8 0, i8* %32, align 1
  %33 = load i32* %i, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %i, align 4
  br label %25

; <label>:35                                      ; preds = %25
  %36 = load i64* %3, align 8
  %37 = mul i64 %36, 8
  store i64 %37, i64* %3, align 8
  %38 = load i64* %3, align 8
  %39 = and i64 %38, -4294967296
  %40 = trunc i64 %39 to i8
  %41 = load i32* %i, align 4
  %42 = sub nsw i32 %41, 2
  %43 = load i8** %1, align 4
  %44 = getelementptr inbounds i8* %43, i32 %42
  store i8 %40, i8* %44, align 1
  %45 = load i64* %3, align 8
  %46 = and i64 %45, 4294967295
  %47 = trunc i64 %46 to i8
  %48 = load i32* %i, align 4
  %49 = sub nsw i32 %48, 1
  %50 = load i8** %1, align 4
  %51 = getelementptr inbounds i8* %50, i32 %49
  store i8 %47, i8* %51, align 1
  %52 = load i32* %i, align 4
  %53 = sdiv i32 %52, 64
  store i32 %53, i32* %numBlocks, align 4
  %54 = load i32* %numBlocks, align 4
  ret i32 %54
}

; Function Attrs: noinline nounwind
define void @outerloop(i32* %digest, i8* %data, i32 %numBlocks) #0 {
  %1 = alloca i32*, align 4
  %2 = alloca i8*, align 4
  %3 = alloca i32, align 4
  %h0 = alloca i32, align 4
  %h1 = alloca i32, align 4
  %h2 = alloca i32, align 4
  %h3 = alloca i32, align 4
  %h4 = alloca i32, align 4
  %h5 = alloca i32, align 4
  %h6 = alloca i32, align 4
  %h7 = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %f = alloca i32, align 4
  %g = alloca i32, align 4
  %h = alloca i32, align 4
  %Mi = alloca i8*, align 4
  %i = alloca i32, align 4
  %W = alloca [64 x i32], align 4
  %t = alloca i32, align 4
  %T1 = alloca i32, align 4
  %T2 = alloca i32, align 4
  store i32* %digest, i32** %1, align 4
  store i8* %data, i8** %2, align 4
  store i32 %numBlocks, i32* %3, align 4
  %4 = load i8** %2, align 4
  store i8* %4, i8** %Mi, align 4
  store i32 1779033703, i32* %h0, align 4
  store i32 -1150833019, i32* %h1, align 4
  store i32 1013904242, i32* %h2, align 4
  store i32 -1521486534, i32* %h3, align 4
  store i32 1359893119, i32* %h4, align 4
  store i32 -1694144372, i32* %h5, align 4
  store i32 528734635, i32* %h6, align 4
  store i32 1541459225, i32* %h7, align 4
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %259, %0
  %6 = load i32* %i, align 4
  %7 = load i32* %3, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %262

; <label>:9                                       ; preds = %5
  store i32 0, i32* %t, align 4
  store i32 0, i32* %t, align 4
  br label %10

; <label>:10                                      ; preds = %53, %9
  %11 = load i32* %t, align 4
  %12 = icmp slt i32 %11, 16
  br i1 %12, label %13, label %56

; <label>:13                                      ; preds = %10
  %14 = load i32* %t, align 4
  %15 = mul nsw i32 4, %14
  %16 = load i8** %Mi, align 4
  %17 = getelementptr inbounds i8* %16, i32 %15
  %18 = load i8* %17, align 1
  %19 = zext i8 %18 to i32
  %20 = shl i32 %19, 24
  %21 = load i32* %t, align 4
  %22 = mul nsw i32 4, %21
  %23 = add nsw i32 %22, 1
  %24 = load i8** %Mi, align 4
  %25 = getelementptr inbounds i8* %24, i32 %23
  %26 = load i8* %25, align 1
  %27 = zext i8 %26 to i32
  %28 = shl i32 %27, 16
  %29 = add nsw i32 %20, %28
  %30 = load i32* %t, align 4
  %31 = mul nsw i32 4, %30
  %32 = add nsw i32 %31, 2
  %33 = load i8** %Mi, align 4
  %34 = getelementptr inbounds i8* %33, i32 %32
  %35 = load i8* %34, align 1
  %36 = zext i8 %35 to i32
  %37 = shl i32 %36, 8
  %38 = add nsw i32 %29, %37
  %39 = load i32* %t, align 4
  %40 = mul nsw i32 4, %39
  %41 = add nsw i32 %40, 3
  %42 = load i8** %Mi, align 4
  %43 = getelementptr inbounds i8* %42, i32 %41
  %44 = load i8* %43, align 1
  %45 = zext i8 %44 to i32
  %46 = add nsw i32 %38, %45
  %47 = load i32* %t, align 4
  %48 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %47
  store i32 %46, i32* %48, align 4
  %49 = load i32* %t, align 4
  %50 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %49
  %51 = load i32* %50, align 4
  %52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 %51) #3
  br label %53

; <label>:53                                      ; preds = %13
  %54 = load i32* %t, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, i32* %t, align 4
  br label %10

; <label>:56                                      ; preds = %10
  br label %57

; <label>:57                                      ; preds = %136, %56
  %58 = load i32* %t, align 4
  %59 = icmp slt i32 %58, 64
  br i1 %59, label %60, label %139

; <label>:60                                      ; preds = %57
  %61 = load i32* %t, align 4
  %62 = sub nsw i32 %61, 2
  %63 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %62
  %64 = load i32* %63, align 4
  %65 = lshr i32 %64, 17
  %66 = load i32* %t, align 4
  %67 = sub nsw i32 %66, 2
  %68 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %67
  %69 = load i32* %68, align 4
  %70 = shl i32 %69, 15
  %71 = or i32 %65, %70
  %72 = load i32* %t, align 4
  %73 = sub nsw i32 %72, 2
  %74 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %73
  %75 = load i32* %74, align 4
  %76 = lshr i32 %75, 19
  %77 = load i32* %t, align 4
  %78 = sub nsw i32 %77, 2
  %79 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %78
  %80 = load i32* %79, align 4
  %81 = shl i32 %80, 13
  %82 = or i32 %76, %81
  %83 = xor i32 %71, %82
  %84 = load i32* %t, align 4
  %85 = sub nsw i32 %84, 2
  %86 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %85
  %87 = load i32* %86, align 4
  %88 = lshr i32 %87, 10
  %89 = xor i32 %83, %88
  %90 = load i32* %t, align 4
  %91 = sub nsw i32 %90, 7
  %92 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %91
  %93 = load i32* %92, align 4
  %94 = add i32 %89, %93
  %95 = load i32* %t, align 4
  %96 = sub nsw i32 %95, 15
  %97 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %96
  %98 = load i32* %97, align 4
  %99 = lshr i32 %98, 7
  %100 = load i32* %t, align 4
  %101 = sub nsw i32 %100, 15
  %102 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %101
  %103 = load i32* %102, align 4
  %104 = shl i32 %103, 25
  %105 = or i32 %99, %104
  %106 = load i32* %t, align 4
  %107 = sub nsw i32 %106, 15
  %108 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %107
  %109 = load i32* %108, align 4
  %110 = lshr i32 %109, 18
  %111 = load i32* %t, align 4
  %112 = sub nsw i32 %111, 15
  %113 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %112
  %114 = load i32* %113, align 4
  %115 = shl i32 %114, 14
  %116 = or i32 %110, %115
  %117 = xor i32 %105, %116
  %118 = load i32* %t, align 4
  %119 = sub nsw i32 %118, 15
  %120 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %119
  %121 = load i32* %120, align 4
  %122 = lshr i32 %121, 3
  %123 = xor i32 %117, %122
  %124 = add i32 %94, %123
  %125 = load i32* %t, align 4
  %126 = sub nsw i32 %125, 16
  %127 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %126
  %128 = load i32* %127, align 4
  %129 = add i32 %124, %128
  %130 = load i32* %t, align 4
  %131 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %130
  store i32 %129, i32* %131, align 4
  %132 = load i32* %t, align 4
  %133 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %132
  %134 = load i32* %133, align 4
  %135 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 %134) #3
  br label %136

; <label>:136                                     ; preds = %60
  %137 = load i32* %t, align 4
  %138 = add nsw i32 %137, 1
  store i32 %138, i32* %t, align 4
  br label %57

; <label>:139                                     ; preds = %57
  %140 = load i32* %h0, align 4
  store i32 %140, i32* %a, align 4
  %141 = load i32* %h1, align 4
  store i32 %141, i32* %b, align 4
  %142 = load i32* %h2, align 4
  store i32 %142, i32* %c, align 4
  %143 = load i32* %h3, align 4
  store i32 %143, i32* %d, align 4
  %144 = load i32* %h4, align 4
  store i32 %144, i32* %e, align 4
  %145 = load i32* %h5, align 4
  store i32 %145, i32* %f, align 4
  %146 = load i32* %h6, align 4
  store i32 %146, i32* %g, align 4
  %147 = load i32* %h7, align 4
  store i32 %147, i32* %h, align 4
  store i32 0, i32* %t, align 4
  br label %148

; <label>:148                                     ; preds = %229, %139
  %149 = load i32* %t, align 4
  %150 = icmp slt i32 %149, 64
  br i1 %150, label %151, label %232

; <label>:151                                     ; preds = %148
  %152 = load i32* %h, align 4
  %153 = load i32* %e, align 4
  %154 = lshr i32 %153, 6
  %155 = load i32* %e, align 4
  %156 = shl i32 %155, 26
  %157 = or i32 %154, %156
  %158 = load i32* %e, align 4
  %159 = lshr i32 %158, 11
  %160 = load i32* %e, align 4
  %161 = shl i32 %160, 21
  %162 = or i32 %159, %161
  %163 = xor i32 %157, %162
  %164 = load i32* %e, align 4
  %165 = lshr i32 %164, 25
  %166 = load i32* %e, align 4
  %167 = shl i32 %166, 7
  %168 = or i32 %165, %167
  %169 = xor i32 %163, %168
  %170 = add i32 %152, %169
  %171 = load i32* %e, align 4
  %172 = load i32* %f, align 4
  %173 = and i32 %171, %172
  %174 = load i32* %e, align 4
  %175 = xor i32 %174, -1
  %176 = load i32* %g, align 4
  %177 = and i32 %175, %176
  %178 = xor i32 %173, %177
  %179 = add i32 %170, %178
  %180 = load i32* %t, align 4
  %181 = getelementptr inbounds [64 x i32]* @k, i32 0, i32 %180
  %182 = load i32* %181, align 4
  %183 = add i32 %179, %182
  %184 = load i32* %t, align 4
  %185 = getelementptr inbounds [64 x i32]* %W, i32 0, i32 %184
  %186 = load i32* %185, align 4
  %187 = add i32 %183, %186
  store i32 %187, i32* %T1, align 4
  %188 = load i32* %a, align 4
  %189 = lshr i32 %188, 2
  %190 = load i32* %a, align 4
  %191 = shl i32 %190, 30
  %192 = or i32 %189, %191
  %193 = load i32* %a, align 4
  %194 = lshr i32 %193, 13
  %195 = load i32* %a, align 4
  %196 = shl i32 %195, 19
  %197 = or i32 %194, %196
  %198 = xor i32 %192, %197
  %199 = load i32* %a, align 4
  %200 = lshr i32 %199, 22
  %201 = load i32* %a, align 4
  %202 = shl i32 %201, 10
  %203 = or i32 %200, %202
  %204 = xor i32 %198, %203
  %205 = load i32* %a, align 4
  %206 = load i32* %b, align 4
  %207 = and i32 %205, %206
  %208 = load i32* %a, align 4
  %209 = load i32* %c, align 4
  %210 = and i32 %208, %209
  %211 = xor i32 %207, %210
  %212 = load i32* %b, align 4
  %213 = load i32* %c, align 4
  %214 = and i32 %212, %213
  %215 = xor i32 %211, %214
  %216 = add i32 %204, %215
  store i32 %216, i32* %T2, align 4
  %217 = load i32* %g, align 4
  store i32 %217, i32* %h, align 4
  %218 = load i32* %f, align 4
  store i32 %218, i32* %g, align 4
  %219 = load i32* %e, align 4
  store i32 %219, i32* %f, align 4
  %220 = load i32* %d, align 4
  %221 = load i32* %T1, align 4
  %222 = add i32 %220, %221
  store i32 %222, i32* %e, align 4
  %223 = load i32* %c, align 4
  store i32 %223, i32* %d, align 4
  %224 = load i32* %b, align 4
  store i32 %224, i32* %c, align 4
  %225 = load i32* %a, align 4
  store i32 %225, i32* %b, align 4
  %226 = load i32* %T1, align 4
  %227 = load i32* %T2, align 4
  %228 = add i32 %226, %227
  store i32 %228, i32* %a, align 4
  br label %229

; <label>:229                                     ; preds = %151
  %230 = load i32* %t, align 4
  %231 = add nsw i32 %230, 1
  store i32 %231, i32* %t, align 4
  br label %148

; <label>:232                                     ; preds = %148
  %233 = load i32* %a, align 4
  %234 = load i32* %h0, align 4
  %235 = add i32 %233, %234
  store i32 %235, i32* %h0, align 4
  %236 = load i32* %b, align 4
  %237 = load i32* %h1, align 4
  %238 = add i32 %236, %237
  store i32 %238, i32* %h1, align 4
  %239 = load i32* %c, align 4
  %240 = load i32* %h2, align 4
  %241 = add i32 %239, %240
  store i32 %241, i32* %h2, align 4
  %242 = load i32* %d, align 4
  %243 = load i32* %h3, align 4
  %244 = add i32 %242, %243
  store i32 %244, i32* %h3, align 4
  %245 = load i32* %e, align 4
  %246 = load i32* %h4, align 4
  %247 = add i32 %245, %246
  store i32 %247, i32* %h4, align 4
  %248 = load i32* %f, align 4
  %249 = load i32* %h5, align 4
  %250 = add i32 %248, %249
  store i32 %250, i32* %h5, align 4
  %251 = load i32* %g, align 4
  %252 = load i32* %h6, align 4
  %253 = add i32 %251, %252
  store i32 %253, i32* %h6, align 4
  %254 = load i32* %h, align 4
  %255 = load i32* %h7, align 4
  %256 = add i32 %254, %255
  store i32 %256, i32* %h7, align 4
  %257 = load i8** %Mi, align 4
  %258 = getelementptr inbounds i8* %257, i32 64
  store i8* %258, i8** %Mi, align 4
  br label %259

; <label>:259                                     ; preds = %232
  %260 = load i32* %i, align 4
  %261 = add nsw i32 %260, 1
  store i32 %261, i32* %i, align 4
  br label %5

; <label>:262                                     ; preds = %5
  %263 = load i32* %h0, align 4
  %264 = load i32** %1, align 4
  %265 = getelementptr inbounds i32* %264, i32 0
  store i32 %263, i32* %265, align 4
  %266 = load i32* %h1, align 4
  %267 = load i32** %1, align 4
  %268 = getelementptr inbounds i32* %267, i32 1
  store i32 %266, i32* %268, align 4
  %269 = load i32* %h2, align 4
  %270 = load i32** %1, align 4
  %271 = getelementptr inbounds i32* %270, i32 2
  store i32 %269, i32* %271, align 4
  %272 = load i32* %h3, align 4
  %273 = load i32** %1, align 4
  %274 = getelementptr inbounds i32* %273, i32 3
  store i32 %272, i32* %274, align 4
  %275 = load i32* %h4, align 4
  %276 = load i32** %1, align 4
  %277 = getelementptr inbounds i32* %276, i32 4
  store i32 %275, i32* %277, align 4
  %278 = load i32* %h5, align 4
  %279 = load i32** %1, align 4
  %280 = getelementptr inbounds i32* %279, i32 5
  store i32 %278, i32* %280, align 4
  %281 = load i32* %h6, align 4
  %282 = load i32** %1, align 4
  %283 = getelementptr inbounds i32* %282, i32 6
  store i32 %281, i32* %283, align 4
  %284 = load i32* %h7, align 4
  %285 = load i32** %1, align 4
  %286 = getelementptr inbounds i32* %285, i32 7
  store i32 %284, i32* %286, align 4
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind
define void @SHA256(i8* %msg, i64 %msgLen) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i64, align 8
  %numBlocks = alloca i32, align 4
  store i8* %msg, i8** %1, align 4
  store i64 %msgLen, i64* %2, align 8
  %3 = load i8** %1, align 4
  %4 = load i64* %2, align 8
  %5 = call i32 @pad(i8* getelementptr inbounds ([192 x i8]* @gData, i32 0, i32 0), i8* %3, i64 %4) #3
  store i32 %5, i32* %numBlocks, align 4
  %6 = load i32* %numBlocks, align 4
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 %6) #3
  %8 = load i32* %numBlocks, align 4
  call void @outerloop(i32* getelementptr inbounds ([8 x i32]* @gDigest, i32 0, i32 0), i8* getelementptr inbounds ([192 x i8]* @gData, i32 0, i32 0), i32 %8) #3
  ret void
}

; Function Attrs: noinline nounwind
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %msg = alloca [3 x i8], align 1
  %msgLen = alloca i64, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  %2 = bitcast [3 x i8]* %msg to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %2, i8* getelementptr inbounds ([3 x i8]* @main.msg, i32 0, i32 0), i32 3, i32 1, i1 false)
  store i64 3, i64* %msgLen, align 8
  %3 = getelementptr inbounds [3 x i8]* %msg, i32 0, i32 0
  %4 = load i64* %msgLen, align 8
  call void @SHA256(i8* %3, i64 %4) #3
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)) #3
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %14, %0
  %7 = load i32* %i, align 4
  %8 = icmp slt i32 %7, 8
  br i1 %8, label %9, label %17

; <label>:9                                       ; preds = %6
  %10 = load i32* %i, align 4
  %11 = getelementptr inbounds [8 x i32]* @gDigest, i32 0, i32 %10
  %12 = load i32* %11, align 4
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str3, i32 0, i32 0), i32 %12) #3
  br label %14

; <label>:14                                      ; preds = %9
  %15 = load i32* %i, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %i, align 4
  br label %6

; <label>:17                                      ; preds = %6
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)) #3
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i32, i1) #2

attributes #0 = { noinline nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nobuiltin }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
