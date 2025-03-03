; ModuleID = '../data/hip_kernels/7222/0/main.cu'
source_filename = "../data/hip_kernels/7222/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%0 = type { %1 addrspace(1)*, %2 addrspace(1)*, %3, i64, i64, i64 }
%1 = type { i64, i64, i32, i32 }
%2 = type { [64 x [8 x i64]] }
%3 = type { i64 }
%4 = type { i64, %3, i64, i32, i32, i64, i64, %5, [2 x i32] }
%5 = type { %6 addrspace(1)* }
%6 = type { %7, [4 x i32], i64, i32, i32, i32, i32, i64, i32, [9 x i32], i64, i32, i32, [4 x i32], i64, i64, i32, i32, [2 x i32], %3, [14 x i32] }
%7 = type { i32, i32, i8 addrspace(1)*, %3, i32, i32, i64 }

@.str = private unnamed_addr addrspace(4) constant [10 x i8] c"\0ADevice:\0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [17 x i8] c"Training In: %f\0A\00", align 1
@.str.2 = private unnamed_addr addrspace(4) constant [18 x i8] c"Training Out: %f\0A\00", align 1
@.str.3 = private unnamed_addr addrspace(4) constant [16 x i8] c"Data Range: %f\0A\00", align 1
@.str.4 = private unnamed_addr addrspace(4) constant [16 x i8] c"Weights In: %f\0A\00", align 1
@.str.5 = private unnamed_addr addrspace(4) constant [17 x i8] c"Weights Out: %f\0A\00", align 1
@.str.6 = private unnamed_addr addrspace(4) constant [15 x i8] c"Weights H: %f\0A\00", align 1
@.str.7 = private unnamed_addr addrspace(4) constant [11 x i8] c"H Out: %f\0A\00", align 1
@.str.8 = private unnamed_addr addrspace(4) constant [13 x i8] c"Outputs: %f\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z4TestPdS_S_S_S_S_S_S_iii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture readonly %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #1 {
  %12 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 24
  %14 = bitcast i8 addrspace(4)* %13 to i64 addrspace(4)*
  %15 = load i64, i64 addrspace(4)* %14, align 8, !tbaa !4
  %16 = inttoptr i64 %15 to i8 addrspace(1)*
  %17 = addrspacecast i8 addrspace(1)* %16 to i8*
  %18 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %19 = extractelement <2 x i64> %18, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %20, label %24

20:                                               ; preds = %11
  %21 = and i64 %19, -227
  %22 = or i64 %21, 34
  %23 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %22, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %464

24:                                               ; preds = %11
  %25 = and i64 %19, -3
  %26 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %25, i64 0
  br label %27

27:                                               ; preds = %453, %24
  %28 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str, i64 0, i64 9) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([10 x i8]* addrspacecast ([10 x i8] addrspace(4)* @.str to [10 x i8]*) to i64)), i64 1))), %24 ], [ %461, %453 ]
  %29 = phi i8 addrspace(4)* [ getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str, i64 0, i64 0), %24 ], [ %462, %453 ]
  %30 = phi <2 x i64> [ %26, %24 ], [ %460, %453 ]
  %31 = icmp ugt i64 %28, 56
  %32 = extractelement <2 x i64> %30, i64 0
  %33 = or i64 %32, 2
  %34 = insertelement <2 x i64> poison, i64 %33, i64 0
  %35 = select i1 %31, <2 x i64> %30, <2 x i64> %34
  %36 = tail call i64 @llvm.umin.i64(i64 %28, i64 56)
  %37 = trunc i64 %36 to i32
  %38 = extractelement <2 x i64> %35, i64 0
  %39 = icmp ugt i32 %37, 7
  br i1 %39, label %42, label %40

40:                                               ; preds = %27
  %41 = icmp eq i32 %37, 0
  br i1 %41, label %95, label %82

42:                                               ; preds = %27
  %43 = load i8, i8 addrspace(4)* %29, align 1, !tbaa !8
  %44 = zext i8 %43 to i64
  %45 = getelementptr inbounds i8, i8 addrspace(4)* %29, i64 1
  %46 = load i8, i8 addrspace(4)* %45, align 1, !tbaa !8
  %47 = zext i8 %46 to i64
  %48 = shl nuw nsw i64 %47, 8
  %49 = or i64 %48, %44
  %50 = getelementptr inbounds i8, i8 addrspace(4)* %29, i64 2
  %51 = load i8, i8 addrspace(4)* %50, align 1, !tbaa !8
  %52 = zext i8 %51 to i64
  %53 = shl nuw nsw i64 %52, 16
  %54 = or i64 %49, %53
  %55 = getelementptr inbounds i8, i8 addrspace(4)* %29, i64 3
  %56 = load i8, i8 addrspace(4)* %55, align 1, !tbaa !8
  %57 = zext i8 %56 to i64
  %58 = shl nuw nsw i64 %57, 24
  %59 = or i64 %54, %58
  %60 = getelementptr inbounds i8, i8 addrspace(4)* %29, i64 4
  %61 = load i8, i8 addrspace(4)* %60, align 1, !tbaa !8
  %62 = zext i8 %61 to i64
  %63 = shl nuw nsw i64 %62, 32
  %64 = or i64 %59, %63
  %65 = getelementptr inbounds i8, i8 addrspace(4)* %29, i64 5
  %66 = load i8, i8 addrspace(4)* %65, align 1, !tbaa !8
  %67 = zext i8 %66 to i64
  %68 = shl nuw nsw i64 %67, 40
  %69 = or i64 %64, %68
  %70 = getelementptr inbounds i8, i8 addrspace(4)* %29, i64 6
  %71 = load i8, i8 addrspace(4)* %70, align 1, !tbaa !8
  %72 = zext i8 %71 to i64
  %73 = shl nuw nsw i64 %72, 48
  %74 = or i64 %69, %73
  %75 = getelementptr inbounds i8, i8 addrspace(4)* %29, i64 7
  %76 = load i8, i8 addrspace(4)* %75, align 1, !tbaa !8
  %77 = zext i8 %76 to i64
  %78 = shl nuw i64 %77, 56
  %79 = or i64 %74, %78
  %80 = add nsw i32 %37, -8
  %81 = getelementptr inbounds i8, i8 addrspace(4)* %29, i64 8
  br label %95

82:                                               ; preds = %40, %82
  %83 = phi i32 [ %93, %82 ], [ 0, %40 ]
  %84 = phi i64 [ %92, %82 ], [ 0, %40 ]
  %85 = zext i32 %83 to i64
  %86 = getelementptr inbounds i8, i8 addrspace(4)* %29, i64 %85
  %87 = load i8, i8 addrspace(4)* %86, align 1, !tbaa !8
  %88 = zext i8 %87 to i64
  %89 = shl i32 %83, 3
  %90 = zext i32 %89 to i64
  %91 = shl nuw i64 %88, %90
  %92 = or i64 %91, %84
  %93 = add nuw nsw i32 %83, 1
  %94 = icmp eq i32 %93, %37
  br i1 %94, label %95, label %82, !llvm.loop !9

95:                                               ; preds = %82, %42, %40
  %96 = phi i8 addrspace(4)* [ %81, %42 ], [ %29, %40 ], [ %29, %82 ]
  %97 = phi i32 [ %80, %42 ], [ 0, %40 ], [ 0, %82 ]
  %98 = phi i64 [ %79, %42 ], [ 0, %40 ], [ %92, %82 ]
  %99 = icmp ugt i32 %97, 7
  br i1 %99, label %102, label %100

100:                                              ; preds = %95
  %101 = icmp eq i32 %97, 0
  br i1 %101, label %155, label %142

102:                                              ; preds = %95
  %103 = load i8, i8 addrspace(4)* %96, align 1, !tbaa !8
  %104 = zext i8 %103 to i64
  %105 = getelementptr inbounds i8, i8 addrspace(4)* %96, i64 1
  %106 = load i8, i8 addrspace(4)* %105, align 1, !tbaa !8
  %107 = zext i8 %106 to i64
  %108 = shl nuw nsw i64 %107, 8
  %109 = or i64 %108, %104
  %110 = getelementptr inbounds i8, i8 addrspace(4)* %96, i64 2
  %111 = load i8, i8 addrspace(4)* %110, align 1, !tbaa !8
  %112 = zext i8 %111 to i64
  %113 = shl nuw nsw i64 %112, 16
  %114 = or i64 %109, %113
  %115 = getelementptr inbounds i8, i8 addrspace(4)* %96, i64 3
  %116 = load i8, i8 addrspace(4)* %115, align 1, !tbaa !8
  %117 = zext i8 %116 to i64
  %118 = shl nuw nsw i64 %117, 24
  %119 = or i64 %114, %118
  %120 = getelementptr inbounds i8, i8 addrspace(4)* %96, i64 4
  %121 = load i8, i8 addrspace(4)* %120, align 1, !tbaa !8
  %122 = zext i8 %121 to i64
  %123 = shl nuw nsw i64 %122, 32
  %124 = or i64 %119, %123
  %125 = getelementptr inbounds i8, i8 addrspace(4)* %96, i64 5
  %126 = load i8, i8 addrspace(4)* %125, align 1, !tbaa !8
  %127 = zext i8 %126 to i64
  %128 = shl nuw nsw i64 %127, 40
  %129 = or i64 %124, %128
  %130 = getelementptr inbounds i8, i8 addrspace(4)* %96, i64 6
  %131 = load i8, i8 addrspace(4)* %130, align 1, !tbaa !8
  %132 = zext i8 %131 to i64
  %133 = shl nuw nsw i64 %132, 48
  %134 = or i64 %129, %133
  %135 = getelementptr inbounds i8, i8 addrspace(4)* %96, i64 7
  %136 = load i8, i8 addrspace(4)* %135, align 1, !tbaa !8
  %137 = zext i8 %136 to i64
  %138 = shl nuw i64 %137, 56
  %139 = or i64 %134, %138
  %140 = add nsw i32 %97, -8
  %141 = getelementptr inbounds i8, i8 addrspace(4)* %96, i64 8
  br label %155

142:                                              ; preds = %100, %142
  %143 = phi i32 [ %153, %142 ], [ 0, %100 ]
  %144 = phi i64 [ %152, %142 ], [ 0, %100 ]
  %145 = zext i32 %143 to i64
  %146 = getelementptr inbounds i8, i8 addrspace(4)* %96, i64 %145
  %147 = load i8, i8 addrspace(4)* %146, align 1, !tbaa !8
  %148 = zext i8 %147 to i64
  %149 = shl i32 %143, 3
  %150 = zext i32 %149 to i64
  %151 = shl nuw i64 %148, %150
  %152 = or i64 %151, %144
  %153 = add nuw nsw i32 %143, 1
  %154 = icmp eq i32 %153, %97
  br i1 %154, label %155, label %142

155:                                              ; preds = %142, %102, %100
  %156 = phi i8 addrspace(4)* [ %141, %102 ], [ %96, %100 ], [ %96, %142 ]
  %157 = phi i32 [ %140, %102 ], [ 0, %100 ], [ 0, %142 ]
  %158 = phi i64 [ %139, %102 ], [ 0, %100 ], [ %152, %142 ]
  %159 = icmp ugt i32 %157, 7
  br i1 %159, label %162, label %160

160:                                              ; preds = %155
  %161 = icmp eq i32 %157, 0
  br i1 %161, label %215, label %202

162:                                              ; preds = %155
  %163 = load i8, i8 addrspace(4)* %156, align 1, !tbaa !8
  %164 = zext i8 %163 to i64
  %165 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 1
  %166 = load i8, i8 addrspace(4)* %165, align 1, !tbaa !8
  %167 = zext i8 %166 to i64
  %168 = shl nuw nsw i64 %167, 8
  %169 = or i64 %168, %164
  %170 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 2
  %171 = load i8, i8 addrspace(4)* %170, align 1, !tbaa !8
  %172 = zext i8 %171 to i64
  %173 = shl nuw nsw i64 %172, 16
  %174 = or i64 %169, %173
  %175 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 3
  %176 = load i8, i8 addrspace(4)* %175, align 1, !tbaa !8
  %177 = zext i8 %176 to i64
  %178 = shl nuw nsw i64 %177, 24
  %179 = or i64 %174, %178
  %180 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 4
  %181 = load i8, i8 addrspace(4)* %180, align 1, !tbaa !8
  %182 = zext i8 %181 to i64
  %183 = shl nuw nsw i64 %182, 32
  %184 = or i64 %179, %183
  %185 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 5
  %186 = load i8, i8 addrspace(4)* %185, align 1, !tbaa !8
  %187 = zext i8 %186 to i64
  %188 = shl nuw nsw i64 %187, 40
  %189 = or i64 %184, %188
  %190 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 6
  %191 = load i8, i8 addrspace(4)* %190, align 1, !tbaa !8
  %192 = zext i8 %191 to i64
  %193 = shl nuw nsw i64 %192, 48
  %194 = or i64 %189, %193
  %195 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 7
  %196 = load i8, i8 addrspace(4)* %195, align 1, !tbaa !8
  %197 = zext i8 %196 to i64
  %198 = shl nuw i64 %197, 56
  %199 = or i64 %194, %198
  %200 = add nsw i32 %157, -8
  %201 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 8
  br label %215

202:                                              ; preds = %160, %202
  %203 = phi i32 [ %213, %202 ], [ 0, %160 ]
  %204 = phi i64 [ %212, %202 ], [ 0, %160 ]
  %205 = zext i32 %203 to i64
  %206 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 %205
  %207 = load i8, i8 addrspace(4)* %206, align 1, !tbaa !8
  %208 = zext i8 %207 to i64
  %209 = shl i32 %203, 3
  %210 = zext i32 %209 to i64
  %211 = shl nuw i64 %208, %210
  %212 = or i64 %211, %204
  %213 = add nuw nsw i32 %203, 1
  %214 = icmp eq i32 %213, %157
  br i1 %214, label %215, label %202

215:                                              ; preds = %202, %162, %160
  %216 = phi i8 addrspace(4)* [ %201, %162 ], [ %156, %160 ], [ %156, %202 ]
  %217 = phi i32 [ %200, %162 ], [ 0, %160 ], [ 0, %202 ]
  %218 = phi i64 [ %199, %162 ], [ 0, %160 ], [ %212, %202 ]
  %219 = icmp ugt i32 %217, 7
  br i1 %219, label %222, label %220

220:                                              ; preds = %215
  %221 = icmp eq i32 %217, 0
  br i1 %221, label %275, label %262

222:                                              ; preds = %215
  %223 = load i8, i8 addrspace(4)* %216, align 1, !tbaa !8
  %224 = zext i8 %223 to i64
  %225 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 1
  %226 = load i8, i8 addrspace(4)* %225, align 1, !tbaa !8
  %227 = zext i8 %226 to i64
  %228 = shl nuw nsw i64 %227, 8
  %229 = or i64 %228, %224
  %230 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 2
  %231 = load i8, i8 addrspace(4)* %230, align 1, !tbaa !8
  %232 = zext i8 %231 to i64
  %233 = shl nuw nsw i64 %232, 16
  %234 = or i64 %229, %233
  %235 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 3
  %236 = load i8, i8 addrspace(4)* %235, align 1, !tbaa !8
  %237 = zext i8 %236 to i64
  %238 = shl nuw nsw i64 %237, 24
  %239 = or i64 %234, %238
  %240 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 4
  %241 = load i8, i8 addrspace(4)* %240, align 1, !tbaa !8
  %242 = zext i8 %241 to i64
  %243 = shl nuw nsw i64 %242, 32
  %244 = or i64 %239, %243
  %245 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 5
  %246 = load i8, i8 addrspace(4)* %245, align 1, !tbaa !8
  %247 = zext i8 %246 to i64
  %248 = shl nuw nsw i64 %247, 40
  %249 = or i64 %244, %248
  %250 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 6
  %251 = load i8, i8 addrspace(4)* %250, align 1, !tbaa !8
  %252 = zext i8 %251 to i64
  %253 = shl nuw nsw i64 %252, 48
  %254 = or i64 %249, %253
  %255 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 7
  %256 = load i8, i8 addrspace(4)* %255, align 1, !tbaa !8
  %257 = zext i8 %256 to i64
  %258 = shl nuw i64 %257, 56
  %259 = or i64 %254, %258
  %260 = add nsw i32 %217, -8
  %261 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 8
  br label %275

262:                                              ; preds = %220, %262
  %263 = phi i32 [ %273, %262 ], [ 0, %220 ]
  %264 = phi i64 [ %272, %262 ], [ 0, %220 ]
  %265 = zext i32 %263 to i64
  %266 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 %265
  %267 = load i8, i8 addrspace(4)* %266, align 1, !tbaa !8
  %268 = zext i8 %267 to i64
  %269 = shl i32 %263, 3
  %270 = zext i32 %269 to i64
  %271 = shl nuw i64 %268, %270
  %272 = or i64 %271, %264
  %273 = add nuw nsw i32 %263, 1
  %274 = icmp eq i32 %273, %217
  br i1 %274, label %275, label %262

275:                                              ; preds = %262, %222, %220
  %276 = phi i8 addrspace(4)* [ %261, %222 ], [ %216, %220 ], [ %216, %262 ]
  %277 = phi i32 [ %260, %222 ], [ 0, %220 ], [ 0, %262 ]
  %278 = phi i64 [ %259, %222 ], [ 0, %220 ], [ %272, %262 ]
  %279 = icmp ugt i32 %277, 7
  br i1 %279, label %282, label %280

280:                                              ; preds = %275
  %281 = icmp eq i32 %277, 0
  br i1 %281, label %335, label %322

282:                                              ; preds = %275
  %283 = load i8, i8 addrspace(4)* %276, align 1, !tbaa !8
  %284 = zext i8 %283 to i64
  %285 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 1
  %286 = load i8, i8 addrspace(4)* %285, align 1, !tbaa !8
  %287 = zext i8 %286 to i64
  %288 = shl nuw nsw i64 %287, 8
  %289 = or i64 %288, %284
  %290 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 2
  %291 = load i8, i8 addrspace(4)* %290, align 1, !tbaa !8
  %292 = zext i8 %291 to i64
  %293 = shl nuw nsw i64 %292, 16
  %294 = or i64 %289, %293
  %295 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 3
  %296 = load i8, i8 addrspace(4)* %295, align 1, !tbaa !8
  %297 = zext i8 %296 to i64
  %298 = shl nuw nsw i64 %297, 24
  %299 = or i64 %294, %298
  %300 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 4
  %301 = load i8, i8 addrspace(4)* %300, align 1, !tbaa !8
  %302 = zext i8 %301 to i64
  %303 = shl nuw nsw i64 %302, 32
  %304 = or i64 %299, %303
  %305 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 5
  %306 = load i8, i8 addrspace(4)* %305, align 1, !tbaa !8
  %307 = zext i8 %306 to i64
  %308 = shl nuw nsw i64 %307, 40
  %309 = or i64 %304, %308
  %310 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 6
  %311 = load i8, i8 addrspace(4)* %310, align 1, !tbaa !8
  %312 = zext i8 %311 to i64
  %313 = shl nuw nsw i64 %312, 48
  %314 = or i64 %309, %313
  %315 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 7
  %316 = load i8, i8 addrspace(4)* %315, align 1, !tbaa !8
  %317 = zext i8 %316 to i64
  %318 = shl nuw i64 %317, 56
  %319 = or i64 %314, %318
  %320 = add nsw i32 %277, -8
  %321 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 8
  br label %335

322:                                              ; preds = %280, %322
  %323 = phi i32 [ %333, %322 ], [ 0, %280 ]
  %324 = phi i64 [ %332, %322 ], [ 0, %280 ]
  %325 = zext i32 %323 to i64
  %326 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 %325
  %327 = load i8, i8 addrspace(4)* %326, align 1, !tbaa !8
  %328 = zext i8 %327 to i64
  %329 = shl i32 %323, 3
  %330 = zext i32 %329 to i64
  %331 = shl nuw i64 %328, %330
  %332 = or i64 %331, %324
  %333 = add nuw nsw i32 %323, 1
  %334 = icmp eq i32 %333, %277
  br i1 %334, label %335, label %322

335:                                              ; preds = %322, %282, %280
  %336 = phi i8 addrspace(4)* [ %321, %282 ], [ %276, %280 ], [ %276, %322 ]
  %337 = phi i32 [ %320, %282 ], [ 0, %280 ], [ 0, %322 ]
  %338 = phi i64 [ %319, %282 ], [ 0, %280 ], [ %332, %322 ]
  %339 = icmp ugt i32 %337, 7
  br i1 %339, label %342, label %340

340:                                              ; preds = %335
  %341 = icmp eq i32 %337, 0
  br i1 %341, label %395, label %382

342:                                              ; preds = %335
  %343 = load i8, i8 addrspace(4)* %336, align 1, !tbaa !8
  %344 = zext i8 %343 to i64
  %345 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 1
  %346 = load i8, i8 addrspace(4)* %345, align 1, !tbaa !8
  %347 = zext i8 %346 to i64
  %348 = shl nuw nsw i64 %347, 8
  %349 = or i64 %348, %344
  %350 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 2
  %351 = load i8, i8 addrspace(4)* %350, align 1, !tbaa !8
  %352 = zext i8 %351 to i64
  %353 = shl nuw nsw i64 %352, 16
  %354 = or i64 %349, %353
  %355 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 3
  %356 = load i8, i8 addrspace(4)* %355, align 1, !tbaa !8
  %357 = zext i8 %356 to i64
  %358 = shl nuw nsw i64 %357, 24
  %359 = or i64 %354, %358
  %360 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 4
  %361 = load i8, i8 addrspace(4)* %360, align 1, !tbaa !8
  %362 = zext i8 %361 to i64
  %363 = shl nuw nsw i64 %362, 32
  %364 = or i64 %359, %363
  %365 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 5
  %366 = load i8, i8 addrspace(4)* %365, align 1, !tbaa !8
  %367 = zext i8 %366 to i64
  %368 = shl nuw nsw i64 %367, 40
  %369 = or i64 %364, %368
  %370 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 6
  %371 = load i8, i8 addrspace(4)* %370, align 1, !tbaa !8
  %372 = zext i8 %371 to i64
  %373 = shl nuw nsw i64 %372, 48
  %374 = or i64 %369, %373
  %375 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 7
  %376 = load i8, i8 addrspace(4)* %375, align 1, !tbaa !8
  %377 = zext i8 %376 to i64
  %378 = shl nuw i64 %377, 56
  %379 = or i64 %374, %378
  %380 = add nsw i32 %337, -8
  %381 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 8
  br label %395

382:                                              ; preds = %340, %382
  %383 = phi i32 [ %393, %382 ], [ 0, %340 ]
  %384 = phi i64 [ %392, %382 ], [ 0, %340 ]
  %385 = zext i32 %383 to i64
  %386 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 %385
  %387 = load i8, i8 addrspace(4)* %386, align 1, !tbaa !8
  %388 = zext i8 %387 to i64
  %389 = shl i32 %383, 3
  %390 = zext i32 %389 to i64
  %391 = shl nuw i64 %388, %390
  %392 = or i64 %391, %384
  %393 = add nuw nsw i32 %383, 1
  %394 = icmp eq i32 %393, %337
  br i1 %394, label %395, label %382

395:                                              ; preds = %382, %342, %340
  %396 = phi i8 addrspace(4)* [ %381, %342 ], [ %336, %340 ], [ %336, %382 ]
  %397 = phi i32 [ %380, %342 ], [ 0, %340 ], [ 0, %382 ]
  %398 = phi i64 [ %379, %342 ], [ 0, %340 ], [ %392, %382 ]
  %399 = icmp ugt i32 %397, 7
  br i1 %399, label %402, label %400

400:                                              ; preds = %395
  %401 = icmp eq i32 %397, 0
  br i1 %401, label %453, label %440

402:                                              ; preds = %395
  %403 = load i8, i8 addrspace(4)* %396, align 1, !tbaa !8
  %404 = zext i8 %403 to i64
  %405 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 1
  %406 = load i8, i8 addrspace(4)* %405, align 1, !tbaa !8
  %407 = zext i8 %406 to i64
  %408 = shl nuw nsw i64 %407, 8
  %409 = or i64 %408, %404
  %410 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 2
  %411 = load i8, i8 addrspace(4)* %410, align 1, !tbaa !8
  %412 = zext i8 %411 to i64
  %413 = shl nuw nsw i64 %412, 16
  %414 = or i64 %409, %413
  %415 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 3
  %416 = load i8, i8 addrspace(4)* %415, align 1, !tbaa !8
  %417 = zext i8 %416 to i64
  %418 = shl nuw nsw i64 %417, 24
  %419 = or i64 %414, %418
  %420 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 4
  %421 = load i8, i8 addrspace(4)* %420, align 1, !tbaa !8
  %422 = zext i8 %421 to i64
  %423 = shl nuw nsw i64 %422, 32
  %424 = or i64 %419, %423
  %425 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 5
  %426 = load i8, i8 addrspace(4)* %425, align 1, !tbaa !8
  %427 = zext i8 %426 to i64
  %428 = shl nuw nsw i64 %427, 40
  %429 = or i64 %424, %428
  %430 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 6
  %431 = load i8, i8 addrspace(4)* %430, align 1, !tbaa !8
  %432 = zext i8 %431 to i64
  %433 = shl nuw nsw i64 %432, 48
  %434 = or i64 %429, %433
  %435 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 7
  %436 = load i8, i8 addrspace(4)* %435, align 1, !tbaa !8
  %437 = zext i8 %436 to i64
  %438 = shl nuw i64 %437, 56
  %439 = or i64 %434, %438
  br label %453

440:                                              ; preds = %400, %440
  %441 = phi i32 [ %451, %440 ], [ 0, %400 ]
  %442 = phi i64 [ %450, %440 ], [ 0, %400 ]
  %443 = zext i32 %441 to i64
  %444 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 %443
  %445 = load i8, i8 addrspace(4)* %444, align 1, !tbaa !8
  %446 = zext i8 %445 to i64
  %447 = shl i32 %441, 3
  %448 = zext i32 %447 to i64
  %449 = shl nuw i64 %446, %448
  %450 = or i64 %449, %442
  %451 = add nuw nsw i32 %441, 1
  %452 = icmp eq i32 %451, %397
  br i1 %452, label %453, label %440

453:                                              ; preds = %440, %402, %400
  %454 = phi i64 [ %439, %402 ], [ 0, %400 ], [ %450, %440 ]
  %455 = shl nuw nsw i64 %36, 2
  %456 = add nuw nsw i64 %455, 28
  %457 = and i64 %456, 480
  %458 = and i64 %38, -225
  %459 = or i64 %458, %457
  %460 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %459, i64 noundef %98, i64 noundef %158, i64 noundef %218, i64 noundef %278, i64 noundef %338, i64 noundef %398, i64 noundef %454) #10
  %461 = sub i64 %28, %36
  %462 = getelementptr inbounds i8, i8 addrspace(4)* %29, i64 %36
  %463 = icmp eq i64 %461, 0
  br i1 %463, label %464, label %27

464:                                              ; preds = %453, %20
  %465 = mul nsw i32 %8, 40
  %466 = or i32 %465, 3
  %467 = sext i32 %466 to i64
  %468 = getelementptr inbounds double, double addrspace(1)* %0, i64 %467
  %469 = bitcast double addrspace(1)* %468 to i64 addrspace(1)*
  %470 = load i64, i64 addrspace(1)* %469, align 8, !tbaa !11
  %471 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %472 = extractelement <2 x i64> %471, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %473, label %477

473:                                              ; preds = %464
  %474 = and i64 %472, -225
  %475 = or i64 %474, 32
  %476 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %475, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %918

477:                                              ; preds = %464
  %478 = and i64 %472, 2
  %479 = and i64 %472, -3
  %480 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %479, i64 0
  br label %481

481:                                              ; preds = %907, %477
  %482 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 16) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([17 x i8]* addrspacecast ([17 x i8] addrspace(4)* @.str.1 to [17 x i8]*) to i64)), i64 1))), %477 ], [ %915, %907 ]
  %483 = phi i8 addrspace(4)* [ getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %477 ], [ %916, %907 ]
  %484 = phi <2 x i64> [ %480, %477 ], [ %914, %907 ]
  %485 = icmp ugt i64 %482, 56
  %486 = extractelement <2 x i64> %484, i64 0
  %487 = or i64 %486, %478
  %488 = insertelement <2 x i64> poison, i64 %487, i64 0
  %489 = select i1 %485, <2 x i64> %484, <2 x i64> %488
  %490 = tail call i64 @llvm.umin.i64(i64 %482, i64 56)
  %491 = trunc i64 %490 to i32
  %492 = extractelement <2 x i64> %489, i64 0
  %493 = icmp ugt i32 %491, 7
  br i1 %493, label %496, label %494

494:                                              ; preds = %481
  %495 = icmp eq i32 %491, 0
  br i1 %495, label %549, label %536

496:                                              ; preds = %481
  %497 = load i8, i8 addrspace(4)* %483, align 1, !tbaa !8
  %498 = zext i8 %497 to i64
  %499 = getelementptr inbounds i8, i8 addrspace(4)* %483, i64 1
  %500 = load i8, i8 addrspace(4)* %499, align 1, !tbaa !8
  %501 = zext i8 %500 to i64
  %502 = shl nuw nsw i64 %501, 8
  %503 = or i64 %502, %498
  %504 = getelementptr inbounds i8, i8 addrspace(4)* %483, i64 2
  %505 = load i8, i8 addrspace(4)* %504, align 1, !tbaa !8
  %506 = zext i8 %505 to i64
  %507 = shl nuw nsw i64 %506, 16
  %508 = or i64 %503, %507
  %509 = getelementptr inbounds i8, i8 addrspace(4)* %483, i64 3
  %510 = load i8, i8 addrspace(4)* %509, align 1, !tbaa !8
  %511 = zext i8 %510 to i64
  %512 = shl nuw nsw i64 %511, 24
  %513 = or i64 %508, %512
  %514 = getelementptr inbounds i8, i8 addrspace(4)* %483, i64 4
  %515 = load i8, i8 addrspace(4)* %514, align 1, !tbaa !8
  %516 = zext i8 %515 to i64
  %517 = shl nuw nsw i64 %516, 32
  %518 = or i64 %513, %517
  %519 = getelementptr inbounds i8, i8 addrspace(4)* %483, i64 5
  %520 = load i8, i8 addrspace(4)* %519, align 1, !tbaa !8
  %521 = zext i8 %520 to i64
  %522 = shl nuw nsw i64 %521, 40
  %523 = or i64 %518, %522
  %524 = getelementptr inbounds i8, i8 addrspace(4)* %483, i64 6
  %525 = load i8, i8 addrspace(4)* %524, align 1, !tbaa !8
  %526 = zext i8 %525 to i64
  %527 = shl nuw nsw i64 %526, 48
  %528 = or i64 %523, %527
  %529 = getelementptr inbounds i8, i8 addrspace(4)* %483, i64 7
  %530 = load i8, i8 addrspace(4)* %529, align 1, !tbaa !8
  %531 = zext i8 %530 to i64
  %532 = shl nuw i64 %531, 56
  %533 = or i64 %528, %532
  %534 = add nsw i32 %491, -8
  %535 = getelementptr inbounds i8, i8 addrspace(4)* %483, i64 8
  br label %549

536:                                              ; preds = %494, %536
  %537 = phi i32 [ %547, %536 ], [ 0, %494 ]
  %538 = phi i64 [ %546, %536 ], [ 0, %494 ]
  %539 = zext i32 %537 to i64
  %540 = getelementptr inbounds i8, i8 addrspace(4)* %483, i64 %539
  %541 = load i8, i8 addrspace(4)* %540, align 1, !tbaa !8
  %542 = zext i8 %541 to i64
  %543 = shl i32 %537, 3
  %544 = zext i32 %543 to i64
  %545 = shl nuw i64 %542, %544
  %546 = or i64 %545, %538
  %547 = add nuw nsw i32 %537, 1
  %548 = icmp eq i32 %547, %491
  br i1 %548, label %549, label %536, !llvm.loop !9

549:                                              ; preds = %536, %496, %494
  %550 = phi i8 addrspace(4)* [ %535, %496 ], [ %483, %494 ], [ %483, %536 ]
  %551 = phi i32 [ %534, %496 ], [ 0, %494 ], [ 0, %536 ]
  %552 = phi i64 [ %533, %496 ], [ 0, %494 ], [ %546, %536 ]
  %553 = icmp ugt i32 %551, 7
  br i1 %553, label %556, label %554

554:                                              ; preds = %549
  %555 = icmp eq i32 %551, 0
  br i1 %555, label %609, label %596

556:                                              ; preds = %549
  %557 = load i8, i8 addrspace(4)* %550, align 1, !tbaa !8
  %558 = zext i8 %557 to i64
  %559 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 1
  %560 = load i8, i8 addrspace(4)* %559, align 1, !tbaa !8
  %561 = zext i8 %560 to i64
  %562 = shl nuw nsw i64 %561, 8
  %563 = or i64 %562, %558
  %564 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 2
  %565 = load i8, i8 addrspace(4)* %564, align 1, !tbaa !8
  %566 = zext i8 %565 to i64
  %567 = shl nuw nsw i64 %566, 16
  %568 = or i64 %563, %567
  %569 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 3
  %570 = load i8, i8 addrspace(4)* %569, align 1, !tbaa !8
  %571 = zext i8 %570 to i64
  %572 = shl nuw nsw i64 %571, 24
  %573 = or i64 %568, %572
  %574 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 4
  %575 = load i8, i8 addrspace(4)* %574, align 1, !tbaa !8
  %576 = zext i8 %575 to i64
  %577 = shl nuw nsw i64 %576, 32
  %578 = or i64 %573, %577
  %579 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 5
  %580 = load i8, i8 addrspace(4)* %579, align 1, !tbaa !8
  %581 = zext i8 %580 to i64
  %582 = shl nuw nsw i64 %581, 40
  %583 = or i64 %578, %582
  %584 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 6
  %585 = load i8, i8 addrspace(4)* %584, align 1, !tbaa !8
  %586 = zext i8 %585 to i64
  %587 = shl nuw nsw i64 %586, 48
  %588 = or i64 %583, %587
  %589 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 7
  %590 = load i8, i8 addrspace(4)* %589, align 1, !tbaa !8
  %591 = zext i8 %590 to i64
  %592 = shl nuw i64 %591, 56
  %593 = or i64 %588, %592
  %594 = add nsw i32 %551, -8
  %595 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 8
  br label %609

596:                                              ; preds = %554, %596
  %597 = phi i32 [ %607, %596 ], [ 0, %554 ]
  %598 = phi i64 [ %606, %596 ], [ 0, %554 ]
  %599 = zext i32 %597 to i64
  %600 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 %599
  %601 = load i8, i8 addrspace(4)* %600, align 1, !tbaa !8
  %602 = zext i8 %601 to i64
  %603 = shl i32 %597, 3
  %604 = zext i32 %603 to i64
  %605 = shl nuw i64 %602, %604
  %606 = or i64 %605, %598
  %607 = add nuw nsw i32 %597, 1
  %608 = icmp eq i32 %607, %551
  br i1 %608, label %609, label %596

609:                                              ; preds = %596, %556, %554
  %610 = phi i8 addrspace(4)* [ %595, %556 ], [ %550, %554 ], [ %550, %596 ]
  %611 = phi i32 [ %594, %556 ], [ 0, %554 ], [ 0, %596 ]
  %612 = phi i64 [ %593, %556 ], [ 0, %554 ], [ %606, %596 ]
  %613 = icmp ugt i32 %611, 7
  br i1 %613, label %616, label %614

614:                                              ; preds = %609
  %615 = icmp eq i32 %611, 0
  br i1 %615, label %669, label %656

616:                                              ; preds = %609
  %617 = load i8, i8 addrspace(4)* %610, align 1, !tbaa !8
  %618 = zext i8 %617 to i64
  %619 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 1
  %620 = load i8, i8 addrspace(4)* %619, align 1, !tbaa !8
  %621 = zext i8 %620 to i64
  %622 = shl nuw nsw i64 %621, 8
  %623 = or i64 %622, %618
  %624 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 2
  %625 = load i8, i8 addrspace(4)* %624, align 1, !tbaa !8
  %626 = zext i8 %625 to i64
  %627 = shl nuw nsw i64 %626, 16
  %628 = or i64 %623, %627
  %629 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 3
  %630 = load i8, i8 addrspace(4)* %629, align 1, !tbaa !8
  %631 = zext i8 %630 to i64
  %632 = shl nuw nsw i64 %631, 24
  %633 = or i64 %628, %632
  %634 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 4
  %635 = load i8, i8 addrspace(4)* %634, align 1, !tbaa !8
  %636 = zext i8 %635 to i64
  %637 = shl nuw nsw i64 %636, 32
  %638 = or i64 %633, %637
  %639 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 5
  %640 = load i8, i8 addrspace(4)* %639, align 1, !tbaa !8
  %641 = zext i8 %640 to i64
  %642 = shl nuw nsw i64 %641, 40
  %643 = or i64 %638, %642
  %644 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 6
  %645 = load i8, i8 addrspace(4)* %644, align 1, !tbaa !8
  %646 = zext i8 %645 to i64
  %647 = shl nuw nsw i64 %646, 48
  %648 = or i64 %643, %647
  %649 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 7
  %650 = load i8, i8 addrspace(4)* %649, align 1, !tbaa !8
  %651 = zext i8 %650 to i64
  %652 = shl nuw i64 %651, 56
  %653 = or i64 %648, %652
  %654 = add nsw i32 %611, -8
  %655 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 8
  br label %669

656:                                              ; preds = %614, %656
  %657 = phi i32 [ %667, %656 ], [ 0, %614 ]
  %658 = phi i64 [ %666, %656 ], [ 0, %614 ]
  %659 = zext i32 %657 to i64
  %660 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 %659
  %661 = load i8, i8 addrspace(4)* %660, align 1, !tbaa !8
  %662 = zext i8 %661 to i64
  %663 = shl i32 %657, 3
  %664 = zext i32 %663 to i64
  %665 = shl nuw i64 %662, %664
  %666 = or i64 %665, %658
  %667 = add nuw nsw i32 %657, 1
  %668 = icmp eq i32 %667, %611
  br i1 %668, label %669, label %656

669:                                              ; preds = %656, %616, %614
  %670 = phi i8 addrspace(4)* [ %655, %616 ], [ %610, %614 ], [ %610, %656 ]
  %671 = phi i32 [ %654, %616 ], [ 0, %614 ], [ 0, %656 ]
  %672 = phi i64 [ %653, %616 ], [ 0, %614 ], [ %666, %656 ]
  %673 = icmp ugt i32 %671, 7
  br i1 %673, label %676, label %674

674:                                              ; preds = %669
  %675 = icmp eq i32 %671, 0
  br i1 %675, label %729, label %716

676:                                              ; preds = %669
  %677 = load i8, i8 addrspace(4)* %670, align 1, !tbaa !8
  %678 = zext i8 %677 to i64
  %679 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 1
  %680 = load i8, i8 addrspace(4)* %679, align 1, !tbaa !8
  %681 = zext i8 %680 to i64
  %682 = shl nuw nsw i64 %681, 8
  %683 = or i64 %682, %678
  %684 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 2
  %685 = load i8, i8 addrspace(4)* %684, align 1, !tbaa !8
  %686 = zext i8 %685 to i64
  %687 = shl nuw nsw i64 %686, 16
  %688 = or i64 %683, %687
  %689 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 3
  %690 = load i8, i8 addrspace(4)* %689, align 1, !tbaa !8
  %691 = zext i8 %690 to i64
  %692 = shl nuw nsw i64 %691, 24
  %693 = or i64 %688, %692
  %694 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 4
  %695 = load i8, i8 addrspace(4)* %694, align 1, !tbaa !8
  %696 = zext i8 %695 to i64
  %697 = shl nuw nsw i64 %696, 32
  %698 = or i64 %693, %697
  %699 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 5
  %700 = load i8, i8 addrspace(4)* %699, align 1, !tbaa !8
  %701 = zext i8 %700 to i64
  %702 = shl nuw nsw i64 %701, 40
  %703 = or i64 %698, %702
  %704 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 6
  %705 = load i8, i8 addrspace(4)* %704, align 1, !tbaa !8
  %706 = zext i8 %705 to i64
  %707 = shl nuw nsw i64 %706, 48
  %708 = or i64 %703, %707
  %709 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 7
  %710 = load i8, i8 addrspace(4)* %709, align 1, !tbaa !8
  %711 = zext i8 %710 to i64
  %712 = shl nuw i64 %711, 56
  %713 = or i64 %708, %712
  %714 = add nsw i32 %671, -8
  %715 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 8
  br label %729

716:                                              ; preds = %674, %716
  %717 = phi i32 [ %727, %716 ], [ 0, %674 ]
  %718 = phi i64 [ %726, %716 ], [ 0, %674 ]
  %719 = zext i32 %717 to i64
  %720 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 %719
  %721 = load i8, i8 addrspace(4)* %720, align 1, !tbaa !8
  %722 = zext i8 %721 to i64
  %723 = shl i32 %717, 3
  %724 = zext i32 %723 to i64
  %725 = shl nuw i64 %722, %724
  %726 = or i64 %725, %718
  %727 = add nuw nsw i32 %717, 1
  %728 = icmp eq i32 %727, %671
  br i1 %728, label %729, label %716

729:                                              ; preds = %716, %676, %674
  %730 = phi i8 addrspace(4)* [ %715, %676 ], [ %670, %674 ], [ %670, %716 ]
  %731 = phi i32 [ %714, %676 ], [ 0, %674 ], [ 0, %716 ]
  %732 = phi i64 [ %713, %676 ], [ 0, %674 ], [ %726, %716 ]
  %733 = icmp ugt i32 %731, 7
  br i1 %733, label %736, label %734

734:                                              ; preds = %729
  %735 = icmp eq i32 %731, 0
  br i1 %735, label %789, label %776

736:                                              ; preds = %729
  %737 = load i8, i8 addrspace(4)* %730, align 1, !tbaa !8
  %738 = zext i8 %737 to i64
  %739 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 1
  %740 = load i8, i8 addrspace(4)* %739, align 1, !tbaa !8
  %741 = zext i8 %740 to i64
  %742 = shl nuw nsw i64 %741, 8
  %743 = or i64 %742, %738
  %744 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 2
  %745 = load i8, i8 addrspace(4)* %744, align 1, !tbaa !8
  %746 = zext i8 %745 to i64
  %747 = shl nuw nsw i64 %746, 16
  %748 = or i64 %743, %747
  %749 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 3
  %750 = load i8, i8 addrspace(4)* %749, align 1, !tbaa !8
  %751 = zext i8 %750 to i64
  %752 = shl nuw nsw i64 %751, 24
  %753 = or i64 %748, %752
  %754 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 4
  %755 = load i8, i8 addrspace(4)* %754, align 1, !tbaa !8
  %756 = zext i8 %755 to i64
  %757 = shl nuw nsw i64 %756, 32
  %758 = or i64 %753, %757
  %759 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 5
  %760 = load i8, i8 addrspace(4)* %759, align 1, !tbaa !8
  %761 = zext i8 %760 to i64
  %762 = shl nuw nsw i64 %761, 40
  %763 = or i64 %758, %762
  %764 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 6
  %765 = load i8, i8 addrspace(4)* %764, align 1, !tbaa !8
  %766 = zext i8 %765 to i64
  %767 = shl nuw nsw i64 %766, 48
  %768 = or i64 %763, %767
  %769 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 7
  %770 = load i8, i8 addrspace(4)* %769, align 1, !tbaa !8
  %771 = zext i8 %770 to i64
  %772 = shl nuw i64 %771, 56
  %773 = or i64 %768, %772
  %774 = add nsw i32 %731, -8
  %775 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 8
  br label %789

776:                                              ; preds = %734, %776
  %777 = phi i32 [ %787, %776 ], [ 0, %734 ]
  %778 = phi i64 [ %786, %776 ], [ 0, %734 ]
  %779 = zext i32 %777 to i64
  %780 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 %779
  %781 = load i8, i8 addrspace(4)* %780, align 1, !tbaa !8
  %782 = zext i8 %781 to i64
  %783 = shl i32 %777, 3
  %784 = zext i32 %783 to i64
  %785 = shl nuw i64 %782, %784
  %786 = or i64 %785, %778
  %787 = add nuw nsw i32 %777, 1
  %788 = icmp eq i32 %787, %731
  br i1 %788, label %789, label %776

789:                                              ; preds = %776, %736, %734
  %790 = phi i8 addrspace(4)* [ %775, %736 ], [ %730, %734 ], [ %730, %776 ]
  %791 = phi i32 [ %774, %736 ], [ 0, %734 ], [ 0, %776 ]
  %792 = phi i64 [ %773, %736 ], [ 0, %734 ], [ %786, %776 ]
  %793 = icmp ugt i32 %791, 7
  br i1 %793, label %796, label %794

794:                                              ; preds = %789
  %795 = icmp eq i32 %791, 0
  br i1 %795, label %849, label %836

796:                                              ; preds = %789
  %797 = load i8, i8 addrspace(4)* %790, align 1, !tbaa !8
  %798 = zext i8 %797 to i64
  %799 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 1
  %800 = load i8, i8 addrspace(4)* %799, align 1, !tbaa !8
  %801 = zext i8 %800 to i64
  %802 = shl nuw nsw i64 %801, 8
  %803 = or i64 %802, %798
  %804 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 2
  %805 = load i8, i8 addrspace(4)* %804, align 1, !tbaa !8
  %806 = zext i8 %805 to i64
  %807 = shl nuw nsw i64 %806, 16
  %808 = or i64 %803, %807
  %809 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 3
  %810 = load i8, i8 addrspace(4)* %809, align 1, !tbaa !8
  %811 = zext i8 %810 to i64
  %812 = shl nuw nsw i64 %811, 24
  %813 = or i64 %808, %812
  %814 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 4
  %815 = load i8, i8 addrspace(4)* %814, align 1, !tbaa !8
  %816 = zext i8 %815 to i64
  %817 = shl nuw nsw i64 %816, 32
  %818 = or i64 %813, %817
  %819 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 5
  %820 = load i8, i8 addrspace(4)* %819, align 1, !tbaa !8
  %821 = zext i8 %820 to i64
  %822 = shl nuw nsw i64 %821, 40
  %823 = or i64 %818, %822
  %824 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 6
  %825 = load i8, i8 addrspace(4)* %824, align 1, !tbaa !8
  %826 = zext i8 %825 to i64
  %827 = shl nuw nsw i64 %826, 48
  %828 = or i64 %823, %827
  %829 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 7
  %830 = load i8, i8 addrspace(4)* %829, align 1, !tbaa !8
  %831 = zext i8 %830 to i64
  %832 = shl nuw i64 %831, 56
  %833 = or i64 %828, %832
  %834 = add nsw i32 %791, -8
  %835 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 8
  br label %849

836:                                              ; preds = %794, %836
  %837 = phi i32 [ %847, %836 ], [ 0, %794 ]
  %838 = phi i64 [ %846, %836 ], [ 0, %794 ]
  %839 = zext i32 %837 to i64
  %840 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 %839
  %841 = load i8, i8 addrspace(4)* %840, align 1, !tbaa !8
  %842 = zext i8 %841 to i64
  %843 = shl i32 %837, 3
  %844 = zext i32 %843 to i64
  %845 = shl nuw i64 %842, %844
  %846 = or i64 %845, %838
  %847 = add nuw nsw i32 %837, 1
  %848 = icmp eq i32 %847, %791
  br i1 %848, label %849, label %836

849:                                              ; preds = %836, %796, %794
  %850 = phi i8 addrspace(4)* [ %835, %796 ], [ %790, %794 ], [ %790, %836 ]
  %851 = phi i32 [ %834, %796 ], [ 0, %794 ], [ 0, %836 ]
  %852 = phi i64 [ %833, %796 ], [ 0, %794 ], [ %846, %836 ]
  %853 = icmp ugt i32 %851, 7
  br i1 %853, label %856, label %854

854:                                              ; preds = %849
  %855 = icmp eq i32 %851, 0
  br i1 %855, label %907, label %894

856:                                              ; preds = %849
  %857 = load i8, i8 addrspace(4)* %850, align 1, !tbaa !8
  %858 = zext i8 %857 to i64
  %859 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 1
  %860 = load i8, i8 addrspace(4)* %859, align 1, !tbaa !8
  %861 = zext i8 %860 to i64
  %862 = shl nuw nsw i64 %861, 8
  %863 = or i64 %862, %858
  %864 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 2
  %865 = load i8, i8 addrspace(4)* %864, align 1, !tbaa !8
  %866 = zext i8 %865 to i64
  %867 = shl nuw nsw i64 %866, 16
  %868 = or i64 %863, %867
  %869 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 3
  %870 = load i8, i8 addrspace(4)* %869, align 1, !tbaa !8
  %871 = zext i8 %870 to i64
  %872 = shl nuw nsw i64 %871, 24
  %873 = or i64 %868, %872
  %874 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 4
  %875 = load i8, i8 addrspace(4)* %874, align 1, !tbaa !8
  %876 = zext i8 %875 to i64
  %877 = shl nuw nsw i64 %876, 32
  %878 = or i64 %873, %877
  %879 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 5
  %880 = load i8, i8 addrspace(4)* %879, align 1, !tbaa !8
  %881 = zext i8 %880 to i64
  %882 = shl nuw nsw i64 %881, 40
  %883 = or i64 %878, %882
  %884 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 6
  %885 = load i8, i8 addrspace(4)* %884, align 1, !tbaa !8
  %886 = zext i8 %885 to i64
  %887 = shl nuw nsw i64 %886, 48
  %888 = or i64 %883, %887
  %889 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 7
  %890 = load i8, i8 addrspace(4)* %889, align 1, !tbaa !8
  %891 = zext i8 %890 to i64
  %892 = shl nuw i64 %891, 56
  %893 = or i64 %888, %892
  br label %907

894:                                              ; preds = %854, %894
  %895 = phi i32 [ %905, %894 ], [ 0, %854 ]
  %896 = phi i64 [ %904, %894 ], [ 0, %854 ]
  %897 = zext i32 %895 to i64
  %898 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 %897
  %899 = load i8, i8 addrspace(4)* %898, align 1, !tbaa !8
  %900 = zext i8 %899 to i64
  %901 = shl i32 %895, 3
  %902 = zext i32 %901 to i64
  %903 = shl nuw i64 %900, %902
  %904 = or i64 %903, %896
  %905 = add nuw nsw i32 %895, 1
  %906 = icmp eq i32 %905, %851
  br i1 %906, label %907, label %894

907:                                              ; preds = %894, %856, %854
  %908 = phi i64 [ %893, %856 ], [ 0, %854 ], [ %904, %894 ]
  %909 = shl nuw nsw i64 %490, 2
  %910 = add nuw nsw i64 %909, 28
  %911 = and i64 %910, 480
  %912 = and i64 %492, -225
  %913 = or i64 %912, %911
  %914 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %913, i64 noundef %552, i64 noundef %612, i64 noundef %672, i64 noundef %732, i64 noundef %792, i64 noundef %852, i64 noundef %908) #10
  %915 = sub i64 %482, %490
  %916 = getelementptr inbounds i8, i8 addrspace(4)* %483, i64 %490
  %917 = icmp eq i64 %915, 0
  br i1 %917, label %918, label %481

918:                                              ; preds = %907, %473
  %919 = phi <2 x i64> [ %476, %473 ], [ %914, %907 ]
  %920 = extractelement <2 x i64> %919, i64 0
  %921 = and i64 %920, -227
  %922 = or i64 %921, 34
  %923 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %922, i64 noundef %470, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %924 = getelementptr inbounds double, double addrspace(1)* %1, i64 40
  %925 = bitcast double addrspace(1)* %924 to i64 addrspace(1)*
  %926 = load i64, i64 addrspace(1)* %925, align 8, !tbaa !11
  %927 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %928 = extractelement <2 x i64> %927, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([18 x i8], [18 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), label %929, label %933

929:                                              ; preds = %918
  %930 = and i64 %928, -225
  %931 = or i64 %930, 32
  %932 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %931, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %1374

933:                                              ; preds = %918
  %934 = and i64 %928, 2
  %935 = and i64 %928, -3
  %936 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %935, i64 0
  br label %937

937:                                              ; preds = %1363, %933
  %938 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([18 x i8], [18 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([18 x i8], [18 x i8] addrspace(4)* @.str.2, i64 0, i64 17) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([18 x i8]* addrspacecast ([18 x i8] addrspace(4)* @.str.2 to [18 x i8]*) to i64)), i64 1))), %933 ], [ %1371, %1363 ]
  %939 = phi i8 addrspace(4)* [ getelementptr inbounds ([18 x i8], [18 x i8] addrspace(4)* @.str.2, i64 0, i64 0), %933 ], [ %1372, %1363 ]
  %940 = phi <2 x i64> [ %936, %933 ], [ %1370, %1363 ]
  %941 = icmp ugt i64 %938, 56
  %942 = extractelement <2 x i64> %940, i64 0
  %943 = or i64 %942, %934
  %944 = insertelement <2 x i64> poison, i64 %943, i64 0
  %945 = select i1 %941, <2 x i64> %940, <2 x i64> %944
  %946 = tail call i64 @llvm.umin.i64(i64 %938, i64 56)
  %947 = trunc i64 %946 to i32
  %948 = extractelement <2 x i64> %945, i64 0
  %949 = icmp ugt i32 %947, 7
  br i1 %949, label %952, label %950

950:                                              ; preds = %937
  %951 = icmp eq i32 %947, 0
  br i1 %951, label %1005, label %992

952:                                              ; preds = %937
  %953 = load i8, i8 addrspace(4)* %939, align 1, !tbaa !8
  %954 = zext i8 %953 to i64
  %955 = getelementptr inbounds i8, i8 addrspace(4)* %939, i64 1
  %956 = load i8, i8 addrspace(4)* %955, align 1, !tbaa !8
  %957 = zext i8 %956 to i64
  %958 = shl nuw nsw i64 %957, 8
  %959 = or i64 %958, %954
  %960 = getelementptr inbounds i8, i8 addrspace(4)* %939, i64 2
  %961 = load i8, i8 addrspace(4)* %960, align 1, !tbaa !8
  %962 = zext i8 %961 to i64
  %963 = shl nuw nsw i64 %962, 16
  %964 = or i64 %959, %963
  %965 = getelementptr inbounds i8, i8 addrspace(4)* %939, i64 3
  %966 = load i8, i8 addrspace(4)* %965, align 1, !tbaa !8
  %967 = zext i8 %966 to i64
  %968 = shl nuw nsw i64 %967, 24
  %969 = or i64 %964, %968
  %970 = getelementptr inbounds i8, i8 addrspace(4)* %939, i64 4
  %971 = load i8, i8 addrspace(4)* %970, align 1, !tbaa !8
  %972 = zext i8 %971 to i64
  %973 = shl nuw nsw i64 %972, 32
  %974 = or i64 %969, %973
  %975 = getelementptr inbounds i8, i8 addrspace(4)* %939, i64 5
  %976 = load i8, i8 addrspace(4)* %975, align 1, !tbaa !8
  %977 = zext i8 %976 to i64
  %978 = shl nuw nsw i64 %977, 40
  %979 = or i64 %974, %978
  %980 = getelementptr inbounds i8, i8 addrspace(4)* %939, i64 6
  %981 = load i8, i8 addrspace(4)* %980, align 1, !tbaa !8
  %982 = zext i8 %981 to i64
  %983 = shl nuw nsw i64 %982, 48
  %984 = or i64 %979, %983
  %985 = getelementptr inbounds i8, i8 addrspace(4)* %939, i64 7
  %986 = load i8, i8 addrspace(4)* %985, align 1, !tbaa !8
  %987 = zext i8 %986 to i64
  %988 = shl nuw i64 %987, 56
  %989 = or i64 %984, %988
  %990 = add nsw i32 %947, -8
  %991 = getelementptr inbounds i8, i8 addrspace(4)* %939, i64 8
  br label %1005

992:                                              ; preds = %950, %992
  %993 = phi i32 [ %1003, %992 ], [ 0, %950 ]
  %994 = phi i64 [ %1002, %992 ], [ 0, %950 ]
  %995 = zext i32 %993 to i64
  %996 = getelementptr inbounds i8, i8 addrspace(4)* %939, i64 %995
  %997 = load i8, i8 addrspace(4)* %996, align 1, !tbaa !8
  %998 = zext i8 %997 to i64
  %999 = shl i32 %993, 3
  %1000 = zext i32 %999 to i64
  %1001 = shl nuw i64 %998, %1000
  %1002 = or i64 %1001, %994
  %1003 = add nuw nsw i32 %993, 1
  %1004 = icmp eq i32 %1003, %947
  br i1 %1004, label %1005, label %992, !llvm.loop !9

1005:                                             ; preds = %992, %952, %950
  %1006 = phi i8 addrspace(4)* [ %991, %952 ], [ %939, %950 ], [ %939, %992 ]
  %1007 = phi i32 [ %990, %952 ], [ 0, %950 ], [ 0, %992 ]
  %1008 = phi i64 [ %989, %952 ], [ 0, %950 ], [ %1002, %992 ]
  %1009 = icmp ugt i32 %1007, 7
  br i1 %1009, label %1012, label %1010

1010:                                             ; preds = %1005
  %1011 = icmp eq i32 %1007, 0
  br i1 %1011, label %1065, label %1052

1012:                                             ; preds = %1005
  %1013 = load i8, i8 addrspace(4)* %1006, align 1, !tbaa !8
  %1014 = zext i8 %1013 to i64
  %1015 = getelementptr inbounds i8, i8 addrspace(4)* %1006, i64 1
  %1016 = load i8, i8 addrspace(4)* %1015, align 1, !tbaa !8
  %1017 = zext i8 %1016 to i64
  %1018 = shl nuw nsw i64 %1017, 8
  %1019 = or i64 %1018, %1014
  %1020 = getelementptr inbounds i8, i8 addrspace(4)* %1006, i64 2
  %1021 = load i8, i8 addrspace(4)* %1020, align 1, !tbaa !8
  %1022 = zext i8 %1021 to i64
  %1023 = shl nuw nsw i64 %1022, 16
  %1024 = or i64 %1019, %1023
  %1025 = getelementptr inbounds i8, i8 addrspace(4)* %1006, i64 3
  %1026 = load i8, i8 addrspace(4)* %1025, align 1, !tbaa !8
  %1027 = zext i8 %1026 to i64
  %1028 = shl nuw nsw i64 %1027, 24
  %1029 = or i64 %1024, %1028
  %1030 = getelementptr inbounds i8, i8 addrspace(4)* %1006, i64 4
  %1031 = load i8, i8 addrspace(4)* %1030, align 1, !tbaa !8
  %1032 = zext i8 %1031 to i64
  %1033 = shl nuw nsw i64 %1032, 32
  %1034 = or i64 %1029, %1033
  %1035 = getelementptr inbounds i8, i8 addrspace(4)* %1006, i64 5
  %1036 = load i8, i8 addrspace(4)* %1035, align 1, !tbaa !8
  %1037 = zext i8 %1036 to i64
  %1038 = shl nuw nsw i64 %1037, 40
  %1039 = or i64 %1034, %1038
  %1040 = getelementptr inbounds i8, i8 addrspace(4)* %1006, i64 6
  %1041 = load i8, i8 addrspace(4)* %1040, align 1, !tbaa !8
  %1042 = zext i8 %1041 to i64
  %1043 = shl nuw nsw i64 %1042, 48
  %1044 = or i64 %1039, %1043
  %1045 = getelementptr inbounds i8, i8 addrspace(4)* %1006, i64 7
  %1046 = load i8, i8 addrspace(4)* %1045, align 1, !tbaa !8
  %1047 = zext i8 %1046 to i64
  %1048 = shl nuw i64 %1047, 56
  %1049 = or i64 %1044, %1048
  %1050 = add nsw i32 %1007, -8
  %1051 = getelementptr inbounds i8, i8 addrspace(4)* %1006, i64 8
  br label %1065

1052:                                             ; preds = %1010, %1052
  %1053 = phi i32 [ %1063, %1052 ], [ 0, %1010 ]
  %1054 = phi i64 [ %1062, %1052 ], [ 0, %1010 ]
  %1055 = zext i32 %1053 to i64
  %1056 = getelementptr inbounds i8, i8 addrspace(4)* %1006, i64 %1055
  %1057 = load i8, i8 addrspace(4)* %1056, align 1, !tbaa !8
  %1058 = zext i8 %1057 to i64
  %1059 = shl i32 %1053, 3
  %1060 = zext i32 %1059 to i64
  %1061 = shl nuw i64 %1058, %1060
  %1062 = or i64 %1061, %1054
  %1063 = add nuw nsw i32 %1053, 1
  %1064 = icmp eq i32 %1063, %1007
  br i1 %1064, label %1065, label %1052

1065:                                             ; preds = %1052, %1012, %1010
  %1066 = phi i8 addrspace(4)* [ %1051, %1012 ], [ %1006, %1010 ], [ %1006, %1052 ]
  %1067 = phi i32 [ %1050, %1012 ], [ 0, %1010 ], [ 0, %1052 ]
  %1068 = phi i64 [ %1049, %1012 ], [ 0, %1010 ], [ %1062, %1052 ]
  %1069 = icmp ugt i32 %1067, 7
  br i1 %1069, label %1072, label %1070

1070:                                             ; preds = %1065
  %1071 = icmp eq i32 %1067, 0
  br i1 %1071, label %1125, label %1112

1072:                                             ; preds = %1065
  %1073 = load i8, i8 addrspace(4)* %1066, align 1, !tbaa !8
  %1074 = zext i8 %1073 to i64
  %1075 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 1
  %1076 = load i8, i8 addrspace(4)* %1075, align 1, !tbaa !8
  %1077 = zext i8 %1076 to i64
  %1078 = shl nuw nsw i64 %1077, 8
  %1079 = or i64 %1078, %1074
  %1080 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 2
  %1081 = load i8, i8 addrspace(4)* %1080, align 1, !tbaa !8
  %1082 = zext i8 %1081 to i64
  %1083 = shl nuw nsw i64 %1082, 16
  %1084 = or i64 %1079, %1083
  %1085 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 3
  %1086 = load i8, i8 addrspace(4)* %1085, align 1, !tbaa !8
  %1087 = zext i8 %1086 to i64
  %1088 = shl nuw nsw i64 %1087, 24
  %1089 = or i64 %1084, %1088
  %1090 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 4
  %1091 = load i8, i8 addrspace(4)* %1090, align 1, !tbaa !8
  %1092 = zext i8 %1091 to i64
  %1093 = shl nuw nsw i64 %1092, 32
  %1094 = or i64 %1089, %1093
  %1095 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 5
  %1096 = load i8, i8 addrspace(4)* %1095, align 1, !tbaa !8
  %1097 = zext i8 %1096 to i64
  %1098 = shl nuw nsw i64 %1097, 40
  %1099 = or i64 %1094, %1098
  %1100 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 6
  %1101 = load i8, i8 addrspace(4)* %1100, align 1, !tbaa !8
  %1102 = zext i8 %1101 to i64
  %1103 = shl nuw nsw i64 %1102, 48
  %1104 = or i64 %1099, %1103
  %1105 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 7
  %1106 = load i8, i8 addrspace(4)* %1105, align 1, !tbaa !8
  %1107 = zext i8 %1106 to i64
  %1108 = shl nuw i64 %1107, 56
  %1109 = or i64 %1104, %1108
  %1110 = add nsw i32 %1067, -8
  %1111 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 8
  br label %1125

1112:                                             ; preds = %1070, %1112
  %1113 = phi i32 [ %1123, %1112 ], [ 0, %1070 ]
  %1114 = phi i64 [ %1122, %1112 ], [ 0, %1070 ]
  %1115 = zext i32 %1113 to i64
  %1116 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 %1115
  %1117 = load i8, i8 addrspace(4)* %1116, align 1, !tbaa !8
  %1118 = zext i8 %1117 to i64
  %1119 = shl i32 %1113, 3
  %1120 = zext i32 %1119 to i64
  %1121 = shl nuw i64 %1118, %1120
  %1122 = or i64 %1121, %1114
  %1123 = add nuw nsw i32 %1113, 1
  %1124 = icmp eq i32 %1123, %1067
  br i1 %1124, label %1125, label %1112

1125:                                             ; preds = %1112, %1072, %1070
  %1126 = phi i8 addrspace(4)* [ %1111, %1072 ], [ %1066, %1070 ], [ %1066, %1112 ]
  %1127 = phi i32 [ %1110, %1072 ], [ 0, %1070 ], [ 0, %1112 ]
  %1128 = phi i64 [ %1109, %1072 ], [ 0, %1070 ], [ %1122, %1112 ]
  %1129 = icmp ugt i32 %1127, 7
  br i1 %1129, label %1132, label %1130

1130:                                             ; preds = %1125
  %1131 = icmp eq i32 %1127, 0
  br i1 %1131, label %1185, label %1172

1132:                                             ; preds = %1125
  %1133 = load i8, i8 addrspace(4)* %1126, align 1, !tbaa !8
  %1134 = zext i8 %1133 to i64
  %1135 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 1
  %1136 = load i8, i8 addrspace(4)* %1135, align 1, !tbaa !8
  %1137 = zext i8 %1136 to i64
  %1138 = shl nuw nsw i64 %1137, 8
  %1139 = or i64 %1138, %1134
  %1140 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 2
  %1141 = load i8, i8 addrspace(4)* %1140, align 1, !tbaa !8
  %1142 = zext i8 %1141 to i64
  %1143 = shl nuw nsw i64 %1142, 16
  %1144 = or i64 %1139, %1143
  %1145 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 3
  %1146 = load i8, i8 addrspace(4)* %1145, align 1, !tbaa !8
  %1147 = zext i8 %1146 to i64
  %1148 = shl nuw nsw i64 %1147, 24
  %1149 = or i64 %1144, %1148
  %1150 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 4
  %1151 = load i8, i8 addrspace(4)* %1150, align 1, !tbaa !8
  %1152 = zext i8 %1151 to i64
  %1153 = shl nuw nsw i64 %1152, 32
  %1154 = or i64 %1149, %1153
  %1155 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 5
  %1156 = load i8, i8 addrspace(4)* %1155, align 1, !tbaa !8
  %1157 = zext i8 %1156 to i64
  %1158 = shl nuw nsw i64 %1157, 40
  %1159 = or i64 %1154, %1158
  %1160 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 6
  %1161 = load i8, i8 addrspace(4)* %1160, align 1, !tbaa !8
  %1162 = zext i8 %1161 to i64
  %1163 = shl nuw nsw i64 %1162, 48
  %1164 = or i64 %1159, %1163
  %1165 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 7
  %1166 = load i8, i8 addrspace(4)* %1165, align 1, !tbaa !8
  %1167 = zext i8 %1166 to i64
  %1168 = shl nuw i64 %1167, 56
  %1169 = or i64 %1164, %1168
  %1170 = add nsw i32 %1127, -8
  %1171 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 8
  br label %1185

1172:                                             ; preds = %1130, %1172
  %1173 = phi i32 [ %1183, %1172 ], [ 0, %1130 ]
  %1174 = phi i64 [ %1182, %1172 ], [ 0, %1130 ]
  %1175 = zext i32 %1173 to i64
  %1176 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 %1175
  %1177 = load i8, i8 addrspace(4)* %1176, align 1, !tbaa !8
  %1178 = zext i8 %1177 to i64
  %1179 = shl i32 %1173, 3
  %1180 = zext i32 %1179 to i64
  %1181 = shl nuw i64 %1178, %1180
  %1182 = or i64 %1181, %1174
  %1183 = add nuw nsw i32 %1173, 1
  %1184 = icmp eq i32 %1183, %1127
  br i1 %1184, label %1185, label %1172

1185:                                             ; preds = %1172, %1132, %1130
  %1186 = phi i8 addrspace(4)* [ %1171, %1132 ], [ %1126, %1130 ], [ %1126, %1172 ]
  %1187 = phi i32 [ %1170, %1132 ], [ 0, %1130 ], [ 0, %1172 ]
  %1188 = phi i64 [ %1169, %1132 ], [ 0, %1130 ], [ %1182, %1172 ]
  %1189 = icmp ugt i32 %1187, 7
  br i1 %1189, label %1192, label %1190

1190:                                             ; preds = %1185
  %1191 = icmp eq i32 %1187, 0
  br i1 %1191, label %1245, label %1232

1192:                                             ; preds = %1185
  %1193 = load i8, i8 addrspace(4)* %1186, align 1, !tbaa !8
  %1194 = zext i8 %1193 to i64
  %1195 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 1
  %1196 = load i8, i8 addrspace(4)* %1195, align 1, !tbaa !8
  %1197 = zext i8 %1196 to i64
  %1198 = shl nuw nsw i64 %1197, 8
  %1199 = or i64 %1198, %1194
  %1200 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 2
  %1201 = load i8, i8 addrspace(4)* %1200, align 1, !tbaa !8
  %1202 = zext i8 %1201 to i64
  %1203 = shl nuw nsw i64 %1202, 16
  %1204 = or i64 %1199, %1203
  %1205 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 3
  %1206 = load i8, i8 addrspace(4)* %1205, align 1, !tbaa !8
  %1207 = zext i8 %1206 to i64
  %1208 = shl nuw nsw i64 %1207, 24
  %1209 = or i64 %1204, %1208
  %1210 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 4
  %1211 = load i8, i8 addrspace(4)* %1210, align 1, !tbaa !8
  %1212 = zext i8 %1211 to i64
  %1213 = shl nuw nsw i64 %1212, 32
  %1214 = or i64 %1209, %1213
  %1215 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 5
  %1216 = load i8, i8 addrspace(4)* %1215, align 1, !tbaa !8
  %1217 = zext i8 %1216 to i64
  %1218 = shl nuw nsw i64 %1217, 40
  %1219 = or i64 %1214, %1218
  %1220 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 6
  %1221 = load i8, i8 addrspace(4)* %1220, align 1, !tbaa !8
  %1222 = zext i8 %1221 to i64
  %1223 = shl nuw nsw i64 %1222, 48
  %1224 = or i64 %1219, %1223
  %1225 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 7
  %1226 = load i8, i8 addrspace(4)* %1225, align 1, !tbaa !8
  %1227 = zext i8 %1226 to i64
  %1228 = shl nuw i64 %1227, 56
  %1229 = or i64 %1224, %1228
  %1230 = add nsw i32 %1187, -8
  %1231 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 8
  br label %1245

1232:                                             ; preds = %1190, %1232
  %1233 = phi i32 [ %1243, %1232 ], [ 0, %1190 ]
  %1234 = phi i64 [ %1242, %1232 ], [ 0, %1190 ]
  %1235 = zext i32 %1233 to i64
  %1236 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 %1235
  %1237 = load i8, i8 addrspace(4)* %1236, align 1, !tbaa !8
  %1238 = zext i8 %1237 to i64
  %1239 = shl i32 %1233, 3
  %1240 = zext i32 %1239 to i64
  %1241 = shl nuw i64 %1238, %1240
  %1242 = or i64 %1241, %1234
  %1243 = add nuw nsw i32 %1233, 1
  %1244 = icmp eq i32 %1243, %1187
  br i1 %1244, label %1245, label %1232

1245:                                             ; preds = %1232, %1192, %1190
  %1246 = phi i8 addrspace(4)* [ %1231, %1192 ], [ %1186, %1190 ], [ %1186, %1232 ]
  %1247 = phi i32 [ %1230, %1192 ], [ 0, %1190 ], [ 0, %1232 ]
  %1248 = phi i64 [ %1229, %1192 ], [ 0, %1190 ], [ %1242, %1232 ]
  %1249 = icmp ugt i32 %1247, 7
  br i1 %1249, label %1252, label %1250

1250:                                             ; preds = %1245
  %1251 = icmp eq i32 %1247, 0
  br i1 %1251, label %1305, label %1292

1252:                                             ; preds = %1245
  %1253 = load i8, i8 addrspace(4)* %1246, align 1, !tbaa !8
  %1254 = zext i8 %1253 to i64
  %1255 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 1
  %1256 = load i8, i8 addrspace(4)* %1255, align 1, !tbaa !8
  %1257 = zext i8 %1256 to i64
  %1258 = shl nuw nsw i64 %1257, 8
  %1259 = or i64 %1258, %1254
  %1260 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 2
  %1261 = load i8, i8 addrspace(4)* %1260, align 1, !tbaa !8
  %1262 = zext i8 %1261 to i64
  %1263 = shl nuw nsw i64 %1262, 16
  %1264 = or i64 %1259, %1263
  %1265 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 3
  %1266 = load i8, i8 addrspace(4)* %1265, align 1, !tbaa !8
  %1267 = zext i8 %1266 to i64
  %1268 = shl nuw nsw i64 %1267, 24
  %1269 = or i64 %1264, %1268
  %1270 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 4
  %1271 = load i8, i8 addrspace(4)* %1270, align 1, !tbaa !8
  %1272 = zext i8 %1271 to i64
  %1273 = shl nuw nsw i64 %1272, 32
  %1274 = or i64 %1269, %1273
  %1275 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 5
  %1276 = load i8, i8 addrspace(4)* %1275, align 1, !tbaa !8
  %1277 = zext i8 %1276 to i64
  %1278 = shl nuw nsw i64 %1277, 40
  %1279 = or i64 %1274, %1278
  %1280 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 6
  %1281 = load i8, i8 addrspace(4)* %1280, align 1, !tbaa !8
  %1282 = zext i8 %1281 to i64
  %1283 = shl nuw nsw i64 %1282, 48
  %1284 = or i64 %1279, %1283
  %1285 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 7
  %1286 = load i8, i8 addrspace(4)* %1285, align 1, !tbaa !8
  %1287 = zext i8 %1286 to i64
  %1288 = shl nuw i64 %1287, 56
  %1289 = or i64 %1284, %1288
  %1290 = add nsw i32 %1247, -8
  %1291 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 8
  br label %1305

1292:                                             ; preds = %1250, %1292
  %1293 = phi i32 [ %1303, %1292 ], [ 0, %1250 ]
  %1294 = phi i64 [ %1302, %1292 ], [ 0, %1250 ]
  %1295 = zext i32 %1293 to i64
  %1296 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 %1295
  %1297 = load i8, i8 addrspace(4)* %1296, align 1, !tbaa !8
  %1298 = zext i8 %1297 to i64
  %1299 = shl i32 %1293, 3
  %1300 = zext i32 %1299 to i64
  %1301 = shl nuw i64 %1298, %1300
  %1302 = or i64 %1301, %1294
  %1303 = add nuw nsw i32 %1293, 1
  %1304 = icmp eq i32 %1303, %1247
  br i1 %1304, label %1305, label %1292

1305:                                             ; preds = %1292, %1252, %1250
  %1306 = phi i8 addrspace(4)* [ %1291, %1252 ], [ %1246, %1250 ], [ %1246, %1292 ]
  %1307 = phi i32 [ %1290, %1252 ], [ 0, %1250 ], [ 0, %1292 ]
  %1308 = phi i64 [ %1289, %1252 ], [ 0, %1250 ], [ %1302, %1292 ]
  %1309 = icmp ugt i32 %1307, 7
  br i1 %1309, label %1312, label %1310

1310:                                             ; preds = %1305
  %1311 = icmp eq i32 %1307, 0
  br i1 %1311, label %1363, label %1350

1312:                                             ; preds = %1305
  %1313 = load i8, i8 addrspace(4)* %1306, align 1, !tbaa !8
  %1314 = zext i8 %1313 to i64
  %1315 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 1
  %1316 = load i8, i8 addrspace(4)* %1315, align 1, !tbaa !8
  %1317 = zext i8 %1316 to i64
  %1318 = shl nuw nsw i64 %1317, 8
  %1319 = or i64 %1318, %1314
  %1320 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 2
  %1321 = load i8, i8 addrspace(4)* %1320, align 1, !tbaa !8
  %1322 = zext i8 %1321 to i64
  %1323 = shl nuw nsw i64 %1322, 16
  %1324 = or i64 %1319, %1323
  %1325 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 3
  %1326 = load i8, i8 addrspace(4)* %1325, align 1, !tbaa !8
  %1327 = zext i8 %1326 to i64
  %1328 = shl nuw nsw i64 %1327, 24
  %1329 = or i64 %1324, %1328
  %1330 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 4
  %1331 = load i8, i8 addrspace(4)* %1330, align 1, !tbaa !8
  %1332 = zext i8 %1331 to i64
  %1333 = shl nuw nsw i64 %1332, 32
  %1334 = or i64 %1329, %1333
  %1335 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 5
  %1336 = load i8, i8 addrspace(4)* %1335, align 1, !tbaa !8
  %1337 = zext i8 %1336 to i64
  %1338 = shl nuw nsw i64 %1337, 40
  %1339 = or i64 %1334, %1338
  %1340 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 6
  %1341 = load i8, i8 addrspace(4)* %1340, align 1, !tbaa !8
  %1342 = zext i8 %1341 to i64
  %1343 = shl nuw nsw i64 %1342, 48
  %1344 = or i64 %1339, %1343
  %1345 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 7
  %1346 = load i8, i8 addrspace(4)* %1345, align 1, !tbaa !8
  %1347 = zext i8 %1346 to i64
  %1348 = shl nuw i64 %1347, 56
  %1349 = or i64 %1344, %1348
  br label %1363

1350:                                             ; preds = %1310, %1350
  %1351 = phi i32 [ %1361, %1350 ], [ 0, %1310 ]
  %1352 = phi i64 [ %1360, %1350 ], [ 0, %1310 ]
  %1353 = zext i32 %1351 to i64
  %1354 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 %1353
  %1355 = load i8, i8 addrspace(4)* %1354, align 1, !tbaa !8
  %1356 = zext i8 %1355 to i64
  %1357 = shl i32 %1351, 3
  %1358 = zext i32 %1357 to i64
  %1359 = shl nuw i64 %1356, %1358
  %1360 = or i64 %1359, %1352
  %1361 = add nuw nsw i32 %1351, 1
  %1362 = icmp eq i32 %1361, %1307
  br i1 %1362, label %1363, label %1350

1363:                                             ; preds = %1350, %1312, %1310
  %1364 = phi i64 [ %1349, %1312 ], [ 0, %1310 ], [ %1360, %1350 ]
  %1365 = shl nuw nsw i64 %946, 2
  %1366 = add nuw nsw i64 %1365, 28
  %1367 = and i64 %1366, 480
  %1368 = and i64 %948, -225
  %1369 = or i64 %1368, %1367
  %1370 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %1369, i64 noundef %1008, i64 noundef %1068, i64 noundef %1128, i64 noundef %1188, i64 noundef %1248, i64 noundef %1308, i64 noundef %1364) #10
  %1371 = sub i64 %938, %946
  %1372 = getelementptr inbounds i8, i8 addrspace(4)* %939, i64 %946
  %1373 = icmp eq i64 %1371, 0
  br i1 %1373, label %1374, label %937

1374:                                             ; preds = %1363, %929
  %1375 = phi <2 x i64> [ %932, %929 ], [ %1370, %1363 ]
  %1376 = extractelement <2 x i64> %1375, i64 0
  %1377 = and i64 %1376, -227
  %1378 = or i64 %1377, 34
  %1379 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %1378, i64 noundef %926, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %1380 = getelementptr inbounds double, double addrspace(1)* %2, i64 11
  %1381 = bitcast double addrspace(1)* %1380 to i64 addrspace(1)*
  %1382 = load i64, i64 addrspace(1)* %1381, align 8, !tbaa !11
  %1383 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %1384 = extractelement <2 x i64> %1383, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), label %1385, label %1389

1385:                                             ; preds = %1374
  %1386 = and i64 %1384, -225
  %1387 = or i64 %1386, 32
  %1388 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %1387, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %1830

1389:                                             ; preds = %1374
  %1390 = and i64 %1384, 2
  %1391 = and i64 %1384, -3
  %1392 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1391, i64 0
  br label %1393

1393:                                             ; preds = %1819, %1389
  %1394 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.3, i64 0, i64 15) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([16 x i8]* addrspacecast ([16 x i8] addrspace(4)* @.str.3 to [16 x i8]*) to i64)), i64 1))), %1389 ], [ %1827, %1819 ]
  %1395 = phi i8 addrspace(4)* [ getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.3, i64 0, i64 0), %1389 ], [ %1828, %1819 ]
  %1396 = phi <2 x i64> [ %1392, %1389 ], [ %1826, %1819 ]
  %1397 = icmp ugt i64 %1394, 56
  %1398 = extractelement <2 x i64> %1396, i64 0
  %1399 = or i64 %1398, %1390
  %1400 = insertelement <2 x i64> poison, i64 %1399, i64 0
  %1401 = select i1 %1397, <2 x i64> %1396, <2 x i64> %1400
  %1402 = tail call i64 @llvm.umin.i64(i64 %1394, i64 56)
  %1403 = trunc i64 %1402 to i32
  %1404 = extractelement <2 x i64> %1401, i64 0
  %1405 = icmp ugt i32 %1403, 7
  br i1 %1405, label %1408, label %1406

1406:                                             ; preds = %1393
  %1407 = icmp eq i32 %1403, 0
  br i1 %1407, label %1461, label %1448

1408:                                             ; preds = %1393
  %1409 = load i8, i8 addrspace(4)* %1395, align 1, !tbaa !8
  %1410 = zext i8 %1409 to i64
  %1411 = getelementptr inbounds i8, i8 addrspace(4)* %1395, i64 1
  %1412 = load i8, i8 addrspace(4)* %1411, align 1, !tbaa !8
  %1413 = zext i8 %1412 to i64
  %1414 = shl nuw nsw i64 %1413, 8
  %1415 = or i64 %1414, %1410
  %1416 = getelementptr inbounds i8, i8 addrspace(4)* %1395, i64 2
  %1417 = load i8, i8 addrspace(4)* %1416, align 1, !tbaa !8
  %1418 = zext i8 %1417 to i64
  %1419 = shl nuw nsw i64 %1418, 16
  %1420 = or i64 %1415, %1419
  %1421 = getelementptr inbounds i8, i8 addrspace(4)* %1395, i64 3
  %1422 = load i8, i8 addrspace(4)* %1421, align 1, !tbaa !8
  %1423 = zext i8 %1422 to i64
  %1424 = shl nuw nsw i64 %1423, 24
  %1425 = or i64 %1420, %1424
  %1426 = getelementptr inbounds i8, i8 addrspace(4)* %1395, i64 4
  %1427 = load i8, i8 addrspace(4)* %1426, align 1, !tbaa !8
  %1428 = zext i8 %1427 to i64
  %1429 = shl nuw nsw i64 %1428, 32
  %1430 = or i64 %1425, %1429
  %1431 = getelementptr inbounds i8, i8 addrspace(4)* %1395, i64 5
  %1432 = load i8, i8 addrspace(4)* %1431, align 1, !tbaa !8
  %1433 = zext i8 %1432 to i64
  %1434 = shl nuw nsw i64 %1433, 40
  %1435 = or i64 %1430, %1434
  %1436 = getelementptr inbounds i8, i8 addrspace(4)* %1395, i64 6
  %1437 = load i8, i8 addrspace(4)* %1436, align 1, !tbaa !8
  %1438 = zext i8 %1437 to i64
  %1439 = shl nuw nsw i64 %1438, 48
  %1440 = or i64 %1435, %1439
  %1441 = getelementptr inbounds i8, i8 addrspace(4)* %1395, i64 7
  %1442 = load i8, i8 addrspace(4)* %1441, align 1, !tbaa !8
  %1443 = zext i8 %1442 to i64
  %1444 = shl nuw i64 %1443, 56
  %1445 = or i64 %1440, %1444
  %1446 = add nsw i32 %1403, -8
  %1447 = getelementptr inbounds i8, i8 addrspace(4)* %1395, i64 8
  br label %1461

1448:                                             ; preds = %1406, %1448
  %1449 = phi i32 [ %1459, %1448 ], [ 0, %1406 ]
  %1450 = phi i64 [ %1458, %1448 ], [ 0, %1406 ]
  %1451 = zext i32 %1449 to i64
  %1452 = getelementptr inbounds i8, i8 addrspace(4)* %1395, i64 %1451
  %1453 = load i8, i8 addrspace(4)* %1452, align 1, !tbaa !8
  %1454 = zext i8 %1453 to i64
  %1455 = shl i32 %1449, 3
  %1456 = zext i32 %1455 to i64
  %1457 = shl nuw i64 %1454, %1456
  %1458 = or i64 %1457, %1450
  %1459 = add nuw nsw i32 %1449, 1
  %1460 = icmp eq i32 %1459, %1403
  br i1 %1460, label %1461, label %1448, !llvm.loop !9

1461:                                             ; preds = %1448, %1408, %1406
  %1462 = phi i8 addrspace(4)* [ %1447, %1408 ], [ %1395, %1406 ], [ %1395, %1448 ]
  %1463 = phi i32 [ %1446, %1408 ], [ 0, %1406 ], [ 0, %1448 ]
  %1464 = phi i64 [ %1445, %1408 ], [ 0, %1406 ], [ %1458, %1448 ]
  %1465 = icmp ugt i32 %1463, 7
  br i1 %1465, label %1468, label %1466

1466:                                             ; preds = %1461
  %1467 = icmp eq i32 %1463, 0
  br i1 %1467, label %1521, label %1508

1468:                                             ; preds = %1461
  %1469 = load i8, i8 addrspace(4)* %1462, align 1, !tbaa !8
  %1470 = zext i8 %1469 to i64
  %1471 = getelementptr inbounds i8, i8 addrspace(4)* %1462, i64 1
  %1472 = load i8, i8 addrspace(4)* %1471, align 1, !tbaa !8
  %1473 = zext i8 %1472 to i64
  %1474 = shl nuw nsw i64 %1473, 8
  %1475 = or i64 %1474, %1470
  %1476 = getelementptr inbounds i8, i8 addrspace(4)* %1462, i64 2
  %1477 = load i8, i8 addrspace(4)* %1476, align 1, !tbaa !8
  %1478 = zext i8 %1477 to i64
  %1479 = shl nuw nsw i64 %1478, 16
  %1480 = or i64 %1475, %1479
  %1481 = getelementptr inbounds i8, i8 addrspace(4)* %1462, i64 3
  %1482 = load i8, i8 addrspace(4)* %1481, align 1, !tbaa !8
  %1483 = zext i8 %1482 to i64
  %1484 = shl nuw nsw i64 %1483, 24
  %1485 = or i64 %1480, %1484
  %1486 = getelementptr inbounds i8, i8 addrspace(4)* %1462, i64 4
  %1487 = load i8, i8 addrspace(4)* %1486, align 1, !tbaa !8
  %1488 = zext i8 %1487 to i64
  %1489 = shl nuw nsw i64 %1488, 32
  %1490 = or i64 %1485, %1489
  %1491 = getelementptr inbounds i8, i8 addrspace(4)* %1462, i64 5
  %1492 = load i8, i8 addrspace(4)* %1491, align 1, !tbaa !8
  %1493 = zext i8 %1492 to i64
  %1494 = shl nuw nsw i64 %1493, 40
  %1495 = or i64 %1490, %1494
  %1496 = getelementptr inbounds i8, i8 addrspace(4)* %1462, i64 6
  %1497 = load i8, i8 addrspace(4)* %1496, align 1, !tbaa !8
  %1498 = zext i8 %1497 to i64
  %1499 = shl nuw nsw i64 %1498, 48
  %1500 = or i64 %1495, %1499
  %1501 = getelementptr inbounds i8, i8 addrspace(4)* %1462, i64 7
  %1502 = load i8, i8 addrspace(4)* %1501, align 1, !tbaa !8
  %1503 = zext i8 %1502 to i64
  %1504 = shl nuw i64 %1503, 56
  %1505 = or i64 %1500, %1504
  %1506 = add nsw i32 %1463, -8
  %1507 = getelementptr inbounds i8, i8 addrspace(4)* %1462, i64 8
  br label %1521

1508:                                             ; preds = %1466, %1508
  %1509 = phi i32 [ %1519, %1508 ], [ 0, %1466 ]
  %1510 = phi i64 [ %1518, %1508 ], [ 0, %1466 ]
  %1511 = zext i32 %1509 to i64
  %1512 = getelementptr inbounds i8, i8 addrspace(4)* %1462, i64 %1511
  %1513 = load i8, i8 addrspace(4)* %1512, align 1, !tbaa !8
  %1514 = zext i8 %1513 to i64
  %1515 = shl i32 %1509, 3
  %1516 = zext i32 %1515 to i64
  %1517 = shl nuw i64 %1514, %1516
  %1518 = or i64 %1517, %1510
  %1519 = add nuw nsw i32 %1509, 1
  %1520 = icmp eq i32 %1519, %1463
  br i1 %1520, label %1521, label %1508

1521:                                             ; preds = %1508, %1468, %1466
  %1522 = phi i8 addrspace(4)* [ %1507, %1468 ], [ %1462, %1466 ], [ %1462, %1508 ]
  %1523 = phi i32 [ %1506, %1468 ], [ 0, %1466 ], [ 0, %1508 ]
  %1524 = phi i64 [ %1505, %1468 ], [ 0, %1466 ], [ %1518, %1508 ]
  %1525 = icmp ugt i32 %1523, 7
  br i1 %1525, label %1528, label %1526

1526:                                             ; preds = %1521
  %1527 = icmp eq i32 %1523, 0
  br i1 %1527, label %1581, label %1568

1528:                                             ; preds = %1521
  %1529 = load i8, i8 addrspace(4)* %1522, align 1, !tbaa !8
  %1530 = zext i8 %1529 to i64
  %1531 = getelementptr inbounds i8, i8 addrspace(4)* %1522, i64 1
  %1532 = load i8, i8 addrspace(4)* %1531, align 1, !tbaa !8
  %1533 = zext i8 %1532 to i64
  %1534 = shl nuw nsw i64 %1533, 8
  %1535 = or i64 %1534, %1530
  %1536 = getelementptr inbounds i8, i8 addrspace(4)* %1522, i64 2
  %1537 = load i8, i8 addrspace(4)* %1536, align 1, !tbaa !8
  %1538 = zext i8 %1537 to i64
  %1539 = shl nuw nsw i64 %1538, 16
  %1540 = or i64 %1535, %1539
  %1541 = getelementptr inbounds i8, i8 addrspace(4)* %1522, i64 3
  %1542 = load i8, i8 addrspace(4)* %1541, align 1, !tbaa !8
  %1543 = zext i8 %1542 to i64
  %1544 = shl nuw nsw i64 %1543, 24
  %1545 = or i64 %1540, %1544
  %1546 = getelementptr inbounds i8, i8 addrspace(4)* %1522, i64 4
  %1547 = load i8, i8 addrspace(4)* %1546, align 1, !tbaa !8
  %1548 = zext i8 %1547 to i64
  %1549 = shl nuw nsw i64 %1548, 32
  %1550 = or i64 %1545, %1549
  %1551 = getelementptr inbounds i8, i8 addrspace(4)* %1522, i64 5
  %1552 = load i8, i8 addrspace(4)* %1551, align 1, !tbaa !8
  %1553 = zext i8 %1552 to i64
  %1554 = shl nuw nsw i64 %1553, 40
  %1555 = or i64 %1550, %1554
  %1556 = getelementptr inbounds i8, i8 addrspace(4)* %1522, i64 6
  %1557 = load i8, i8 addrspace(4)* %1556, align 1, !tbaa !8
  %1558 = zext i8 %1557 to i64
  %1559 = shl nuw nsw i64 %1558, 48
  %1560 = or i64 %1555, %1559
  %1561 = getelementptr inbounds i8, i8 addrspace(4)* %1522, i64 7
  %1562 = load i8, i8 addrspace(4)* %1561, align 1, !tbaa !8
  %1563 = zext i8 %1562 to i64
  %1564 = shl nuw i64 %1563, 56
  %1565 = or i64 %1560, %1564
  %1566 = add nsw i32 %1523, -8
  %1567 = getelementptr inbounds i8, i8 addrspace(4)* %1522, i64 8
  br label %1581

1568:                                             ; preds = %1526, %1568
  %1569 = phi i32 [ %1579, %1568 ], [ 0, %1526 ]
  %1570 = phi i64 [ %1578, %1568 ], [ 0, %1526 ]
  %1571 = zext i32 %1569 to i64
  %1572 = getelementptr inbounds i8, i8 addrspace(4)* %1522, i64 %1571
  %1573 = load i8, i8 addrspace(4)* %1572, align 1, !tbaa !8
  %1574 = zext i8 %1573 to i64
  %1575 = shl i32 %1569, 3
  %1576 = zext i32 %1575 to i64
  %1577 = shl nuw i64 %1574, %1576
  %1578 = or i64 %1577, %1570
  %1579 = add nuw nsw i32 %1569, 1
  %1580 = icmp eq i32 %1579, %1523
  br i1 %1580, label %1581, label %1568

1581:                                             ; preds = %1568, %1528, %1526
  %1582 = phi i8 addrspace(4)* [ %1567, %1528 ], [ %1522, %1526 ], [ %1522, %1568 ]
  %1583 = phi i32 [ %1566, %1528 ], [ 0, %1526 ], [ 0, %1568 ]
  %1584 = phi i64 [ %1565, %1528 ], [ 0, %1526 ], [ %1578, %1568 ]
  %1585 = icmp ugt i32 %1583, 7
  br i1 %1585, label %1588, label %1586

1586:                                             ; preds = %1581
  %1587 = icmp eq i32 %1583, 0
  br i1 %1587, label %1641, label %1628

1588:                                             ; preds = %1581
  %1589 = load i8, i8 addrspace(4)* %1582, align 1, !tbaa !8
  %1590 = zext i8 %1589 to i64
  %1591 = getelementptr inbounds i8, i8 addrspace(4)* %1582, i64 1
  %1592 = load i8, i8 addrspace(4)* %1591, align 1, !tbaa !8
  %1593 = zext i8 %1592 to i64
  %1594 = shl nuw nsw i64 %1593, 8
  %1595 = or i64 %1594, %1590
  %1596 = getelementptr inbounds i8, i8 addrspace(4)* %1582, i64 2
  %1597 = load i8, i8 addrspace(4)* %1596, align 1, !tbaa !8
  %1598 = zext i8 %1597 to i64
  %1599 = shl nuw nsw i64 %1598, 16
  %1600 = or i64 %1595, %1599
  %1601 = getelementptr inbounds i8, i8 addrspace(4)* %1582, i64 3
  %1602 = load i8, i8 addrspace(4)* %1601, align 1, !tbaa !8
  %1603 = zext i8 %1602 to i64
  %1604 = shl nuw nsw i64 %1603, 24
  %1605 = or i64 %1600, %1604
  %1606 = getelementptr inbounds i8, i8 addrspace(4)* %1582, i64 4
  %1607 = load i8, i8 addrspace(4)* %1606, align 1, !tbaa !8
  %1608 = zext i8 %1607 to i64
  %1609 = shl nuw nsw i64 %1608, 32
  %1610 = or i64 %1605, %1609
  %1611 = getelementptr inbounds i8, i8 addrspace(4)* %1582, i64 5
  %1612 = load i8, i8 addrspace(4)* %1611, align 1, !tbaa !8
  %1613 = zext i8 %1612 to i64
  %1614 = shl nuw nsw i64 %1613, 40
  %1615 = or i64 %1610, %1614
  %1616 = getelementptr inbounds i8, i8 addrspace(4)* %1582, i64 6
  %1617 = load i8, i8 addrspace(4)* %1616, align 1, !tbaa !8
  %1618 = zext i8 %1617 to i64
  %1619 = shl nuw nsw i64 %1618, 48
  %1620 = or i64 %1615, %1619
  %1621 = getelementptr inbounds i8, i8 addrspace(4)* %1582, i64 7
  %1622 = load i8, i8 addrspace(4)* %1621, align 1, !tbaa !8
  %1623 = zext i8 %1622 to i64
  %1624 = shl nuw i64 %1623, 56
  %1625 = or i64 %1620, %1624
  %1626 = add nsw i32 %1583, -8
  %1627 = getelementptr inbounds i8, i8 addrspace(4)* %1582, i64 8
  br label %1641

1628:                                             ; preds = %1586, %1628
  %1629 = phi i32 [ %1639, %1628 ], [ 0, %1586 ]
  %1630 = phi i64 [ %1638, %1628 ], [ 0, %1586 ]
  %1631 = zext i32 %1629 to i64
  %1632 = getelementptr inbounds i8, i8 addrspace(4)* %1582, i64 %1631
  %1633 = load i8, i8 addrspace(4)* %1632, align 1, !tbaa !8
  %1634 = zext i8 %1633 to i64
  %1635 = shl i32 %1629, 3
  %1636 = zext i32 %1635 to i64
  %1637 = shl nuw i64 %1634, %1636
  %1638 = or i64 %1637, %1630
  %1639 = add nuw nsw i32 %1629, 1
  %1640 = icmp eq i32 %1639, %1583
  br i1 %1640, label %1641, label %1628

1641:                                             ; preds = %1628, %1588, %1586
  %1642 = phi i8 addrspace(4)* [ %1627, %1588 ], [ %1582, %1586 ], [ %1582, %1628 ]
  %1643 = phi i32 [ %1626, %1588 ], [ 0, %1586 ], [ 0, %1628 ]
  %1644 = phi i64 [ %1625, %1588 ], [ 0, %1586 ], [ %1638, %1628 ]
  %1645 = icmp ugt i32 %1643, 7
  br i1 %1645, label %1648, label %1646

1646:                                             ; preds = %1641
  %1647 = icmp eq i32 %1643, 0
  br i1 %1647, label %1701, label %1688

1648:                                             ; preds = %1641
  %1649 = load i8, i8 addrspace(4)* %1642, align 1, !tbaa !8
  %1650 = zext i8 %1649 to i64
  %1651 = getelementptr inbounds i8, i8 addrspace(4)* %1642, i64 1
  %1652 = load i8, i8 addrspace(4)* %1651, align 1, !tbaa !8
  %1653 = zext i8 %1652 to i64
  %1654 = shl nuw nsw i64 %1653, 8
  %1655 = or i64 %1654, %1650
  %1656 = getelementptr inbounds i8, i8 addrspace(4)* %1642, i64 2
  %1657 = load i8, i8 addrspace(4)* %1656, align 1, !tbaa !8
  %1658 = zext i8 %1657 to i64
  %1659 = shl nuw nsw i64 %1658, 16
  %1660 = or i64 %1655, %1659
  %1661 = getelementptr inbounds i8, i8 addrspace(4)* %1642, i64 3
  %1662 = load i8, i8 addrspace(4)* %1661, align 1, !tbaa !8
  %1663 = zext i8 %1662 to i64
  %1664 = shl nuw nsw i64 %1663, 24
  %1665 = or i64 %1660, %1664
  %1666 = getelementptr inbounds i8, i8 addrspace(4)* %1642, i64 4
  %1667 = load i8, i8 addrspace(4)* %1666, align 1, !tbaa !8
  %1668 = zext i8 %1667 to i64
  %1669 = shl nuw nsw i64 %1668, 32
  %1670 = or i64 %1665, %1669
  %1671 = getelementptr inbounds i8, i8 addrspace(4)* %1642, i64 5
  %1672 = load i8, i8 addrspace(4)* %1671, align 1, !tbaa !8
  %1673 = zext i8 %1672 to i64
  %1674 = shl nuw nsw i64 %1673, 40
  %1675 = or i64 %1670, %1674
  %1676 = getelementptr inbounds i8, i8 addrspace(4)* %1642, i64 6
  %1677 = load i8, i8 addrspace(4)* %1676, align 1, !tbaa !8
  %1678 = zext i8 %1677 to i64
  %1679 = shl nuw nsw i64 %1678, 48
  %1680 = or i64 %1675, %1679
  %1681 = getelementptr inbounds i8, i8 addrspace(4)* %1642, i64 7
  %1682 = load i8, i8 addrspace(4)* %1681, align 1, !tbaa !8
  %1683 = zext i8 %1682 to i64
  %1684 = shl nuw i64 %1683, 56
  %1685 = or i64 %1680, %1684
  %1686 = add nsw i32 %1643, -8
  %1687 = getelementptr inbounds i8, i8 addrspace(4)* %1642, i64 8
  br label %1701

1688:                                             ; preds = %1646, %1688
  %1689 = phi i32 [ %1699, %1688 ], [ 0, %1646 ]
  %1690 = phi i64 [ %1698, %1688 ], [ 0, %1646 ]
  %1691 = zext i32 %1689 to i64
  %1692 = getelementptr inbounds i8, i8 addrspace(4)* %1642, i64 %1691
  %1693 = load i8, i8 addrspace(4)* %1692, align 1, !tbaa !8
  %1694 = zext i8 %1693 to i64
  %1695 = shl i32 %1689, 3
  %1696 = zext i32 %1695 to i64
  %1697 = shl nuw i64 %1694, %1696
  %1698 = or i64 %1697, %1690
  %1699 = add nuw nsw i32 %1689, 1
  %1700 = icmp eq i32 %1699, %1643
  br i1 %1700, label %1701, label %1688

1701:                                             ; preds = %1688, %1648, %1646
  %1702 = phi i8 addrspace(4)* [ %1687, %1648 ], [ %1642, %1646 ], [ %1642, %1688 ]
  %1703 = phi i32 [ %1686, %1648 ], [ 0, %1646 ], [ 0, %1688 ]
  %1704 = phi i64 [ %1685, %1648 ], [ 0, %1646 ], [ %1698, %1688 ]
  %1705 = icmp ugt i32 %1703, 7
  br i1 %1705, label %1708, label %1706

1706:                                             ; preds = %1701
  %1707 = icmp eq i32 %1703, 0
  br i1 %1707, label %1761, label %1748

1708:                                             ; preds = %1701
  %1709 = load i8, i8 addrspace(4)* %1702, align 1, !tbaa !8
  %1710 = zext i8 %1709 to i64
  %1711 = getelementptr inbounds i8, i8 addrspace(4)* %1702, i64 1
  %1712 = load i8, i8 addrspace(4)* %1711, align 1, !tbaa !8
  %1713 = zext i8 %1712 to i64
  %1714 = shl nuw nsw i64 %1713, 8
  %1715 = or i64 %1714, %1710
  %1716 = getelementptr inbounds i8, i8 addrspace(4)* %1702, i64 2
  %1717 = load i8, i8 addrspace(4)* %1716, align 1, !tbaa !8
  %1718 = zext i8 %1717 to i64
  %1719 = shl nuw nsw i64 %1718, 16
  %1720 = or i64 %1715, %1719
  %1721 = getelementptr inbounds i8, i8 addrspace(4)* %1702, i64 3
  %1722 = load i8, i8 addrspace(4)* %1721, align 1, !tbaa !8
  %1723 = zext i8 %1722 to i64
  %1724 = shl nuw nsw i64 %1723, 24
  %1725 = or i64 %1720, %1724
  %1726 = getelementptr inbounds i8, i8 addrspace(4)* %1702, i64 4
  %1727 = load i8, i8 addrspace(4)* %1726, align 1, !tbaa !8
  %1728 = zext i8 %1727 to i64
  %1729 = shl nuw nsw i64 %1728, 32
  %1730 = or i64 %1725, %1729
  %1731 = getelementptr inbounds i8, i8 addrspace(4)* %1702, i64 5
  %1732 = load i8, i8 addrspace(4)* %1731, align 1, !tbaa !8
  %1733 = zext i8 %1732 to i64
  %1734 = shl nuw nsw i64 %1733, 40
  %1735 = or i64 %1730, %1734
  %1736 = getelementptr inbounds i8, i8 addrspace(4)* %1702, i64 6
  %1737 = load i8, i8 addrspace(4)* %1736, align 1, !tbaa !8
  %1738 = zext i8 %1737 to i64
  %1739 = shl nuw nsw i64 %1738, 48
  %1740 = or i64 %1735, %1739
  %1741 = getelementptr inbounds i8, i8 addrspace(4)* %1702, i64 7
  %1742 = load i8, i8 addrspace(4)* %1741, align 1, !tbaa !8
  %1743 = zext i8 %1742 to i64
  %1744 = shl nuw i64 %1743, 56
  %1745 = or i64 %1740, %1744
  %1746 = add nsw i32 %1703, -8
  %1747 = getelementptr inbounds i8, i8 addrspace(4)* %1702, i64 8
  br label %1761

1748:                                             ; preds = %1706, %1748
  %1749 = phi i32 [ %1759, %1748 ], [ 0, %1706 ]
  %1750 = phi i64 [ %1758, %1748 ], [ 0, %1706 ]
  %1751 = zext i32 %1749 to i64
  %1752 = getelementptr inbounds i8, i8 addrspace(4)* %1702, i64 %1751
  %1753 = load i8, i8 addrspace(4)* %1752, align 1, !tbaa !8
  %1754 = zext i8 %1753 to i64
  %1755 = shl i32 %1749, 3
  %1756 = zext i32 %1755 to i64
  %1757 = shl nuw i64 %1754, %1756
  %1758 = or i64 %1757, %1750
  %1759 = add nuw nsw i32 %1749, 1
  %1760 = icmp eq i32 %1759, %1703
  br i1 %1760, label %1761, label %1748

1761:                                             ; preds = %1748, %1708, %1706
  %1762 = phi i8 addrspace(4)* [ %1747, %1708 ], [ %1702, %1706 ], [ %1702, %1748 ]
  %1763 = phi i32 [ %1746, %1708 ], [ 0, %1706 ], [ 0, %1748 ]
  %1764 = phi i64 [ %1745, %1708 ], [ 0, %1706 ], [ %1758, %1748 ]
  %1765 = icmp ugt i32 %1763, 7
  br i1 %1765, label %1768, label %1766

1766:                                             ; preds = %1761
  %1767 = icmp eq i32 %1763, 0
  br i1 %1767, label %1819, label %1806

1768:                                             ; preds = %1761
  %1769 = load i8, i8 addrspace(4)* %1762, align 1, !tbaa !8
  %1770 = zext i8 %1769 to i64
  %1771 = getelementptr inbounds i8, i8 addrspace(4)* %1762, i64 1
  %1772 = load i8, i8 addrspace(4)* %1771, align 1, !tbaa !8
  %1773 = zext i8 %1772 to i64
  %1774 = shl nuw nsw i64 %1773, 8
  %1775 = or i64 %1774, %1770
  %1776 = getelementptr inbounds i8, i8 addrspace(4)* %1762, i64 2
  %1777 = load i8, i8 addrspace(4)* %1776, align 1, !tbaa !8
  %1778 = zext i8 %1777 to i64
  %1779 = shl nuw nsw i64 %1778, 16
  %1780 = or i64 %1775, %1779
  %1781 = getelementptr inbounds i8, i8 addrspace(4)* %1762, i64 3
  %1782 = load i8, i8 addrspace(4)* %1781, align 1, !tbaa !8
  %1783 = zext i8 %1782 to i64
  %1784 = shl nuw nsw i64 %1783, 24
  %1785 = or i64 %1780, %1784
  %1786 = getelementptr inbounds i8, i8 addrspace(4)* %1762, i64 4
  %1787 = load i8, i8 addrspace(4)* %1786, align 1, !tbaa !8
  %1788 = zext i8 %1787 to i64
  %1789 = shl nuw nsw i64 %1788, 32
  %1790 = or i64 %1785, %1789
  %1791 = getelementptr inbounds i8, i8 addrspace(4)* %1762, i64 5
  %1792 = load i8, i8 addrspace(4)* %1791, align 1, !tbaa !8
  %1793 = zext i8 %1792 to i64
  %1794 = shl nuw nsw i64 %1793, 40
  %1795 = or i64 %1790, %1794
  %1796 = getelementptr inbounds i8, i8 addrspace(4)* %1762, i64 6
  %1797 = load i8, i8 addrspace(4)* %1796, align 1, !tbaa !8
  %1798 = zext i8 %1797 to i64
  %1799 = shl nuw nsw i64 %1798, 48
  %1800 = or i64 %1795, %1799
  %1801 = getelementptr inbounds i8, i8 addrspace(4)* %1762, i64 7
  %1802 = load i8, i8 addrspace(4)* %1801, align 1, !tbaa !8
  %1803 = zext i8 %1802 to i64
  %1804 = shl nuw i64 %1803, 56
  %1805 = or i64 %1800, %1804
  br label %1819

1806:                                             ; preds = %1766, %1806
  %1807 = phi i32 [ %1817, %1806 ], [ 0, %1766 ]
  %1808 = phi i64 [ %1816, %1806 ], [ 0, %1766 ]
  %1809 = zext i32 %1807 to i64
  %1810 = getelementptr inbounds i8, i8 addrspace(4)* %1762, i64 %1809
  %1811 = load i8, i8 addrspace(4)* %1810, align 1, !tbaa !8
  %1812 = zext i8 %1811 to i64
  %1813 = shl i32 %1807, 3
  %1814 = zext i32 %1813 to i64
  %1815 = shl nuw i64 %1812, %1814
  %1816 = or i64 %1815, %1808
  %1817 = add nuw nsw i32 %1807, 1
  %1818 = icmp eq i32 %1817, %1763
  br i1 %1818, label %1819, label %1806

1819:                                             ; preds = %1806, %1768, %1766
  %1820 = phi i64 [ %1805, %1768 ], [ 0, %1766 ], [ %1816, %1806 ]
  %1821 = shl nuw nsw i64 %1402, 2
  %1822 = add nuw nsw i64 %1821, 28
  %1823 = and i64 %1822, 480
  %1824 = and i64 %1404, -225
  %1825 = or i64 %1824, %1823
  %1826 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %1825, i64 noundef %1464, i64 noundef %1524, i64 noundef %1584, i64 noundef %1644, i64 noundef %1704, i64 noundef %1764, i64 noundef %1820) #10
  %1827 = sub i64 %1394, %1402
  %1828 = getelementptr inbounds i8, i8 addrspace(4)* %1395, i64 %1402
  %1829 = icmp eq i64 %1827, 0
  br i1 %1829, label %1830, label %1393

1830:                                             ; preds = %1819, %1385
  %1831 = phi <2 x i64> [ %1388, %1385 ], [ %1826, %1819 ]
  %1832 = extractelement <2 x i64> %1831, i64 0
  %1833 = and i64 %1832, -227
  %1834 = or i64 %1833, 34
  %1835 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %1834, i64 noundef %1382, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %1836 = getelementptr inbounds double, double addrspace(1)* %3, i64 325
  %1837 = bitcast double addrspace(1)* %1836 to i64 addrspace(1)*
  %1838 = load i64, i64 addrspace(1)* %1837, align 8, !tbaa !11
  %1839 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %1840 = extractelement <2 x i64> %1839, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.4, i64 0, i64 0) to i8*), i8* null), label %1841, label %1845

1841:                                             ; preds = %1830
  %1842 = and i64 %1840, -225
  %1843 = or i64 %1842, 32
  %1844 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %1843, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %2286

1845:                                             ; preds = %1830
  %1846 = and i64 %1840, 2
  %1847 = and i64 %1840, -3
  %1848 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1847, i64 0
  br label %1849

1849:                                             ; preds = %2275, %1845
  %1850 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.4, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.4, i64 0, i64 15) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([16 x i8]* addrspacecast ([16 x i8] addrspace(4)* @.str.4 to [16 x i8]*) to i64)), i64 1))), %1845 ], [ %2283, %2275 ]
  %1851 = phi i8 addrspace(4)* [ getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.4, i64 0, i64 0), %1845 ], [ %2284, %2275 ]
  %1852 = phi <2 x i64> [ %1848, %1845 ], [ %2282, %2275 ]
  %1853 = icmp ugt i64 %1850, 56
  %1854 = extractelement <2 x i64> %1852, i64 0
  %1855 = or i64 %1854, %1846
  %1856 = insertelement <2 x i64> poison, i64 %1855, i64 0
  %1857 = select i1 %1853, <2 x i64> %1852, <2 x i64> %1856
  %1858 = tail call i64 @llvm.umin.i64(i64 %1850, i64 56)
  %1859 = trunc i64 %1858 to i32
  %1860 = extractelement <2 x i64> %1857, i64 0
  %1861 = icmp ugt i32 %1859, 7
  br i1 %1861, label %1864, label %1862

1862:                                             ; preds = %1849
  %1863 = icmp eq i32 %1859, 0
  br i1 %1863, label %1917, label %1904

1864:                                             ; preds = %1849
  %1865 = load i8, i8 addrspace(4)* %1851, align 1, !tbaa !8
  %1866 = zext i8 %1865 to i64
  %1867 = getelementptr inbounds i8, i8 addrspace(4)* %1851, i64 1
  %1868 = load i8, i8 addrspace(4)* %1867, align 1, !tbaa !8
  %1869 = zext i8 %1868 to i64
  %1870 = shl nuw nsw i64 %1869, 8
  %1871 = or i64 %1870, %1866
  %1872 = getelementptr inbounds i8, i8 addrspace(4)* %1851, i64 2
  %1873 = load i8, i8 addrspace(4)* %1872, align 1, !tbaa !8
  %1874 = zext i8 %1873 to i64
  %1875 = shl nuw nsw i64 %1874, 16
  %1876 = or i64 %1871, %1875
  %1877 = getelementptr inbounds i8, i8 addrspace(4)* %1851, i64 3
  %1878 = load i8, i8 addrspace(4)* %1877, align 1, !tbaa !8
  %1879 = zext i8 %1878 to i64
  %1880 = shl nuw nsw i64 %1879, 24
  %1881 = or i64 %1876, %1880
  %1882 = getelementptr inbounds i8, i8 addrspace(4)* %1851, i64 4
  %1883 = load i8, i8 addrspace(4)* %1882, align 1, !tbaa !8
  %1884 = zext i8 %1883 to i64
  %1885 = shl nuw nsw i64 %1884, 32
  %1886 = or i64 %1881, %1885
  %1887 = getelementptr inbounds i8, i8 addrspace(4)* %1851, i64 5
  %1888 = load i8, i8 addrspace(4)* %1887, align 1, !tbaa !8
  %1889 = zext i8 %1888 to i64
  %1890 = shl nuw nsw i64 %1889, 40
  %1891 = or i64 %1886, %1890
  %1892 = getelementptr inbounds i8, i8 addrspace(4)* %1851, i64 6
  %1893 = load i8, i8 addrspace(4)* %1892, align 1, !tbaa !8
  %1894 = zext i8 %1893 to i64
  %1895 = shl nuw nsw i64 %1894, 48
  %1896 = or i64 %1891, %1895
  %1897 = getelementptr inbounds i8, i8 addrspace(4)* %1851, i64 7
  %1898 = load i8, i8 addrspace(4)* %1897, align 1, !tbaa !8
  %1899 = zext i8 %1898 to i64
  %1900 = shl nuw i64 %1899, 56
  %1901 = or i64 %1896, %1900
  %1902 = add nsw i32 %1859, -8
  %1903 = getelementptr inbounds i8, i8 addrspace(4)* %1851, i64 8
  br label %1917

1904:                                             ; preds = %1862, %1904
  %1905 = phi i32 [ %1915, %1904 ], [ 0, %1862 ]
  %1906 = phi i64 [ %1914, %1904 ], [ 0, %1862 ]
  %1907 = zext i32 %1905 to i64
  %1908 = getelementptr inbounds i8, i8 addrspace(4)* %1851, i64 %1907
  %1909 = load i8, i8 addrspace(4)* %1908, align 1, !tbaa !8
  %1910 = zext i8 %1909 to i64
  %1911 = shl i32 %1905, 3
  %1912 = zext i32 %1911 to i64
  %1913 = shl nuw i64 %1910, %1912
  %1914 = or i64 %1913, %1906
  %1915 = add nuw nsw i32 %1905, 1
  %1916 = icmp eq i32 %1915, %1859
  br i1 %1916, label %1917, label %1904, !llvm.loop !9

1917:                                             ; preds = %1904, %1864, %1862
  %1918 = phi i8 addrspace(4)* [ %1903, %1864 ], [ %1851, %1862 ], [ %1851, %1904 ]
  %1919 = phi i32 [ %1902, %1864 ], [ 0, %1862 ], [ 0, %1904 ]
  %1920 = phi i64 [ %1901, %1864 ], [ 0, %1862 ], [ %1914, %1904 ]
  %1921 = icmp ugt i32 %1919, 7
  br i1 %1921, label %1924, label %1922

1922:                                             ; preds = %1917
  %1923 = icmp eq i32 %1919, 0
  br i1 %1923, label %1977, label %1964

1924:                                             ; preds = %1917
  %1925 = load i8, i8 addrspace(4)* %1918, align 1, !tbaa !8
  %1926 = zext i8 %1925 to i64
  %1927 = getelementptr inbounds i8, i8 addrspace(4)* %1918, i64 1
  %1928 = load i8, i8 addrspace(4)* %1927, align 1, !tbaa !8
  %1929 = zext i8 %1928 to i64
  %1930 = shl nuw nsw i64 %1929, 8
  %1931 = or i64 %1930, %1926
  %1932 = getelementptr inbounds i8, i8 addrspace(4)* %1918, i64 2
  %1933 = load i8, i8 addrspace(4)* %1932, align 1, !tbaa !8
  %1934 = zext i8 %1933 to i64
  %1935 = shl nuw nsw i64 %1934, 16
  %1936 = or i64 %1931, %1935
  %1937 = getelementptr inbounds i8, i8 addrspace(4)* %1918, i64 3
  %1938 = load i8, i8 addrspace(4)* %1937, align 1, !tbaa !8
  %1939 = zext i8 %1938 to i64
  %1940 = shl nuw nsw i64 %1939, 24
  %1941 = or i64 %1936, %1940
  %1942 = getelementptr inbounds i8, i8 addrspace(4)* %1918, i64 4
  %1943 = load i8, i8 addrspace(4)* %1942, align 1, !tbaa !8
  %1944 = zext i8 %1943 to i64
  %1945 = shl nuw nsw i64 %1944, 32
  %1946 = or i64 %1941, %1945
  %1947 = getelementptr inbounds i8, i8 addrspace(4)* %1918, i64 5
  %1948 = load i8, i8 addrspace(4)* %1947, align 1, !tbaa !8
  %1949 = zext i8 %1948 to i64
  %1950 = shl nuw nsw i64 %1949, 40
  %1951 = or i64 %1946, %1950
  %1952 = getelementptr inbounds i8, i8 addrspace(4)* %1918, i64 6
  %1953 = load i8, i8 addrspace(4)* %1952, align 1, !tbaa !8
  %1954 = zext i8 %1953 to i64
  %1955 = shl nuw nsw i64 %1954, 48
  %1956 = or i64 %1951, %1955
  %1957 = getelementptr inbounds i8, i8 addrspace(4)* %1918, i64 7
  %1958 = load i8, i8 addrspace(4)* %1957, align 1, !tbaa !8
  %1959 = zext i8 %1958 to i64
  %1960 = shl nuw i64 %1959, 56
  %1961 = or i64 %1956, %1960
  %1962 = add nsw i32 %1919, -8
  %1963 = getelementptr inbounds i8, i8 addrspace(4)* %1918, i64 8
  br label %1977

1964:                                             ; preds = %1922, %1964
  %1965 = phi i32 [ %1975, %1964 ], [ 0, %1922 ]
  %1966 = phi i64 [ %1974, %1964 ], [ 0, %1922 ]
  %1967 = zext i32 %1965 to i64
  %1968 = getelementptr inbounds i8, i8 addrspace(4)* %1918, i64 %1967
  %1969 = load i8, i8 addrspace(4)* %1968, align 1, !tbaa !8
  %1970 = zext i8 %1969 to i64
  %1971 = shl i32 %1965, 3
  %1972 = zext i32 %1971 to i64
  %1973 = shl nuw i64 %1970, %1972
  %1974 = or i64 %1973, %1966
  %1975 = add nuw nsw i32 %1965, 1
  %1976 = icmp eq i32 %1975, %1919
  br i1 %1976, label %1977, label %1964

1977:                                             ; preds = %1964, %1924, %1922
  %1978 = phi i8 addrspace(4)* [ %1963, %1924 ], [ %1918, %1922 ], [ %1918, %1964 ]
  %1979 = phi i32 [ %1962, %1924 ], [ 0, %1922 ], [ 0, %1964 ]
  %1980 = phi i64 [ %1961, %1924 ], [ 0, %1922 ], [ %1974, %1964 ]
  %1981 = icmp ugt i32 %1979, 7
  br i1 %1981, label %1984, label %1982

1982:                                             ; preds = %1977
  %1983 = icmp eq i32 %1979, 0
  br i1 %1983, label %2037, label %2024

1984:                                             ; preds = %1977
  %1985 = load i8, i8 addrspace(4)* %1978, align 1, !tbaa !8
  %1986 = zext i8 %1985 to i64
  %1987 = getelementptr inbounds i8, i8 addrspace(4)* %1978, i64 1
  %1988 = load i8, i8 addrspace(4)* %1987, align 1, !tbaa !8
  %1989 = zext i8 %1988 to i64
  %1990 = shl nuw nsw i64 %1989, 8
  %1991 = or i64 %1990, %1986
  %1992 = getelementptr inbounds i8, i8 addrspace(4)* %1978, i64 2
  %1993 = load i8, i8 addrspace(4)* %1992, align 1, !tbaa !8
  %1994 = zext i8 %1993 to i64
  %1995 = shl nuw nsw i64 %1994, 16
  %1996 = or i64 %1991, %1995
  %1997 = getelementptr inbounds i8, i8 addrspace(4)* %1978, i64 3
  %1998 = load i8, i8 addrspace(4)* %1997, align 1, !tbaa !8
  %1999 = zext i8 %1998 to i64
  %2000 = shl nuw nsw i64 %1999, 24
  %2001 = or i64 %1996, %2000
  %2002 = getelementptr inbounds i8, i8 addrspace(4)* %1978, i64 4
  %2003 = load i8, i8 addrspace(4)* %2002, align 1, !tbaa !8
  %2004 = zext i8 %2003 to i64
  %2005 = shl nuw nsw i64 %2004, 32
  %2006 = or i64 %2001, %2005
  %2007 = getelementptr inbounds i8, i8 addrspace(4)* %1978, i64 5
  %2008 = load i8, i8 addrspace(4)* %2007, align 1, !tbaa !8
  %2009 = zext i8 %2008 to i64
  %2010 = shl nuw nsw i64 %2009, 40
  %2011 = or i64 %2006, %2010
  %2012 = getelementptr inbounds i8, i8 addrspace(4)* %1978, i64 6
  %2013 = load i8, i8 addrspace(4)* %2012, align 1, !tbaa !8
  %2014 = zext i8 %2013 to i64
  %2015 = shl nuw nsw i64 %2014, 48
  %2016 = or i64 %2011, %2015
  %2017 = getelementptr inbounds i8, i8 addrspace(4)* %1978, i64 7
  %2018 = load i8, i8 addrspace(4)* %2017, align 1, !tbaa !8
  %2019 = zext i8 %2018 to i64
  %2020 = shl nuw i64 %2019, 56
  %2021 = or i64 %2016, %2020
  %2022 = add nsw i32 %1979, -8
  %2023 = getelementptr inbounds i8, i8 addrspace(4)* %1978, i64 8
  br label %2037

2024:                                             ; preds = %1982, %2024
  %2025 = phi i32 [ %2035, %2024 ], [ 0, %1982 ]
  %2026 = phi i64 [ %2034, %2024 ], [ 0, %1982 ]
  %2027 = zext i32 %2025 to i64
  %2028 = getelementptr inbounds i8, i8 addrspace(4)* %1978, i64 %2027
  %2029 = load i8, i8 addrspace(4)* %2028, align 1, !tbaa !8
  %2030 = zext i8 %2029 to i64
  %2031 = shl i32 %2025, 3
  %2032 = zext i32 %2031 to i64
  %2033 = shl nuw i64 %2030, %2032
  %2034 = or i64 %2033, %2026
  %2035 = add nuw nsw i32 %2025, 1
  %2036 = icmp eq i32 %2035, %1979
  br i1 %2036, label %2037, label %2024

2037:                                             ; preds = %2024, %1984, %1982
  %2038 = phi i8 addrspace(4)* [ %2023, %1984 ], [ %1978, %1982 ], [ %1978, %2024 ]
  %2039 = phi i32 [ %2022, %1984 ], [ 0, %1982 ], [ 0, %2024 ]
  %2040 = phi i64 [ %2021, %1984 ], [ 0, %1982 ], [ %2034, %2024 ]
  %2041 = icmp ugt i32 %2039, 7
  br i1 %2041, label %2044, label %2042

2042:                                             ; preds = %2037
  %2043 = icmp eq i32 %2039, 0
  br i1 %2043, label %2097, label %2084

2044:                                             ; preds = %2037
  %2045 = load i8, i8 addrspace(4)* %2038, align 1, !tbaa !8
  %2046 = zext i8 %2045 to i64
  %2047 = getelementptr inbounds i8, i8 addrspace(4)* %2038, i64 1
  %2048 = load i8, i8 addrspace(4)* %2047, align 1, !tbaa !8
  %2049 = zext i8 %2048 to i64
  %2050 = shl nuw nsw i64 %2049, 8
  %2051 = or i64 %2050, %2046
  %2052 = getelementptr inbounds i8, i8 addrspace(4)* %2038, i64 2
  %2053 = load i8, i8 addrspace(4)* %2052, align 1, !tbaa !8
  %2054 = zext i8 %2053 to i64
  %2055 = shl nuw nsw i64 %2054, 16
  %2056 = or i64 %2051, %2055
  %2057 = getelementptr inbounds i8, i8 addrspace(4)* %2038, i64 3
  %2058 = load i8, i8 addrspace(4)* %2057, align 1, !tbaa !8
  %2059 = zext i8 %2058 to i64
  %2060 = shl nuw nsw i64 %2059, 24
  %2061 = or i64 %2056, %2060
  %2062 = getelementptr inbounds i8, i8 addrspace(4)* %2038, i64 4
  %2063 = load i8, i8 addrspace(4)* %2062, align 1, !tbaa !8
  %2064 = zext i8 %2063 to i64
  %2065 = shl nuw nsw i64 %2064, 32
  %2066 = or i64 %2061, %2065
  %2067 = getelementptr inbounds i8, i8 addrspace(4)* %2038, i64 5
  %2068 = load i8, i8 addrspace(4)* %2067, align 1, !tbaa !8
  %2069 = zext i8 %2068 to i64
  %2070 = shl nuw nsw i64 %2069, 40
  %2071 = or i64 %2066, %2070
  %2072 = getelementptr inbounds i8, i8 addrspace(4)* %2038, i64 6
  %2073 = load i8, i8 addrspace(4)* %2072, align 1, !tbaa !8
  %2074 = zext i8 %2073 to i64
  %2075 = shl nuw nsw i64 %2074, 48
  %2076 = or i64 %2071, %2075
  %2077 = getelementptr inbounds i8, i8 addrspace(4)* %2038, i64 7
  %2078 = load i8, i8 addrspace(4)* %2077, align 1, !tbaa !8
  %2079 = zext i8 %2078 to i64
  %2080 = shl nuw i64 %2079, 56
  %2081 = or i64 %2076, %2080
  %2082 = add nsw i32 %2039, -8
  %2083 = getelementptr inbounds i8, i8 addrspace(4)* %2038, i64 8
  br label %2097

2084:                                             ; preds = %2042, %2084
  %2085 = phi i32 [ %2095, %2084 ], [ 0, %2042 ]
  %2086 = phi i64 [ %2094, %2084 ], [ 0, %2042 ]
  %2087 = zext i32 %2085 to i64
  %2088 = getelementptr inbounds i8, i8 addrspace(4)* %2038, i64 %2087
  %2089 = load i8, i8 addrspace(4)* %2088, align 1, !tbaa !8
  %2090 = zext i8 %2089 to i64
  %2091 = shl i32 %2085, 3
  %2092 = zext i32 %2091 to i64
  %2093 = shl nuw i64 %2090, %2092
  %2094 = or i64 %2093, %2086
  %2095 = add nuw nsw i32 %2085, 1
  %2096 = icmp eq i32 %2095, %2039
  br i1 %2096, label %2097, label %2084

2097:                                             ; preds = %2084, %2044, %2042
  %2098 = phi i8 addrspace(4)* [ %2083, %2044 ], [ %2038, %2042 ], [ %2038, %2084 ]
  %2099 = phi i32 [ %2082, %2044 ], [ 0, %2042 ], [ 0, %2084 ]
  %2100 = phi i64 [ %2081, %2044 ], [ 0, %2042 ], [ %2094, %2084 ]
  %2101 = icmp ugt i32 %2099, 7
  br i1 %2101, label %2104, label %2102

2102:                                             ; preds = %2097
  %2103 = icmp eq i32 %2099, 0
  br i1 %2103, label %2157, label %2144

2104:                                             ; preds = %2097
  %2105 = load i8, i8 addrspace(4)* %2098, align 1, !tbaa !8
  %2106 = zext i8 %2105 to i64
  %2107 = getelementptr inbounds i8, i8 addrspace(4)* %2098, i64 1
  %2108 = load i8, i8 addrspace(4)* %2107, align 1, !tbaa !8
  %2109 = zext i8 %2108 to i64
  %2110 = shl nuw nsw i64 %2109, 8
  %2111 = or i64 %2110, %2106
  %2112 = getelementptr inbounds i8, i8 addrspace(4)* %2098, i64 2
  %2113 = load i8, i8 addrspace(4)* %2112, align 1, !tbaa !8
  %2114 = zext i8 %2113 to i64
  %2115 = shl nuw nsw i64 %2114, 16
  %2116 = or i64 %2111, %2115
  %2117 = getelementptr inbounds i8, i8 addrspace(4)* %2098, i64 3
  %2118 = load i8, i8 addrspace(4)* %2117, align 1, !tbaa !8
  %2119 = zext i8 %2118 to i64
  %2120 = shl nuw nsw i64 %2119, 24
  %2121 = or i64 %2116, %2120
  %2122 = getelementptr inbounds i8, i8 addrspace(4)* %2098, i64 4
  %2123 = load i8, i8 addrspace(4)* %2122, align 1, !tbaa !8
  %2124 = zext i8 %2123 to i64
  %2125 = shl nuw nsw i64 %2124, 32
  %2126 = or i64 %2121, %2125
  %2127 = getelementptr inbounds i8, i8 addrspace(4)* %2098, i64 5
  %2128 = load i8, i8 addrspace(4)* %2127, align 1, !tbaa !8
  %2129 = zext i8 %2128 to i64
  %2130 = shl nuw nsw i64 %2129, 40
  %2131 = or i64 %2126, %2130
  %2132 = getelementptr inbounds i8, i8 addrspace(4)* %2098, i64 6
  %2133 = load i8, i8 addrspace(4)* %2132, align 1, !tbaa !8
  %2134 = zext i8 %2133 to i64
  %2135 = shl nuw nsw i64 %2134, 48
  %2136 = or i64 %2131, %2135
  %2137 = getelementptr inbounds i8, i8 addrspace(4)* %2098, i64 7
  %2138 = load i8, i8 addrspace(4)* %2137, align 1, !tbaa !8
  %2139 = zext i8 %2138 to i64
  %2140 = shl nuw i64 %2139, 56
  %2141 = or i64 %2136, %2140
  %2142 = add nsw i32 %2099, -8
  %2143 = getelementptr inbounds i8, i8 addrspace(4)* %2098, i64 8
  br label %2157

2144:                                             ; preds = %2102, %2144
  %2145 = phi i32 [ %2155, %2144 ], [ 0, %2102 ]
  %2146 = phi i64 [ %2154, %2144 ], [ 0, %2102 ]
  %2147 = zext i32 %2145 to i64
  %2148 = getelementptr inbounds i8, i8 addrspace(4)* %2098, i64 %2147
  %2149 = load i8, i8 addrspace(4)* %2148, align 1, !tbaa !8
  %2150 = zext i8 %2149 to i64
  %2151 = shl i32 %2145, 3
  %2152 = zext i32 %2151 to i64
  %2153 = shl nuw i64 %2150, %2152
  %2154 = or i64 %2153, %2146
  %2155 = add nuw nsw i32 %2145, 1
  %2156 = icmp eq i32 %2155, %2099
  br i1 %2156, label %2157, label %2144

2157:                                             ; preds = %2144, %2104, %2102
  %2158 = phi i8 addrspace(4)* [ %2143, %2104 ], [ %2098, %2102 ], [ %2098, %2144 ]
  %2159 = phi i32 [ %2142, %2104 ], [ 0, %2102 ], [ 0, %2144 ]
  %2160 = phi i64 [ %2141, %2104 ], [ 0, %2102 ], [ %2154, %2144 ]
  %2161 = icmp ugt i32 %2159, 7
  br i1 %2161, label %2164, label %2162

2162:                                             ; preds = %2157
  %2163 = icmp eq i32 %2159, 0
  br i1 %2163, label %2217, label %2204

2164:                                             ; preds = %2157
  %2165 = load i8, i8 addrspace(4)* %2158, align 1, !tbaa !8
  %2166 = zext i8 %2165 to i64
  %2167 = getelementptr inbounds i8, i8 addrspace(4)* %2158, i64 1
  %2168 = load i8, i8 addrspace(4)* %2167, align 1, !tbaa !8
  %2169 = zext i8 %2168 to i64
  %2170 = shl nuw nsw i64 %2169, 8
  %2171 = or i64 %2170, %2166
  %2172 = getelementptr inbounds i8, i8 addrspace(4)* %2158, i64 2
  %2173 = load i8, i8 addrspace(4)* %2172, align 1, !tbaa !8
  %2174 = zext i8 %2173 to i64
  %2175 = shl nuw nsw i64 %2174, 16
  %2176 = or i64 %2171, %2175
  %2177 = getelementptr inbounds i8, i8 addrspace(4)* %2158, i64 3
  %2178 = load i8, i8 addrspace(4)* %2177, align 1, !tbaa !8
  %2179 = zext i8 %2178 to i64
  %2180 = shl nuw nsw i64 %2179, 24
  %2181 = or i64 %2176, %2180
  %2182 = getelementptr inbounds i8, i8 addrspace(4)* %2158, i64 4
  %2183 = load i8, i8 addrspace(4)* %2182, align 1, !tbaa !8
  %2184 = zext i8 %2183 to i64
  %2185 = shl nuw nsw i64 %2184, 32
  %2186 = or i64 %2181, %2185
  %2187 = getelementptr inbounds i8, i8 addrspace(4)* %2158, i64 5
  %2188 = load i8, i8 addrspace(4)* %2187, align 1, !tbaa !8
  %2189 = zext i8 %2188 to i64
  %2190 = shl nuw nsw i64 %2189, 40
  %2191 = or i64 %2186, %2190
  %2192 = getelementptr inbounds i8, i8 addrspace(4)* %2158, i64 6
  %2193 = load i8, i8 addrspace(4)* %2192, align 1, !tbaa !8
  %2194 = zext i8 %2193 to i64
  %2195 = shl nuw nsw i64 %2194, 48
  %2196 = or i64 %2191, %2195
  %2197 = getelementptr inbounds i8, i8 addrspace(4)* %2158, i64 7
  %2198 = load i8, i8 addrspace(4)* %2197, align 1, !tbaa !8
  %2199 = zext i8 %2198 to i64
  %2200 = shl nuw i64 %2199, 56
  %2201 = or i64 %2196, %2200
  %2202 = add nsw i32 %2159, -8
  %2203 = getelementptr inbounds i8, i8 addrspace(4)* %2158, i64 8
  br label %2217

2204:                                             ; preds = %2162, %2204
  %2205 = phi i32 [ %2215, %2204 ], [ 0, %2162 ]
  %2206 = phi i64 [ %2214, %2204 ], [ 0, %2162 ]
  %2207 = zext i32 %2205 to i64
  %2208 = getelementptr inbounds i8, i8 addrspace(4)* %2158, i64 %2207
  %2209 = load i8, i8 addrspace(4)* %2208, align 1, !tbaa !8
  %2210 = zext i8 %2209 to i64
  %2211 = shl i32 %2205, 3
  %2212 = zext i32 %2211 to i64
  %2213 = shl nuw i64 %2210, %2212
  %2214 = or i64 %2213, %2206
  %2215 = add nuw nsw i32 %2205, 1
  %2216 = icmp eq i32 %2215, %2159
  br i1 %2216, label %2217, label %2204

2217:                                             ; preds = %2204, %2164, %2162
  %2218 = phi i8 addrspace(4)* [ %2203, %2164 ], [ %2158, %2162 ], [ %2158, %2204 ]
  %2219 = phi i32 [ %2202, %2164 ], [ 0, %2162 ], [ 0, %2204 ]
  %2220 = phi i64 [ %2201, %2164 ], [ 0, %2162 ], [ %2214, %2204 ]
  %2221 = icmp ugt i32 %2219, 7
  br i1 %2221, label %2224, label %2222

2222:                                             ; preds = %2217
  %2223 = icmp eq i32 %2219, 0
  br i1 %2223, label %2275, label %2262

2224:                                             ; preds = %2217
  %2225 = load i8, i8 addrspace(4)* %2218, align 1, !tbaa !8
  %2226 = zext i8 %2225 to i64
  %2227 = getelementptr inbounds i8, i8 addrspace(4)* %2218, i64 1
  %2228 = load i8, i8 addrspace(4)* %2227, align 1, !tbaa !8
  %2229 = zext i8 %2228 to i64
  %2230 = shl nuw nsw i64 %2229, 8
  %2231 = or i64 %2230, %2226
  %2232 = getelementptr inbounds i8, i8 addrspace(4)* %2218, i64 2
  %2233 = load i8, i8 addrspace(4)* %2232, align 1, !tbaa !8
  %2234 = zext i8 %2233 to i64
  %2235 = shl nuw nsw i64 %2234, 16
  %2236 = or i64 %2231, %2235
  %2237 = getelementptr inbounds i8, i8 addrspace(4)* %2218, i64 3
  %2238 = load i8, i8 addrspace(4)* %2237, align 1, !tbaa !8
  %2239 = zext i8 %2238 to i64
  %2240 = shl nuw nsw i64 %2239, 24
  %2241 = or i64 %2236, %2240
  %2242 = getelementptr inbounds i8, i8 addrspace(4)* %2218, i64 4
  %2243 = load i8, i8 addrspace(4)* %2242, align 1, !tbaa !8
  %2244 = zext i8 %2243 to i64
  %2245 = shl nuw nsw i64 %2244, 32
  %2246 = or i64 %2241, %2245
  %2247 = getelementptr inbounds i8, i8 addrspace(4)* %2218, i64 5
  %2248 = load i8, i8 addrspace(4)* %2247, align 1, !tbaa !8
  %2249 = zext i8 %2248 to i64
  %2250 = shl nuw nsw i64 %2249, 40
  %2251 = or i64 %2246, %2250
  %2252 = getelementptr inbounds i8, i8 addrspace(4)* %2218, i64 6
  %2253 = load i8, i8 addrspace(4)* %2252, align 1, !tbaa !8
  %2254 = zext i8 %2253 to i64
  %2255 = shl nuw nsw i64 %2254, 48
  %2256 = or i64 %2251, %2255
  %2257 = getelementptr inbounds i8, i8 addrspace(4)* %2218, i64 7
  %2258 = load i8, i8 addrspace(4)* %2257, align 1, !tbaa !8
  %2259 = zext i8 %2258 to i64
  %2260 = shl nuw i64 %2259, 56
  %2261 = or i64 %2256, %2260
  br label %2275

2262:                                             ; preds = %2222, %2262
  %2263 = phi i32 [ %2273, %2262 ], [ 0, %2222 ]
  %2264 = phi i64 [ %2272, %2262 ], [ 0, %2222 ]
  %2265 = zext i32 %2263 to i64
  %2266 = getelementptr inbounds i8, i8 addrspace(4)* %2218, i64 %2265
  %2267 = load i8, i8 addrspace(4)* %2266, align 1, !tbaa !8
  %2268 = zext i8 %2267 to i64
  %2269 = shl i32 %2263, 3
  %2270 = zext i32 %2269 to i64
  %2271 = shl nuw i64 %2268, %2270
  %2272 = or i64 %2271, %2264
  %2273 = add nuw nsw i32 %2263, 1
  %2274 = icmp eq i32 %2273, %2219
  br i1 %2274, label %2275, label %2262

2275:                                             ; preds = %2262, %2224, %2222
  %2276 = phi i64 [ %2261, %2224 ], [ 0, %2222 ], [ %2272, %2262 ]
  %2277 = shl nuw nsw i64 %1858, 2
  %2278 = add nuw nsw i64 %2277, 28
  %2279 = and i64 %2278, 480
  %2280 = and i64 %1860, -225
  %2281 = or i64 %2280, %2279
  %2282 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %2281, i64 noundef %1920, i64 noundef %1980, i64 noundef %2040, i64 noundef %2100, i64 noundef %2160, i64 noundef %2220, i64 noundef %2276) #10
  %2283 = sub i64 %1850, %1858
  %2284 = getelementptr inbounds i8, i8 addrspace(4)* %1851, i64 %1858
  %2285 = icmp eq i64 %2283, 0
  br i1 %2285, label %2286, label %1849

2286:                                             ; preds = %2275, %1841
  %2287 = phi <2 x i64> [ %1844, %1841 ], [ %2282, %2275 ]
  %2288 = extractelement <2 x i64> %2287, i64 0
  %2289 = and i64 %2288, -227
  %2290 = or i64 %2289, 34
  %2291 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %2290, i64 noundef %1838, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %2292 = getelementptr inbounds double, double addrspace(1)* %4, i64 50
  %2293 = bitcast double addrspace(1)* %2292 to i64 addrspace(1)*
  %2294 = load i64, i64 addrspace(1)* %2293, align 8, !tbaa !11
  %2295 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %2296 = extractelement <2 x i64> %2295, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.5, i64 0, i64 0) to i8*), i8* null), label %2297, label %2301

2297:                                             ; preds = %2286
  %2298 = and i64 %2296, -225
  %2299 = or i64 %2298, 32
  %2300 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %2299, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %2742

2301:                                             ; preds = %2286
  %2302 = and i64 %2296, 2
  %2303 = and i64 %2296, -3
  %2304 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %2303, i64 0
  br label %2305

2305:                                             ; preds = %2731, %2301
  %2306 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.5, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.5, i64 0, i64 16) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([17 x i8]* addrspacecast ([17 x i8] addrspace(4)* @.str.5 to [17 x i8]*) to i64)), i64 1))), %2301 ], [ %2739, %2731 ]
  %2307 = phi i8 addrspace(4)* [ getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.5, i64 0, i64 0), %2301 ], [ %2740, %2731 ]
  %2308 = phi <2 x i64> [ %2304, %2301 ], [ %2738, %2731 ]
  %2309 = icmp ugt i64 %2306, 56
  %2310 = extractelement <2 x i64> %2308, i64 0
  %2311 = or i64 %2310, %2302
  %2312 = insertelement <2 x i64> poison, i64 %2311, i64 0
  %2313 = select i1 %2309, <2 x i64> %2308, <2 x i64> %2312
  %2314 = tail call i64 @llvm.umin.i64(i64 %2306, i64 56)
  %2315 = trunc i64 %2314 to i32
  %2316 = extractelement <2 x i64> %2313, i64 0
  %2317 = icmp ugt i32 %2315, 7
  br i1 %2317, label %2320, label %2318

2318:                                             ; preds = %2305
  %2319 = icmp eq i32 %2315, 0
  br i1 %2319, label %2373, label %2360

2320:                                             ; preds = %2305
  %2321 = load i8, i8 addrspace(4)* %2307, align 1, !tbaa !8
  %2322 = zext i8 %2321 to i64
  %2323 = getelementptr inbounds i8, i8 addrspace(4)* %2307, i64 1
  %2324 = load i8, i8 addrspace(4)* %2323, align 1, !tbaa !8
  %2325 = zext i8 %2324 to i64
  %2326 = shl nuw nsw i64 %2325, 8
  %2327 = or i64 %2326, %2322
  %2328 = getelementptr inbounds i8, i8 addrspace(4)* %2307, i64 2
  %2329 = load i8, i8 addrspace(4)* %2328, align 1, !tbaa !8
  %2330 = zext i8 %2329 to i64
  %2331 = shl nuw nsw i64 %2330, 16
  %2332 = or i64 %2327, %2331
  %2333 = getelementptr inbounds i8, i8 addrspace(4)* %2307, i64 3
  %2334 = load i8, i8 addrspace(4)* %2333, align 1, !tbaa !8
  %2335 = zext i8 %2334 to i64
  %2336 = shl nuw nsw i64 %2335, 24
  %2337 = or i64 %2332, %2336
  %2338 = getelementptr inbounds i8, i8 addrspace(4)* %2307, i64 4
  %2339 = load i8, i8 addrspace(4)* %2338, align 1, !tbaa !8
  %2340 = zext i8 %2339 to i64
  %2341 = shl nuw nsw i64 %2340, 32
  %2342 = or i64 %2337, %2341
  %2343 = getelementptr inbounds i8, i8 addrspace(4)* %2307, i64 5
  %2344 = load i8, i8 addrspace(4)* %2343, align 1, !tbaa !8
  %2345 = zext i8 %2344 to i64
  %2346 = shl nuw nsw i64 %2345, 40
  %2347 = or i64 %2342, %2346
  %2348 = getelementptr inbounds i8, i8 addrspace(4)* %2307, i64 6
  %2349 = load i8, i8 addrspace(4)* %2348, align 1, !tbaa !8
  %2350 = zext i8 %2349 to i64
  %2351 = shl nuw nsw i64 %2350, 48
  %2352 = or i64 %2347, %2351
  %2353 = getelementptr inbounds i8, i8 addrspace(4)* %2307, i64 7
  %2354 = load i8, i8 addrspace(4)* %2353, align 1, !tbaa !8
  %2355 = zext i8 %2354 to i64
  %2356 = shl nuw i64 %2355, 56
  %2357 = or i64 %2352, %2356
  %2358 = add nsw i32 %2315, -8
  %2359 = getelementptr inbounds i8, i8 addrspace(4)* %2307, i64 8
  br label %2373

2360:                                             ; preds = %2318, %2360
  %2361 = phi i32 [ %2371, %2360 ], [ 0, %2318 ]
  %2362 = phi i64 [ %2370, %2360 ], [ 0, %2318 ]
  %2363 = zext i32 %2361 to i64
  %2364 = getelementptr inbounds i8, i8 addrspace(4)* %2307, i64 %2363
  %2365 = load i8, i8 addrspace(4)* %2364, align 1, !tbaa !8
  %2366 = zext i8 %2365 to i64
  %2367 = shl i32 %2361, 3
  %2368 = zext i32 %2367 to i64
  %2369 = shl nuw i64 %2366, %2368
  %2370 = or i64 %2369, %2362
  %2371 = add nuw nsw i32 %2361, 1
  %2372 = icmp eq i32 %2371, %2315
  br i1 %2372, label %2373, label %2360, !llvm.loop !9

2373:                                             ; preds = %2360, %2320, %2318
  %2374 = phi i8 addrspace(4)* [ %2359, %2320 ], [ %2307, %2318 ], [ %2307, %2360 ]
  %2375 = phi i32 [ %2358, %2320 ], [ 0, %2318 ], [ 0, %2360 ]
  %2376 = phi i64 [ %2357, %2320 ], [ 0, %2318 ], [ %2370, %2360 ]
  %2377 = icmp ugt i32 %2375, 7
  br i1 %2377, label %2380, label %2378

2378:                                             ; preds = %2373
  %2379 = icmp eq i32 %2375, 0
  br i1 %2379, label %2433, label %2420

2380:                                             ; preds = %2373
  %2381 = load i8, i8 addrspace(4)* %2374, align 1, !tbaa !8
  %2382 = zext i8 %2381 to i64
  %2383 = getelementptr inbounds i8, i8 addrspace(4)* %2374, i64 1
  %2384 = load i8, i8 addrspace(4)* %2383, align 1, !tbaa !8
  %2385 = zext i8 %2384 to i64
  %2386 = shl nuw nsw i64 %2385, 8
  %2387 = or i64 %2386, %2382
  %2388 = getelementptr inbounds i8, i8 addrspace(4)* %2374, i64 2
  %2389 = load i8, i8 addrspace(4)* %2388, align 1, !tbaa !8
  %2390 = zext i8 %2389 to i64
  %2391 = shl nuw nsw i64 %2390, 16
  %2392 = or i64 %2387, %2391
  %2393 = getelementptr inbounds i8, i8 addrspace(4)* %2374, i64 3
  %2394 = load i8, i8 addrspace(4)* %2393, align 1, !tbaa !8
  %2395 = zext i8 %2394 to i64
  %2396 = shl nuw nsw i64 %2395, 24
  %2397 = or i64 %2392, %2396
  %2398 = getelementptr inbounds i8, i8 addrspace(4)* %2374, i64 4
  %2399 = load i8, i8 addrspace(4)* %2398, align 1, !tbaa !8
  %2400 = zext i8 %2399 to i64
  %2401 = shl nuw nsw i64 %2400, 32
  %2402 = or i64 %2397, %2401
  %2403 = getelementptr inbounds i8, i8 addrspace(4)* %2374, i64 5
  %2404 = load i8, i8 addrspace(4)* %2403, align 1, !tbaa !8
  %2405 = zext i8 %2404 to i64
  %2406 = shl nuw nsw i64 %2405, 40
  %2407 = or i64 %2402, %2406
  %2408 = getelementptr inbounds i8, i8 addrspace(4)* %2374, i64 6
  %2409 = load i8, i8 addrspace(4)* %2408, align 1, !tbaa !8
  %2410 = zext i8 %2409 to i64
  %2411 = shl nuw nsw i64 %2410, 48
  %2412 = or i64 %2407, %2411
  %2413 = getelementptr inbounds i8, i8 addrspace(4)* %2374, i64 7
  %2414 = load i8, i8 addrspace(4)* %2413, align 1, !tbaa !8
  %2415 = zext i8 %2414 to i64
  %2416 = shl nuw i64 %2415, 56
  %2417 = or i64 %2412, %2416
  %2418 = add nsw i32 %2375, -8
  %2419 = getelementptr inbounds i8, i8 addrspace(4)* %2374, i64 8
  br label %2433

2420:                                             ; preds = %2378, %2420
  %2421 = phi i32 [ %2431, %2420 ], [ 0, %2378 ]
  %2422 = phi i64 [ %2430, %2420 ], [ 0, %2378 ]
  %2423 = zext i32 %2421 to i64
  %2424 = getelementptr inbounds i8, i8 addrspace(4)* %2374, i64 %2423
  %2425 = load i8, i8 addrspace(4)* %2424, align 1, !tbaa !8
  %2426 = zext i8 %2425 to i64
  %2427 = shl i32 %2421, 3
  %2428 = zext i32 %2427 to i64
  %2429 = shl nuw i64 %2426, %2428
  %2430 = or i64 %2429, %2422
  %2431 = add nuw nsw i32 %2421, 1
  %2432 = icmp eq i32 %2431, %2375
  br i1 %2432, label %2433, label %2420

2433:                                             ; preds = %2420, %2380, %2378
  %2434 = phi i8 addrspace(4)* [ %2419, %2380 ], [ %2374, %2378 ], [ %2374, %2420 ]
  %2435 = phi i32 [ %2418, %2380 ], [ 0, %2378 ], [ 0, %2420 ]
  %2436 = phi i64 [ %2417, %2380 ], [ 0, %2378 ], [ %2430, %2420 ]
  %2437 = icmp ugt i32 %2435, 7
  br i1 %2437, label %2440, label %2438

2438:                                             ; preds = %2433
  %2439 = icmp eq i32 %2435, 0
  br i1 %2439, label %2493, label %2480

2440:                                             ; preds = %2433
  %2441 = load i8, i8 addrspace(4)* %2434, align 1, !tbaa !8
  %2442 = zext i8 %2441 to i64
  %2443 = getelementptr inbounds i8, i8 addrspace(4)* %2434, i64 1
  %2444 = load i8, i8 addrspace(4)* %2443, align 1, !tbaa !8
  %2445 = zext i8 %2444 to i64
  %2446 = shl nuw nsw i64 %2445, 8
  %2447 = or i64 %2446, %2442
  %2448 = getelementptr inbounds i8, i8 addrspace(4)* %2434, i64 2
  %2449 = load i8, i8 addrspace(4)* %2448, align 1, !tbaa !8
  %2450 = zext i8 %2449 to i64
  %2451 = shl nuw nsw i64 %2450, 16
  %2452 = or i64 %2447, %2451
  %2453 = getelementptr inbounds i8, i8 addrspace(4)* %2434, i64 3
  %2454 = load i8, i8 addrspace(4)* %2453, align 1, !tbaa !8
  %2455 = zext i8 %2454 to i64
  %2456 = shl nuw nsw i64 %2455, 24
  %2457 = or i64 %2452, %2456
  %2458 = getelementptr inbounds i8, i8 addrspace(4)* %2434, i64 4
  %2459 = load i8, i8 addrspace(4)* %2458, align 1, !tbaa !8
  %2460 = zext i8 %2459 to i64
  %2461 = shl nuw nsw i64 %2460, 32
  %2462 = or i64 %2457, %2461
  %2463 = getelementptr inbounds i8, i8 addrspace(4)* %2434, i64 5
  %2464 = load i8, i8 addrspace(4)* %2463, align 1, !tbaa !8
  %2465 = zext i8 %2464 to i64
  %2466 = shl nuw nsw i64 %2465, 40
  %2467 = or i64 %2462, %2466
  %2468 = getelementptr inbounds i8, i8 addrspace(4)* %2434, i64 6
  %2469 = load i8, i8 addrspace(4)* %2468, align 1, !tbaa !8
  %2470 = zext i8 %2469 to i64
  %2471 = shl nuw nsw i64 %2470, 48
  %2472 = or i64 %2467, %2471
  %2473 = getelementptr inbounds i8, i8 addrspace(4)* %2434, i64 7
  %2474 = load i8, i8 addrspace(4)* %2473, align 1, !tbaa !8
  %2475 = zext i8 %2474 to i64
  %2476 = shl nuw i64 %2475, 56
  %2477 = or i64 %2472, %2476
  %2478 = add nsw i32 %2435, -8
  %2479 = getelementptr inbounds i8, i8 addrspace(4)* %2434, i64 8
  br label %2493

2480:                                             ; preds = %2438, %2480
  %2481 = phi i32 [ %2491, %2480 ], [ 0, %2438 ]
  %2482 = phi i64 [ %2490, %2480 ], [ 0, %2438 ]
  %2483 = zext i32 %2481 to i64
  %2484 = getelementptr inbounds i8, i8 addrspace(4)* %2434, i64 %2483
  %2485 = load i8, i8 addrspace(4)* %2484, align 1, !tbaa !8
  %2486 = zext i8 %2485 to i64
  %2487 = shl i32 %2481, 3
  %2488 = zext i32 %2487 to i64
  %2489 = shl nuw i64 %2486, %2488
  %2490 = or i64 %2489, %2482
  %2491 = add nuw nsw i32 %2481, 1
  %2492 = icmp eq i32 %2491, %2435
  br i1 %2492, label %2493, label %2480

2493:                                             ; preds = %2480, %2440, %2438
  %2494 = phi i8 addrspace(4)* [ %2479, %2440 ], [ %2434, %2438 ], [ %2434, %2480 ]
  %2495 = phi i32 [ %2478, %2440 ], [ 0, %2438 ], [ 0, %2480 ]
  %2496 = phi i64 [ %2477, %2440 ], [ 0, %2438 ], [ %2490, %2480 ]
  %2497 = icmp ugt i32 %2495, 7
  br i1 %2497, label %2500, label %2498

2498:                                             ; preds = %2493
  %2499 = icmp eq i32 %2495, 0
  br i1 %2499, label %2553, label %2540

2500:                                             ; preds = %2493
  %2501 = load i8, i8 addrspace(4)* %2494, align 1, !tbaa !8
  %2502 = zext i8 %2501 to i64
  %2503 = getelementptr inbounds i8, i8 addrspace(4)* %2494, i64 1
  %2504 = load i8, i8 addrspace(4)* %2503, align 1, !tbaa !8
  %2505 = zext i8 %2504 to i64
  %2506 = shl nuw nsw i64 %2505, 8
  %2507 = or i64 %2506, %2502
  %2508 = getelementptr inbounds i8, i8 addrspace(4)* %2494, i64 2
  %2509 = load i8, i8 addrspace(4)* %2508, align 1, !tbaa !8
  %2510 = zext i8 %2509 to i64
  %2511 = shl nuw nsw i64 %2510, 16
  %2512 = or i64 %2507, %2511
  %2513 = getelementptr inbounds i8, i8 addrspace(4)* %2494, i64 3
  %2514 = load i8, i8 addrspace(4)* %2513, align 1, !tbaa !8
  %2515 = zext i8 %2514 to i64
  %2516 = shl nuw nsw i64 %2515, 24
  %2517 = or i64 %2512, %2516
  %2518 = getelementptr inbounds i8, i8 addrspace(4)* %2494, i64 4
  %2519 = load i8, i8 addrspace(4)* %2518, align 1, !tbaa !8
  %2520 = zext i8 %2519 to i64
  %2521 = shl nuw nsw i64 %2520, 32
  %2522 = or i64 %2517, %2521
  %2523 = getelementptr inbounds i8, i8 addrspace(4)* %2494, i64 5
  %2524 = load i8, i8 addrspace(4)* %2523, align 1, !tbaa !8
  %2525 = zext i8 %2524 to i64
  %2526 = shl nuw nsw i64 %2525, 40
  %2527 = or i64 %2522, %2526
  %2528 = getelementptr inbounds i8, i8 addrspace(4)* %2494, i64 6
  %2529 = load i8, i8 addrspace(4)* %2528, align 1, !tbaa !8
  %2530 = zext i8 %2529 to i64
  %2531 = shl nuw nsw i64 %2530, 48
  %2532 = or i64 %2527, %2531
  %2533 = getelementptr inbounds i8, i8 addrspace(4)* %2494, i64 7
  %2534 = load i8, i8 addrspace(4)* %2533, align 1, !tbaa !8
  %2535 = zext i8 %2534 to i64
  %2536 = shl nuw i64 %2535, 56
  %2537 = or i64 %2532, %2536
  %2538 = add nsw i32 %2495, -8
  %2539 = getelementptr inbounds i8, i8 addrspace(4)* %2494, i64 8
  br label %2553

2540:                                             ; preds = %2498, %2540
  %2541 = phi i32 [ %2551, %2540 ], [ 0, %2498 ]
  %2542 = phi i64 [ %2550, %2540 ], [ 0, %2498 ]
  %2543 = zext i32 %2541 to i64
  %2544 = getelementptr inbounds i8, i8 addrspace(4)* %2494, i64 %2543
  %2545 = load i8, i8 addrspace(4)* %2544, align 1, !tbaa !8
  %2546 = zext i8 %2545 to i64
  %2547 = shl i32 %2541, 3
  %2548 = zext i32 %2547 to i64
  %2549 = shl nuw i64 %2546, %2548
  %2550 = or i64 %2549, %2542
  %2551 = add nuw nsw i32 %2541, 1
  %2552 = icmp eq i32 %2551, %2495
  br i1 %2552, label %2553, label %2540

2553:                                             ; preds = %2540, %2500, %2498
  %2554 = phi i8 addrspace(4)* [ %2539, %2500 ], [ %2494, %2498 ], [ %2494, %2540 ]
  %2555 = phi i32 [ %2538, %2500 ], [ 0, %2498 ], [ 0, %2540 ]
  %2556 = phi i64 [ %2537, %2500 ], [ 0, %2498 ], [ %2550, %2540 ]
  %2557 = icmp ugt i32 %2555, 7
  br i1 %2557, label %2560, label %2558

2558:                                             ; preds = %2553
  %2559 = icmp eq i32 %2555, 0
  br i1 %2559, label %2613, label %2600

2560:                                             ; preds = %2553
  %2561 = load i8, i8 addrspace(4)* %2554, align 1, !tbaa !8
  %2562 = zext i8 %2561 to i64
  %2563 = getelementptr inbounds i8, i8 addrspace(4)* %2554, i64 1
  %2564 = load i8, i8 addrspace(4)* %2563, align 1, !tbaa !8
  %2565 = zext i8 %2564 to i64
  %2566 = shl nuw nsw i64 %2565, 8
  %2567 = or i64 %2566, %2562
  %2568 = getelementptr inbounds i8, i8 addrspace(4)* %2554, i64 2
  %2569 = load i8, i8 addrspace(4)* %2568, align 1, !tbaa !8
  %2570 = zext i8 %2569 to i64
  %2571 = shl nuw nsw i64 %2570, 16
  %2572 = or i64 %2567, %2571
  %2573 = getelementptr inbounds i8, i8 addrspace(4)* %2554, i64 3
  %2574 = load i8, i8 addrspace(4)* %2573, align 1, !tbaa !8
  %2575 = zext i8 %2574 to i64
  %2576 = shl nuw nsw i64 %2575, 24
  %2577 = or i64 %2572, %2576
  %2578 = getelementptr inbounds i8, i8 addrspace(4)* %2554, i64 4
  %2579 = load i8, i8 addrspace(4)* %2578, align 1, !tbaa !8
  %2580 = zext i8 %2579 to i64
  %2581 = shl nuw nsw i64 %2580, 32
  %2582 = or i64 %2577, %2581
  %2583 = getelementptr inbounds i8, i8 addrspace(4)* %2554, i64 5
  %2584 = load i8, i8 addrspace(4)* %2583, align 1, !tbaa !8
  %2585 = zext i8 %2584 to i64
  %2586 = shl nuw nsw i64 %2585, 40
  %2587 = or i64 %2582, %2586
  %2588 = getelementptr inbounds i8, i8 addrspace(4)* %2554, i64 6
  %2589 = load i8, i8 addrspace(4)* %2588, align 1, !tbaa !8
  %2590 = zext i8 %2589 to i64
  %2591 = shl nuw nsw i64 %2590, 48
  %2592 = or i64 %2587, %2591
  %2593 = getelementptr inbounds i8, i8 addrspace(4)* %2554, i64 7
  %2594 = load i8, i8 addrspace(4)* %2593, align 1, !tbaa !8
  %2595 = zext i8 %2594 to i64
  %2596 = shl nuw i64 %2595, 56
  %2597 = or i64 %2592, %2596
  %2598 = add nsw i32 %2555, -8
  %2599 = getelementptr inbounds i8, i8 addrspace(4)* %2554, i64 8
  br label %2613

2600:                                             ; preds = %2558, %2600
  %2601 = phi i32 [ %2611, %2600 ], [ 0, %2558 ]
  %2602 = phi i64 [ %2610, %2600 ], [ 0, %2558 ]
  %2603 = zext i32 %2601 to i64
  %2604 = getelementptr inbounds i8, i8 addrspace(4)* %2554, i64 %2603
  %2605 = load i8, i8 addrspace(4)* %2604, align 1, !tbaa !8
  %2606 = zext i8 %2605 to i64
  %2607 = shl i32 %2601, 3
  %2608 = zext i32 %2607 to i64
  %2609 = shl nuw i64 %2606, %2608
  %2610 = or i64 %2609, %2602
  %2611 = add nuw nsw i32 %2601, 1
  %2612 = icmp eq i32 %2611, %2555
  br i1 %2612, label %2613, label %2600

2613:                                             ; preds = %2600, %2560, %2558
  %2614 = phi i8 addrspace(4)* [ %2599, %2560 ], [ %2554, %2558 ], [ %2554, %2600 ]
  %2615 = phi i32 [ %2598, %2560 ], [ 0, %2558 ], [ 0, %2600 ]
  %2616 = phi i64 [ %2597, %2560 ], [ 0, %2558 ], [ %2610, %2600 ]
  %2617 = icmp ugt i32 %2615, 7
  br i1 %2617, label %2620, label %2618

2618:                                             ; preds = %2613
  %2619 = icmp eq i32 %2615, 0
  br i1 %2619, label %2673, label %2660

2620:                                             ; preds = %2613
  %2621 = load i8, i8 addrspace(4)* %2614, align 1, !tbaa !8
  %2622 = zext i8 %2621 to i64
  %2623 = getelementptr inbounds i8, i8 addrspace(4)* %2614, i64 1
  %2624 = load i8, i8 addrspace(4)* %2623, align 1, !tbaa !8
  %2625 = zext i8 %2624 to i64
  %2626 = shl nuw nsw i64 %2625, 8
  %2627 = or i64 %2626, %2622
  %2628 = getelementptr inbounds i8, i8 addrspace(4)* %2614, i64 2
  %2629 = load i8, i8 addrspace(4)* %2628, align 1, !tbaa !8
  %2630 = zext i8 %2629 to i64
  %2631 = shl nuw nsw i64 %2630, 16
  %2632 = or i64 %2627, %2631
  %2633 = getelementptr inbounds i8, i8 addrspace(4)* %2614, i64 3
  %2634 = load i8, i8 addrspace(4)* %2633, align 1, !tbaa !8
  %2635 = zext i8 %2634 to i64
  %2636 = shl nuw nsw i64 %2635, 24
  %2637 = or i64 %2632, %2636
  %2638 = getelementptr inbounds i8, i8 addrspace(4)* %2614, i64 4
  %2639 = load i8, i8 addrspace(4)* %2638, align 1, !tbaa !8
  %2640 = zext i8 %2639 to i64
  %2641 = shl nuw nsw i64 %2640, 32
  %2642 = or i64 %2637, %2641
  %2643 = getelementptr inbounds i8, i8 addrspace(4)* %2614, i64 5
  %2644 = load i8, i8 addrspace(4)* %2643, align 1, !tbaa !8
  %2645 = zext i8 %2644 to i64
  %2646 = shl nuw nsw i64 %2645, 40
  %2647 = or i64 %2642, %2646
  %2648 = getelementptr inbounds i8, i8 addrspace(4)* %2614, i64 6
  %2649 = load i8, i8 addrspace(4)* %2648, align 1, !tbaa !8
  %2650 = zext i8 %2649 to i64
  %2651 = shl nuw nsw i64 %2650, 48
  %2652 = or i64 %2647, %2651
  %2653 = getelementptr inbounds i8, i8 addrspace(4)* %2614, i64 7
  %2654 = load i8, i8 addrspace(4)* %2653, align 1, !tbaa !8
  %2655 = zext i8 %2654 to i64
  %2656 = shl nuw i64 %2655, 56
  %2657 = or i64 %2652, %2656
  %2658 = add nsw i32 %2615, -8
  %2659 = getelementptr inbounds i8, i8 addrspace(4)* %2614, i64 8
  br label %2673

2660:                                             ; preds = %2618, %2660
  %2661 = phi i32 [ %2671, %2660 ], [ 0, %2618 ]
  %2662 = phi i64 [ %2670, %2660 ], [ 0, %2618 ]
  %2663 = zext i32 %2661 to i64
  %2664 = getelementptr inbounds i8, i8 addrspace(4)* %2614, i64 %2663
  %2665 = load i8, i8 addrspace(4)* %2664, align 1, !tbaa !8
  %2666 = zext i8 %2665 to i64
  %2667 = shl i32 %2661, 3
  %2668 = zext i32 %2667 to i64
  %2669 = shl nuw i64 %2666, %2668
  %2670 = or i64 %2669, %2662
  %2671 = add nuw nsw i32 %2661, 1
  %2672 = icmp eq i32 %2671, %2615
  br i1 %2672, label %2673, label %2660

2673:                                             ; preds = %2660, %2620, %2618
  %2674 = phi i8 addrspace(4)* [ %2659, %2620 ], [ %2614, %2618 ], [ %2614, %2660 ]
  %2675 = phi i32 [ %2658, %2620 ], [ 0, %2618 ], [ 0, %2660 ]
  %2676 = phi i64 [ %2657, %2620 ], [ 0, %2618 ], [ %2670, %2660 ]
  %2677 = icmp ugt i32 %2675, 7
  br i1 %2677, label %2680, label %2678

2678:                                             ; preds = %2673
  %2679 = icmp eq i32 %2675, 0
  br i1 %2679, label %2731, label %2718

2680:                                             ; preds = %2673
  %2681 = load i8, i8 addrspace(4)* %2674, align 1, !tbaa !8
  %2682 = zext i8 %2681 to i64
  %2683 = getelementptr inbounds i8, i8 addrspace(4)* %2674, i64 1
  %2684 = load i8, i8 addrspace(4)* %2683, align 1, !tbaa !8
  %2685 = zext i8 %2684 to i64
  %2686 = shl nuw nsw i64 %2685, 8
  %2687 = or i64 %2686, %2682
  %2688 = getelementptr inbounds i8, i8 addrspace(4)* %2674, i64 2
  %2689 = load i8, i8 addrspace(4)* %2688, align 1, !tbaa !8
  %2690 = zext i8 %2689 to i64
  %2691 = shl nuw nsw i64 %2690, 16
  %2692 = or i64 %2687, %2691
  %2693 = getelementptr inbounds i8, i8 addrspace(4)* %2674, i64 3
  %2694 = load i8, i8 addrspace(4)* %2693, align 1, !tbaa !8
  %2695 = zext i8 %2694 to i64
  %2696 = shl nuw nsw i64 %2695, 24
  %2697 = or i64 %2692, %2696
  %2698 = getelementptr inbounds i8, i8 addrspace(4)* %2674, i64 4
  %2699 = load i8, i8 addrspace(4)* %2698, align 1, !tbaa !8
  %2700 = zext i8 %2699 to i64
  %2701 = shl nuw nsw i64 %2700, 32
  %2702 = or i64 %2697, %2701
  %2703 = getelementptr inbounds i8, i8 addrspace(4)* %2674, i64 5
  %2704 = load i8, i8 addrspace(4)* %2703, align 1, !tbaa !8
  %2705 = zext i8 %2704 to i64
  %2706 = shl nuw nsw i64 %2705, 40
  %2707 = or i64 %2702, %2706
  %2708 = getelementptr inbounds i8, i8 addrspace(4)* %2674, i64 6
  %2709 = load i8, i8 addrspace(4)* %2708, align 1, !tbaa !8
  %2710 = zext i8 %2709 to i64
  %2711 = shl nuw nsw i64 %2710, 48
  %2712 = or i64 %2707, %2711
  %2713 = getelementptr inbounds i8, i8 addrspace(4)* %2674, i64 7
  %2714 = load i8, i8 addrspace(4)* %2713, align 1, !tbaa !8
  %2715 = zext i8 %2714 to i64
  %2716 = shl nuw i64 %2715, 56
  %2717 = or i64 %2712, %2716
  br label %2731

2718:                                             ; preds = %2678, %2718
  %2719 = phi i32 [ %2729, %2718 ], [ 0, %2678 ]
  %2720 = phi i64 [ %2728, %2718 ], [ 0, %2678 ]
  %2721 = zext i32 %2719 to i64
  %2722 = getelementptr inbounds i8, i8 addrspace(4)* %2674, i64 %2721
  %2723 = load i8, i8 addrspace(4)* %2722, align 1, !tbaa !8
  %2724 = zext i8 %2723 to i64
  %2725 = shl i32 %2719, 3
  %2726 = zext i32 %2725 to i64
  %2727 = shl nuw i64 %2724, %2726
  %2728 = or i64 %2727, %2720
  %2729 = add nuw nsw i32 %2719, 1
  %2730 = icmp eq i32 %2729, %2675
  br i1 %2730, label %2731, label %2718

2731:                                             ; preds = %2718, %2680, %2678
  %2732 = phi i64 [ %2717, %2680 ], [ 0, %2678 ], [ %2728, %2718 ]
  %2733 = shl nuw nsw i64 %2314, 2
  %2734 = add nuw nsw i64 %2733, 28
  %2735 = and i64 %2734, 480
  %2736 = and i64 %2316, -225
  %2737 = or i64 %2736, %2735
  %2738 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %2737, i64 noundef %2376, i64 noundef %2436, i64 noundef %2496, i64 noundef %2556, i64 noundef %2616, i64 noundef %2676, i64 noundef %2732) #10
  %2739 = sub i64 %2306, %2314
  %2740 = getelementptr inbounds i8, i8 addrspace(4)* %2307, i64 %2314
  %2741 = icmp eq i64 %2739, 0
  br i1 %2741, label %2742, label %2305

2742:                                             ; preds = %2731, %2297
  %2743 = phi <2 x i64> [ %2300, %2297 ], [ %2738, %2731 ]
  %2744 = extractelement <2 x i64> %2743, i64 0
  %2745 = and i64 %2744, -227
  %2746 = or i64 %2745, 34
  %2747 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %2746, i64 noundef %2294, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %2748 = mul nsw i32 %10, 5
  %2749 = mul nsw i32 %2748, %10
  %2750 = add nsw i32 %2749, 50
  %2751 = sext i32 %2750 to i64
  %2752 = getelementptr inbounds double, double addrspace(1)* %5, i64 %2751
  %2753 = bitcast double addrspace(1)* %2752 to i64 addrspace(1)*
  %2754 = load i64, i64 addrspace(1)* %2753, align 8, !tbaa !11
  %2755 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %2756 = extractelement <2 x i64> %2755, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.6, i64 0, i64 0) to i8*), i8* null), label %2757, label %2761

2757:                                             ; preds = %2742
  %2758 = and i64 %2756, -225
  %2759 = or i64 %2758, 32
  %2760 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %2759, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %3202

2761:                                             ; preds = %2742
  %2762 = and i64 %2756, 2
  %2763 = and i64 %2756, -3
  %2764 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %2763, i64 0
  br label %2765

2765:                                             ; preds = %3191, %2761
  %2766 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.6, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.6, i64 0, i64 14) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([15 x i8]* addrspacecast ([15 x i8] addrspace(4)* @.str.6 to [15 x i8]*) to i64)), i64 1))), %2761 ], [ %3199, %3191 ]
  %2767 = phi i8 addrspace(4)* [ getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.6, i64 0, i64 0), %2761 ], [ %3200, %3191 ]
  %2768 = phi <2 x i64> [ %2764, %2761 ], [ %3198, %3191 ]
  %2769 = icmp ugt i64 %2766, 56
  %2770 = extractelement <2 x i64> %2768, i64 0
  %2771 = or i64 %2770, %2762
  %2772 = insertelement <2 x i64> poison, i64 %2771, i64 0
  %2773 = select i1 %2769, <2 x i64> %2768, <2 x i64> %2772
  %2774 = tail call i64 @llvm.umin.i64(i64 %2766, i64 56)
  %2775 = trunc i64 %2774 to i32
  %2776 = extractelement <2 x i64> %2773, i64 0
  %2777 = icmp ugt i32 %2775, 7
  br i1 %2777, label %2780, label %2778

2778:                                             ; preds = %2765
  %2779 = icmp eq i32 %2775, 0
  br i1 %2779, label %2833, label %2820

2780:                                             ; preds = %2765
  %2781 = load i8, i8 addrspace(4)* %2767, align 1, !tbaa !8
  %2782 = zext i8 %2781 to i64
  %2783 = getelementptr inbounds i8, i8 addrspace(4)* %2767, i64 1
  %2784 = load i8, i8 addrspace(4)* %2783, align 1, !tbaa !8
  %2785 = zext i8 %2784 to i64
  %2786 = shl nuw nsw i64 %2785, 8
  %2787 = or i64 %2786, %2782
  %2788 = getelementptr inbounds i8, i8 addrspace(4)* %2767, i64 2
  %2789 = load i8, i8 addrspace(4)* %2788, align 1, !tbaa !8
  %2790 = zext i8 %2789 to i64
  %2791 = shl nuw nsw i64 %2790, 16
  %2792 = or i64 %2787, %2791
  %2793 = getelementptr inbounds i8, i8 addrspace(4)* %2767, i64 3
  %2794 = load i8, i8 addrspace(4)* %2793, align 1, !tbaa !8
  %2795 = zext i8 %2794 to i64
  %2796 = shl nuw nsw i64 %2795, 24
  %2797 = or i64 %2792, %2796
  %2798 = getelementptr inbounds i8, i8 addrspace(4)* %2767, i64 4
  %2799 = load i8, i8 addrspace(4)* %2798, align 1, !tbaa !8
  %2800 = zext i8 %2799 to i64
  %2801 = shl nuw nsw i64 %2800, 32
  %2802 = or i64 %2797, %2801
  %2803 = getelementptr inbounds i8, i8 addrspace(4)* %2767, i64 5
  %2804 = load i8, i8 addrspace(4)* %2803, align 1, !tbaa !8
  %2805 = zext i8 %2804 to i64
  %2806 = shl nuw nsw i64 %2805, 40
  %2807 = or i64 %2802, %2806
  %2808 = getelementptr inbounds i8, i8 addrspace(4)* %2767, i64 6
  %2809 = load i8, i8 addrspace(4)* %2808, align 1, !tbaa !8
  %2810 = zext i8 %2809 to i64
  %2811 = shl nuw nsw i64 %2810, 48
  %2812 = or i64 %2807, %2811
  %2813 = getelementptr inbounds i8, i8 addrspace(4)* %2767, i64 7
  %2814 = load i8, i8 addrspace(4)* %2813, align 1, !tbaa !8
  %2815 = zext i8 %2814 to i64
  %2816 = shl nuw i64 %2815, 56
  %2817 = or i64 %2812, %2816
  %2818 = add nsw i32 %2775, -8
  %2819 = getelementptr inbounds i8, i8 addrspace(4)* %2767, i64 8
  br label %2833

2820:                                             ; preds = %2778, %2820
  %2821 = phi i32 [ %2831, %2820 ], [ 0, %2778 ]
  %2822 = phi i64 [ %2830, %2820 ], [ 0, %2778 ]
  %2823 = zext i32 %2821 to i64
  %2824 = getelementptr inbounds i8, i8 addrspace(4)* %2767, i64 %2823
  %2825 = load i8, i8 addrspace(4)* %2824, align 1, !tbaa !8
  %2826 = zext i8 %2825 to i64
  %2827 = shl i32 %2821, 3
  %2828 = zext i32 %2827 to i64
  %2829 = shl nuw i64 %2826, %2828
  %2830 = or i64 %2829, %2822
  %2831 = add nuw nsw i32 %2821, 1
  %2832 = icmp eq i32 %2831, %2775
  br i1 %2832, label %2833, label %2820, !llvm.loop !9

2833:                                             ; preds = %2820, %2780, %2778
  %2834 = phi i8 addrspace(4)* [ %2819, %2780 ], [ %2767, %2778 ], [ %2767, %2820 ]
  %2835 = phi i32 [ %2818, %2780 ], [ 0, %2778 ], [ 0, %2820 ]
  %2836 = phi i64 [ %2817, %2780 ], [ 0, %2778 ], [ %2830, %2820 ]
  %2837 = icmp ugt i32 %2835, 7
  br i1 %2837, label %2840, label %2838

2838:                                             ; preds = %2833
  %2839 = icmp eq i32 %2835, 0
  br i1 %2839, label %2893, label %2880

2840:                                             ; preds = %2833
  %2841 = load i8, i8 addrspace(4)* %2834, align 1, !tbaa !8
  %2842 = zext i8 %2841 to i64
  %2843 = getelementptr inbounds i8, i8 addrspace(4)* %2834, i64 1
  %2844 = load i8, i8 addrspace(4)* %2843, align 1, !tbaa !8
  %2845 = zext i8 %2844 to i64
  %2846 = shl nuw nsw i64 %2845, 8
  %2847 = or i64 %2846, %2842
  %2848 = getelementptr inbounds i8, i8 addrspace(4)* %2834, i64 2
  %2849 = load i8, i8 addrspace(4)* %2848, align 1, !tbaa !8
  %2850 = zext i8 %2849 to i64
  %2851 = shl nuw nsw i64 %2850, 16
  %2852 = or i64 %2847, %2851
  %2853 = getelementptr inbounds i8, i8 addrspace(4)* %2834, i64 3
  %2854 = load i8, i8 addrspace(4)* %2853, align 1, !tbaa !8
  %2855 = zext i8 %2854 to i64
  %2856 = shl nuw nsw i64 %2855, 24
  %2857 = or i64 %2852, %2856
  %2858 = getelementptr inbounds i8, i8 addrspace(4)* %2834, i64 4
  %2859 = load i8, i8 addrspace(4)* %2858, align 1, !tbaa !8
  %2860 = zext i8 %2859 to i64
  %2861 = shl nuw nsw i64 %2860, 32
  %2862 = or i64 %2857, %2861
  %2863 = getelementptr inbounds i8, i8 addrspace(4)* %2834, i64 5
  %2864 = load i8, i8 addrspace(4)* %2863, align 1, !tbaa !8
  %2865 = zext i8 %2864 to i64
  %2866 = shl nuw nsw i64 %2865, 40
  %2867 = or i64 %2862, %2866
  %2868 = getelementptr inbounds i8, i8 addrspace(4)* %2834, i64 6
  %2869 = load i8, i8 addrspace(4)* %2868, align 1, !tbaa !8
  %2870 = zext i8 %2869 to i64
  %2871 = shl nuw nsw i64 %2870, 48
  %2872 = or i64 %2867, %2871
  %2873 = getelementptr inbounds i8, i8 addrspace(4)* %2834, i64 7
  %2874 = load i8, i8 addrspace(4)* %2873, align 1, !tbaa !8
  %2875 = zext i8 %2874 to i64
  %2876 = shl nuw i64 %2875, 56
  %2877 = or i64 %2872, %2876
  %2878 = add nsw i32 %2835, -8
  %2879 = getelementptr inbounds i8, i8 addrspace(4)* %2834, i64 8
  br label %2893

2880:                                             ; preds = %2838, %2880
  %2881 = phi i32 [ %2891, %2880 ], [ 0, %2838 ]
  %2882 = phi i64 [ %2890, %2880 ], [ 0, %2838 ]
  %2883 = zext i32 %2881 to i64
  %2884 = getelementptr inbounds i8, i8 addrspace(4)* %2834, i64 %2883
  %2885 = load i8, i8 addrspace(4)* %2884, align 1, !tbaa !8
  %2886 = zext i8 %2885 to i64
  %2887 = shl i32 %2881, 3
  %2888 = zext i32 %2887 to i64
  %2889 = shl nuw i64 %2886, %2888
  %2890 = or i64 %2889, %2882
  %2891 = add nuw nsw i32 %2881, 1
  %2892 = icmp eq i32 %2891, %2835
  br i1 %2892, label %2893, label %2880

2893:                                             ; preds = %2880, %2840, %2838
  %2894 = phi i8 addrspace(4)* [ %2879, %2840 ], [ %2834, %2838 ], [ %2834, %2880 ]
  %2895 = phi i32 [ %2878, %2840 ], [ 0, %2838 ], [ 0, %2880 ]
  %2896 = phi i64 [ %2877, %2840 ], [ 0, %2838 ], [ %2890, %2880 ]
  %2897 = icmp ugt i32 %2895, 7
  br i1 %2897, label %2900, label %2898

2898:                                             ; preds = %2893
  %2899 = icmp eq i32 %2895, 0
  br i1 %2899, label %2953, label %2940

2900:                                             ; preds = %2893
  %2901 = load i8, i8 addrspace(4)* %2894, align 1, !tbaa !8
  %2902 = zext i8 %2901 to i64
  %2903 = getelementptr inbounds i8, i8 addrspace(4)* %2894, i64 1
  %2904 = load i8, i8 addrspace(4)* %2903, align 1, !tbaa !8
  %2905 = zext i8 %2904 to i64
  %2906 = shl nuw nsw i64 %2905, 8
  %2907 = or i64 %2906, %2902
  %2908 = getelementptr inbounds i8, i8 addrspace(4)* %2894, i64 2
  %2909 = load i8, i8 addrspace(4)* %2908, align 1, !tbaa !8
  %2910 = zext i8 %2909 to i64
  %2911 = shl nuw nsw i64 %2910, 16
  %2912 = or i64 %2907, %2911
  %2913 = getelementptr inbounds i8, i8 addrspace(4)* %2894, i64 3
  %2914 = load i8, i8 addrspace(4)* %2913, align 1, !tbaa !8
  %2915 = zext i8 %2914 to i64
  %2916 = shl nuw nsw i64 %2915, 24
  %2917 = or i64 %2912, %2916
  %2918 = getelementptr inbounds i8, i8 addrspace(4)* %2894, i64 4
  %2919 = load i8, i8 addrspace(4)* %2918, align 1, !tbaa !8
  %2920 = zext i8 %2919 to i64
  %2921 = shl nuw nsw i64 %2920, 32
  %2922 = or i64 %2917, %2921
  %2923 = getelementptr inbounds i8, i8 addrspace(4)* %2894, i64 5
  %2924 = load i8, i8 addrspace(4)* %2923, align 1, !tbaa !8
  %2925 = zext i8 %2924 to i64
  %2926 = shl nuw nsw i64 %2925, 40
  %2927 = or i64 %2922, %2926
  %2928 = getelementptr inbounds i8, i8 addrspace(4)* %2894, i64 6
  %2929 = load i8, i8 addrspace(4)* %2928, align 1, !tbaa !8
  %2930 = zext i8 %2929 to i64
  %2931 = shl nuw nsw i64 %2930, 48
  %2932 = or i64 %2927, %2931
  %2933 = getelementptr inbounds i8, i8 addrspace(4)* %2894, i64 7
  %2934 = load i8, i8 addrspace(4)* %2933, align 1, !tbaa !8
  %2935 = zext i8 %2934 to i64
  %2936 = shl nuw i64 %2935, 56
  %2937 = or i64 %2932, %2936
  %2938 = add nsw i32 %2895, -8
  %2939 = getelementptr inbounds i8, i8 addrspace(4)* %2894, i64 8
  br label %2953

2940:                                             ; preds = %2898, %2940
  %2941 = phi i32 [ %2951, %2940 ], [ 0, %2898 ]
  %2942 = phi i64 [ %2950, %2940 ], [ 0, %2898 ]
  %2943 = zext i32 %2941 to i64
  %2944 = getelementptr inbounds i8, i8 addrspace(4)* %2894, i64 %2943
  %2945 = load i8, i8 addrspace(4)* %2944, align 1, !tbaa !8
  %2946 = zext i8 %2945 to i64
  %2947 = shl i32 %2941, 3
  %2948 = zext i32 %2947 to i64
  %2949 = shl nuw i64 %2946, %2948
  %2950 = or i64 %2949, %2942
  %2951 = add nuw nsw i32 %2941, 1
  %2952 = icmp eq i32 %2951, %2895
  br i1 %2952, label %2953, label %2940

2953:                                             ; preds = %2940, %2900, %2898
  %2954 = phi i8 addrspace(4)* [ %2939, %2900 ], [ %2894, %2898 ], [ %2894, %2940 ]
  %2955 = phi i32 [ %2938, %2900 ], [ 0, %2898 ], [ 0, %2940 ]
  %2956 = phi i64 [ %2937, %2900 ], [ 0, %2898 ], [ %2950, %2940 ]
  %2957 = icmp ugt i32 %2955, 7
  br i1 %2957, label %2960, label %2958

2958:                                             ; preds = %2953
  %2959 = icmp eq i32 %2955, 0
  br i1 %2959, label %3013, label %3000

2960:                                             ; preds = %2953
  %2961 = load i8, i8 addrspace(4)* %2954, align 1, !tbaa !8
  %2962 = zext i8 %2961 to i64
  %2963 = getelementptr inbounds i8, i8 addrspace(4)* %2954, i64 1
  %2964 = load i8, i8 addrspace(4)* %2963, align 1, !tbaa !8
  %2965 = zext i8 %2964 to i64
  %2966 = shl nuw nsw i64 %2965, 8
  %2967 = or i64 %2966, %2962
  %2968 = getelementptr inbounds i8, i8 addrspace(4)* %2954, i64 2
  %2969 = load i8, i8 addrspace(4)* %2968, align 1, !tbaa !8
  %2970 = zext i8 %2969 to i64
  %2971 = shl nuw nsw i64 %2970, 16
  %2972 = or i64 %2967, %2971
  %2973 = getelementptr inbounds i8, i8 addrspace(4)* %2954, i64 3
  %2974 = load i8, i8 addrspace(4)* %2973, align 1, !tbaa !8
  %2975 = zext i8 %2974 to i64
  %2976 = shl nuw nsw i64 %2975, 24
  %2977 = or i64 %2972, %2976
  %2978 = getelementptr inbounds i8, i8 addrspace(4)* %2954, i64 4
  %2979 = load i8, i8 addrspace(4)* %2978, align 1, !tbaa !8
  %2980 = zext i8 %2979 to i64
  %2981 = shl nuw nsw i64 %2980, 32
  %2982 = or i64 %2977, %2981
  %2983 = getelementptr inbounds i8, i8 addrspace(4)* %2954, i64 5
  %2984 = load i8, i8 addrspace(4)* %2983, align 1, !tbaa !8
  %2985 = zext i8 %2984 to i64
  %2986 = shl nuw nsw i64 %2985, 40
  %2987 = or i64 %2982, %2986
  %2988 = getelementptr inbounds i8, i8 addrspace(4)* %2954, i64 6
  %2989 = load i8, i8 addrspace(4)* %2988, align 1, !tbaa !8
  %2990 = zext i8 %2989 to i64
  %2991 = shl nuw nsw i64 %2990, 48
  %2992 = or i64 %2987, %2991
  %2993 = getelementptr inbounds i8, i8 addrspace(4)* %2954, i64 7
  %2994 = load i8, i8 addrspace(4)* %2993, align 1, !tbaa !8
  %2995 = zext i8 %2994 to i64
  %2996 = shl nuw i64 %2995, 56
  %2997 = or i64 %2992, %2996
  %2998 = add nsw i32 %2955, -8
  %2999 = getelementptr inbounds i8, i8 addrspace(4)* %2954, i64 8
  br label %3013

3000:                                             ; preds = %2958, %3000
  %3001 = phi i32 [ %3011, %3000 ], [ 0, %2958 ]
  %3002 = phi i64 [ %3010, %3000 ], [ 0, %2958 ]
  %3003 = zext i32 %3001 to i64
  %3004 = getelementptr inbounds i8, i8 addrspace(4)* %2954, i64 %3003
  %3005 = load i8, i8 addrspace(4)* %3004, align 1, !tbaa !8
  %3006 = zext i8 %3005 to i64
  %3007 = shl i32 %3001, 3
  %3008 = zext i32 %3007 to i64
  %3009 = shl nuw i64 %3006, %3008
  %3010 = or i64 %3009, %3002
  %3011 = add nuw nsw i32 %3001, 1
  %3012 = icmp eq i32 %3011, %2955
  br i1 %3012, label %3013, label %3000

3013:                                             ; preds = %3000, %2960, %2958
  %3014 = phi i8 addrspace(4)* [ %2999, %2960 ], [ %2954, %2958 ], [ %2954, %3000 ]
  %3015 = phi i32 [ %2998, %2960 ], [ 0, %2958 ], [ 0, %3000 ]
  %3016 = phi i64 [ %2997, %2960 ], [ 0, %2958 ], [ %3010, %3000 ]
  %3017 = icmp ugt i32 %3015, 7
  br i1 %3017, label %3020, label %3018

3018:                                             ; preds = %3013
  %3019 = icmp eq i32 %3015, 0
  br i1 %3019, label %3073, label %3060

3020:                                             ; preds = %3013
  %3021 = load i8, i8 addrspace(4)* %3014, align 1, !tbaa !8
  %3022 = zext i8 %3021 to i64
  %3023 = getelementptr inbounds i8, i8 addrspace(4)* %3014, i64 1
  %3024 = load i8, i8 addrspace(4)* %3023, align 1, !tbaa !8
  %3025 = zext i8 %3024 to i64
  %3026 = shl nuw nsw i64 %3025, 8
  %3027 = or i64 %3026, %3022
  %3028 = getelementptr inbounds i8, i8 addrspace(4)* %3014, i64 2
  %3029 = load i8, i8 addrspace(4)* %3028, align 1, !tbaa !8
  %3030 = zext i8 %3029 to i64
  %3031 = shl nuw nsw i64 %3030, 16
  %3032 = or i64 %3027, %3031
  %3033 = getelementptr inbounds i8, i8 addrspace(4)* %3014, i64 3
  %3034 = load i8, i8 addrspace(4)* %3033, align 1, !tbaa !8
  %3035 = zext i8 %3034 to i64
  %3036 = shl nuw nsw i64 %3035, 24
  %3037 = or i64 %3032, %3036
  %3038 = getelementptr inbounds i8, i8 addrspace(4)* %3014, i64 4
  %3039 = load i8, i8 addrspace(4)* %3038, align 1, !tbaa !8
  %3040 = zext i8 %3039 to i64
  %3041 = shl nuw nsw i64 %3040, 32
  %3042 = or i64 %3037, %3041
  %3043 = getelementptr inbounds i8, i8 addrspace(4)* %3014, i64 5
  %3044 = load i8, i8 addrspace(4)* %3043, align 1, !tbaa !8
  %3045 = zext i8 %3044 to i64
  %3046 = shl nuw nsw i64 %3045, 40
  %3047 = or i64 %3042, %3046
  %3048 = getelementptr inbounds i8, i8 addrspace(4)* %3014, i64 6
  %3049 = load i8, i8 addrspace(4)* %3048, align 1, !tbaa !8
  %3050 = zext i8 %3049 to i64
  %3051 = shl nuw nsw i64 %3050, 48
  %3052 = or i64 %3047, %3051
  %3053 = getelementptr inbounds i8, i8 addrspace(4)* %3014, i64 7
  %3054 = load i8, i8 addrspace(4)* %3053, align 1, !tbaa !8
  %3055 = zext i8 %3054 to i64
  %3056 = shl nuw i64 %3055, 56
  %3057 = or i64 %3052, %3056
  %3058 = add nsw i32 %3015, -8
  %3059 = getelementptr inbounds i8, i8 addrspace(4)* %3014, i64 8
  br label %3073

3060:                                             ; preds = %3018, %3060
  %3061 = phi i32 [ %3071, %3060 ], [ 0, %3018 ]
  %3062 = phi i64 [ %3070, %3060 ], [ 0, %3018 ]
  %3063 = zext i32 %3061 to i64
  %3064 = getelementptr inbounds i8, i8 addrspace(4)* %3014, i64 %3063
  %3065 = load i8, i8 addrspace(4)* %3064, align 1, !tbaa !8
  %3066 = zext i8 %3065 to i64
  %3067 = shl i32 %3061, 3
  %3068 = zext i32 %3067 to i64
  %3069 = shl nuw i64 %3066, %3068
  %3070 = or i64 %3069, %3062
  %3071 = add nuw nsw i32 %3061, 1
  %3072 = icmp eq i32 %3071, %3015
  br i1 %3072, label %3073, label %3060

3073:                                             ; preds = %3060, %3020, %3018
  %3074 = phi i8 addrspace(4)* [ %3059, %3020 ], [ %3014, %3018 ], [ %3014, %3060 ]
  %3075 = phi i32 [ %3058, %3020 ], [ 0, %3018 ], [ 0, %3060 ]
  %3076 = phi i64 [ %3057, %3020 ], [ 0, %3018 ], [ %3070, %3060 ]
  %3077 = icmp ugt i32 %3075, 7
  br i1 %3077, label %3080, label %3078

3078:                                             ; preds = %3073
  %3079 = icmp eq i32 %3075, 0
  br i1 %3079, label %3133, label %3120

3080:                                             ; preds = %3073
  %3081 = load i8, i8 addrspace(4)* %3074, align 1, !tbaa !8
  %3082 = zext i8 %3081 to i64
  %3083 = getelementptr inbounds i8, i8 addrspace(4)* %3074, i64 1
  %3084 = load i8, i8 addrspace(4)* %3083, align 1, !tbaa !8
  %3085 = zext i8 %3084 to i64
  %3086 = shl nuw nsw i64 %3085, 8
  %3087 = or i64 %3086, %3082
  %3088 = getelementptr inbounds i8, i8 addrspace(4)* %3074, i64 2
  %3089 = load i8, i8 addrspace(4)* %3088, align 1, !tbaa !8
  %3090 = zext i8 %3089 to i64
  %3091 = shl nuw nsw i64 %3090, 16
  %3092 = or i64 %3087, %3091
  %3093 = getelementptr inbounds i8, i8 addrspace(4)* %3074, i64 3
  %3094 = load i8, i8 addrspace(4)* %3093, align 1, !tbaa !8
  %3095 = zext i8 %3094 to i64
  %3096 = shl nuw nsw i64 %3095, 24
  %3097 = or i64 %3092, %3096
  %3098 = getelementptr inbounds i8, i8 addrspace(4)* %3074, i64 4
  %3099 = load i8, i8 addrspace(4)* %3098, align 1, !tbaa !8
  %3100 = zext i8 %3099 to i64
  %3101 = shl nuw nsw i64 %3100, 32
  %3102 = or i64 %3097, %3101
  %3103 = getelementptr inbounds i8, i8 addrspace(4)* %3074, i64 5
  %3104 = load i8, i8 addrspace(4)* %3103, align 1, !tbaa !8
  %3105 = zext i8 %3104 to i64
  %3106 = shl nuw nsw i64 %3105, 40
  %3107 = or i64 %3102, %3106
  %3108 = getelementptr inbounds i8, i8 addrspace(4)* %3074, i64 6
  %3109 = load i8, i8 addrspace(4)* %3108, align 1, !tbaa !8
  %3110 = zext i8 %3109 to i64
  %3111 = shl nuw nsw i64 %3110, 48
  %3112 = or i64 %3107, %3111
  %3113 = getelementptr inbounds i8, i8 addrspace(4)* %3074, i64 7
  %3114 = load i8, i8 addrspace(4)* %3113, align 1, !tbaa !8
  %3115 = zext i8 %3114 to i64
  %3116 = shl nuw i64 %3115, 56
  %3117 = or i64 %3112, %3116
  %3118 = add nsw i32 %3075, -8
  %3119 = getelementptr inbounds i8, i8 addrspace(4)* %3074, i64 8
  br label %3133

3120:                                             ; preds = %3078, %3120
  %3121 = phi i32 [ %3131, %3120 ], [ 0, %3078 ]
  %3122 = phi i64 [ %3130, %3120 ], [ 0, %3078 ]
  %3123 = zext i32 %3121 to i64
  %3124 = getelementptr inbounds i8, i8 addrspace(4)* %3074, i64 %3123
  %3125 = load i8, i8 addrspace(4)* %3124, align 1, !tbaa !8
  %3126 = zext i8 %3125 to i64
  %3127 = shl i32 %3121, 3
  %3128 = zext i32 %3127 to i64
  %3129 = shl nuw i64 %3126, %3128
  %3130 = or i64 %3129, %3122
  %3131 = add nuw nsw i32 %3121, 1
  %3132 = icmp eq i32 %3131, %3075
  br i1 %3132, label %3133, label %3120

3133:                                             ; preds = %3120, %3080, %3078
  %3134 = phi i8 addrspace(4)* [ %3119, %3080 ], [ %3074, %3078 ], [ %3074, %3120 ]
  %3135 = phi i32 [ %3118, %3080 ], [ 0, %3078 ], [ 0, %3120 ]
  %3136 = phi i64 [ %3117, %3080 ], [ 0, %3078 ], [ %3130, %3120 ]
  %3137 = icmp ugt i32 %3135, 7
  br i1 %3137, label %3140, label %3138

3138:                                             ; preds = %3133
  %3139 = icmp eq i32 %3135, 0
  br i1 %3139, label %3191, label %3178

3140:                                             ; preds = %3133
  %3141 = load i8, i8 addrspace(4)* %3134, align 1, !tbaa !8
  %3142 = zext i8 %3141 to i64
  %3143 = getelementptr inbounds i8, i8 addrspace(4)* %3134, i64 1
  %3144 = load i8, i8 addrspace(4)* %3143, align 1, !tbaa !8
  %3145 = zext i8 %3144 to i64
  %3146 = shl nuw nsw i64 %3145, 8
  %3147 = or i64 %3146, %3142
  %3148 = getelementptr inbounds i8, i8 addrspace(4)* %3134, i64 2
  %3149 = load i8, i8 addrspace(4)* %3148, align 1, !tbaa !8
  %3150 = zext i8 %3149 to i64
  %3151 = shl nuw nsw i64 %3150, 16
  %3152 = or i64 %3147, %3151
  %3153 = getelementptr inbounds i8, i8 addrspace(4)* %3134, i64 3
  %3154 = load i8, i8 addrspace(4)* %3153, align 1, !tbaa !8
  %3155 = zext i8 %3154 to i64
  %3156 = shl nuw nsw i64 %3155, 24
  %3157 = or i64 %3152, %3156
  %3158 = getelementptr inbounds i8, i8 addrspace(4)* %3134, i64 4
  %3159 = load i8, i8 addrspace(4)* %3158, align 1, !tbaa !8
  %3160 = zext i8 %3159 to i64
  %3161 = shl nuw nsw i64 %3160, 32
  %3162 = or i64 %3157, %3161
  %3163 = getelementptr inbounds i8, i8 addrspace(4)* %3134, i64 5
  %3164 = load i8, i8 addrspace(4)* %3163, align 1, !tbaa !8
  %3165 = zext i8 %3164 to i64
  %3166 = shl nuw nsw i64 %3165, 40
  %3167 = or i64 %3162, %3166
  %3168 = getelementptr inbounds i8, i8 addrspace(4)* %3134, i64 6
  %3169 = load i8, i8 addrspace(4)* %3168, align 1, !tbaa !8
  %3170 = zext i8 %3169 to i64
  %3171 = shl nuw nsw i64 %3170, 48
  %3172 = or i64 %3167, %3171
  %3173 = getelementptr inbounds i8, i8 addrspace(4)* %3134, i64 7
  %3174 = load i8, i8 addrspace(4)* %3173, align 1, !tbaa !8
  %3175 = zext i8 %3174 to i64
  %3176 = shl nuw i64 %3175, 56
  %3177 = or i64 %3172, %3176
  br label %3191

3178:                                             ; preds = %3138, %3178
  %3179 = phi i32 [ %3189, %3178 ], [ 0, %3138 ]
  %3180 = phi i64 [ %3188, %3178 ], [ 0, %3138 ]
  %3181 = zext i32 %3179 to i64
  %3182 = getelementptr inbounds i8, i8 addrspace(4)* %3134, i64 %3181
  %3183 = load i8, i8 addrspace(4)* %3182, align 1, !tbaa !8
  %3184 = zext i8 %3183 to i64
  %3185 = shl i32 %3179, 3
  %3186 = zext i32 %3185 to i64
  %3187 = shl nuw i64 %3184, %3186
  %3188 = or i64 %3187, %3180
  %3189 = add nuw nsw i32 %3179, 1
  %3190 = icmp eq i32 %3189, %3135
  br i1 %3190, label %3191, label %3178

3191:                                             ; preds = %3178, %3140, %3138
  %3192 = phi i64 [ %3177, %3140 ], [ 0, %3138 ], [ %3188, %3178 ]
  %3193 = shl nuw nsw i64 %2774, 2
  %3194 = add nuw nsw i64 %3193, 28
  %3195 = and i64 %3194, 480
  %3196 = and i64 %2776, -225
  %3197 = or i64 %3196, %3195
  %3198 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %3197, i64 noundef %2836, i64 noundef %2896, i64 noundef %2956, i64 noundef %3016, i64 noundef %3076, i64 noundef %3136, i64 noundef %3192) #10
  %3199 = sub i64 %2766, %2774
  %3200 = getelementptr inbounds i8, i8 addrspace(4)* %2767, i64 %2774
  %3201 = icmp eq i64 %3199, 0
  br i1 %3201, label %3202, label %2765

3202:                                             ; preds = %3191, %2757
  %3203 = phi <2 x i64> [ %2760, %2757 ], [ %3198, %3191 ]
  %3204 = extractelement <2 x i64> %3203, i64 0
  %3205 = and i64 %3204, -227
  %3206 = or i64 %3205, 34
  %3207 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %3206, i64 noundef %2754, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %3208 = add nsw i32 %2748, 50
  %3209 = sext i32 %3208 to i64
  %3210 = getelementptr inbounds double, double addrspace(1)* %6, i64 %3209
  %3211 = bitcast double addrspace(1)* %3210 to i64 addrspace(1)*
  %3212 = load i64, i64 addrspace(1)* %3211, align 8, !tbaa !11
  %3213 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %3214 = extractelement <2 x i64> %3213, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([11 x i8], [11 x i8] addrspace(4)* @.str.7, i64 0, i64 0) to i8*), i8* null), label %3215, label %3219

3215:                                             ; preds = %3202
  %3216 = and i64 %3214, -225
  %3217 = or i64 %3216, 32
  %3218 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %3217, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %3660

3219:                                             ; preds = %3202
  %3220 = and i64 %3214, 2
  %3221 = and i64 %3214, -3
  %3222 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %3221, i64 0
  br label %3223

3223:                                             ; preds = %3649, %3219
  %3224 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([11 x i8], [11 x i8] addrspace(4)* @.str.7, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([11 x i8], [11 x i8] addrspace(4)* @.str.7, i64 0, i64 10) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([11 x i8]* addrspacecast ([11 x i8] addrspace(4)* @.str.7 to [11 x i8]*) to i64)), i64 1))), %3219 ], [ %3657, %3649 ]
  %3225 = phi i8 addrspace(4)* [ getelementptr inbounds ([11 x i8], [11 x i8] addrspace(4)* @.str.7, i64 0, i64 0), %3219 ], [ %3658, %3649 ]
  %3226 = phi <2 x i64> [ %3222, %3219 ], [ %3656, %3649 ]
  %3227 = icmp ugt i64 %3224, 56
  %3228 = extractelement <2 x i64> %3226, i64 0
  %3229 = or i64 %3228, %3220
  %3230 = insertelement <2 x i64> poison, i64 %3229, i64 0
  %3231 = select i1 %3227, <2 x i64> %3226, <2 x i64> %3230
  %3232 = tail call i64 @llvm.umin.i64(i64 %3224, i64 56)
  %3233 = trunc i64 %3232 to i32
  %3234 = extractelement <2 x i64> %3231, i64 0
  %3235 = icmp ugt i32 %3233, 7
  br i1 %3235, label %3238, label %3236

3236:                                             ; preds = %3223
  %3237 = icmp eq i32 %3233, 0
  br i1 %3237, label %3291, label %3278

3238:                                             ; preds = %3223
  %3239 = load i8, i8 addrspace(4)* %3225, align 1, !tbaa !8
  %3240 = zext i8 %3239 to i64
  %3241 = getelementptr inbounds i8, i8 addrspace(4)* %3225, i64 1
  %3242 = load i8, i8 addrspace(4)* %3241, align 1, !tbaa !8
  %3243 = zext i8 %3242 to i64
  %3244 = shl nuw nsw i64 %3243, 8
  %3245 = or i64 %3244, %3240
  %3246 = getelementptr inbounds i8, i8 addrspace(4)* %3225, i64 2
  %3247 = load i8, i8 addrspace(4)* %3246, align 1, !tbaa !8
  %3248 = zext i8 %3247 to i64
  %3249 = shl nuw nsw i64 %3248, 16
  %3250 = or i64 %3245, %3249
  %3251 = getelementptr inbounds i8, i8 addrspace(4)* %3225, i64 3
  %3252 = load i8, i8 addrspace(4)* %3251, align 1, !tbaa !8
  %3253 = zext i8 %3252 to i64
  %3254 = shl nuw nsw i64 %3253, 24
  %3255 = or i64 %3250, %3254
  %3256 = getelementptr inbounds i8, i8 addrspace(4)* %3225, i64 4
  %3257 = load i8, i8 addrspace(4)* %3256, align 1, !tbaa !8
  %3258 = zext i8 %3257 to i64
  %3259 = shl nuw nsw i64 %3258, 32
  %3260 = or i64 %3255, %3259
  %3261 = getelementptr inbounds i8, i8 addrspace(4)* %3225, i64 5
  %3262 = load i8, i8 addrspace(4)* %3261, align 1, !tbaa !8
  %3263 = zext i8 %3262 to i64
  %3264 = shl nuw nsw i64 %3263, 40
  %3265 = or i64 %3260, %3264
  %3266 = getelementptr inbounds i8, i8 addrspace(4)* %3225, i64 6
  %3267 = load i8, i8 addrspace(4)* %3266, align 1, !tbaa !8
  %3268 = zext i8 %3267 to i64
  %3269 = shl nuw nsw i64 %3268, 48
  %3270 = or i64 %3265, %3269
  %3271 = getelementptr inbounds i8, i8 addrspace(4)* %3225, i64 7
  %3272 = load i8, i8 addrspace(4)* %3271, align 1, !tbaa !8
  %3273 = zext i8 %3272 to i64
  %3274 = shl nuw i64 %3273, 56
  %3275 = or i64 %3270, %3274
  %3276 = add nsw i32 %3233, -8
  %3277 = getelementptr inbounds i8, i8 addrspace(4)* %3225, i64 8
  br label %3291

3278:                                             ; preds = %3236, %3278
  %3279 = phi i32 [ %3289, %3278 ], [ 0, %3236 ]
  %3280 = phi i64 [ %3288, %3278 ], [ 0, %3236 ]
  %3281 = zext i32 %3279 to i64
  %3282 = getelementptr inbounds i8, i8 addrspace(4)* %3225, i64 %3281
  %3283 = load i8, i8 addrspace(4)* %3282, align 1, !tbaa !8
  %3284 = zext i8 %3283 to i64
  %3285 = shl i32 %3279, 3
  %3286 = zext i32 %3285 to i64
  %3287 = shl nuw i64 %3284, %3286
  %3288 = or i64 %3287, %3280
  %3289 = add nuw nsw i32 %3279, 1
  %3290 = icmp eq i32 %3289, %3233
  br i1 %3290, label %3291, label %3278, !llvm.loop !9

3291:                                             ; preds = %3278, %3238, %3236
  %3292 = phi i8 addrspace(4)* [ %3277, %3238 ], [ %3225, %3236 ], [ %3225, %3278 ]
  %3293 = phi i32 [ %3276, %3238 ], [ 0, %3236 ], [ 0, %3278 ]
  %3294 = phi i64 [ %3275, %3238 ], [ 0, %3236 ], [ %3288, %3278 ]
  %3295 = icmp ugt i32 %3293, 7
  br i1 %3295, label %3298, label %3296

3296:                                             ; preds = %3291
  %3297 = icmp eq i32 %3293, 0
  br i1 %3297, label %3351, label %3338

3298:                                             ; preds = %3291
  %3299 = load i8, i8 addrspace(4)* %3292, align 1, !tbaa !8
  %3300 = zext i8 %3299 to i64
  %3301 = getelementptr inbounds i8, i8 addrspace(4)* %3292, i64 1
  %3302 = load i8, i8 addrspace(4)* %3301, align 1, !tbaa !8
  %3303 = zext i8 %3302 to i64
  %3304 = shl nuw nsw i64 %3303, 8
  %3305 = or i64 %3304, %3300
  %3306 = getelementptr inbounds i8, i8 addrspace(4)* %3292, i64 2
  %3307 = load i8, i8 addrspace(4)* %3306, align 1, !tbaa !8
  %3308 = zext i8 %3307 to i64
  %3309 = shl nuw nsw i64 %3308, 16
  %3310 = or i64 %3305, %3309
  %3311 = getelementptr inbounds i8, i8 addrspace(4)* %3292, i64 3
  %3312 = load i8, i8 addrspace(4)* %3311, align 1, !tbaa !8
  %3313 = zext i8 %3312 to i64
  %3314 = shl nuw nsw i64 %3313, 24
  %3315 = or i64 %3310, %3314
  %3316 = getelementptr inbounds i8, i8 addrspace(4)* %3292, i64 4
  %3317 = load i8, i8 addrspace(4)* %3316, align 1, !tbaa !8
  %3318 = zext i8 %3317 to i64
  %3319 = shl nuw nsw i64 %3318, 32
  %3320 = or i64 %3315, %3319
  %3321 = getelementptr inbounds i8, i8 addrspace(4)* %3292, i64 5
  %3322 = load i8, i8 addrspace(4)* %3321, align 1, !tbaa !8
  %3323 = zext i8 %3322 to i64
  %3324 = shl nuw nsw i64 %3323, 40
  %3325 = or i64 %3320, %3324
  %3326 = getelementptr inbounds i8, i8 addrspace(4)* %3292, i64 6
  %3327 = load i8, i8 addrspace(4)* %3326, align 1, !tbaa !8
  %3328 = zext i8 %3327 to i64
  %3329 = shl nuw nsw i64 %3328, 48
  %3330 = or i64 %3325, %3329
  %3331 = getelementptr inbounds i8, i8 addrspace(4)* %3292, i64 7
  %3332 = load i8, i8 addrspace(4)* %3331, align 1, !tbaa !8
  %3333 = zext i8 %3332 to i64
  %3334 = shl nuw i64 %3333, 56
  %3335 = or i64 %3330, %3334
  %3336 = add nsw i32 %3293, -8
  %3337 = getelementptr inbounds i8, i8 addrspace(4)* %3292, i64 8
  br label %3351

3338:                                             ; preds = %3296, %3338
  %3339 = phi i32 [ %3349, %3338 ], [ 0, %3296 ]
  %3340 = phi i64 [ %3348, %3338 ], [ 0, %3296 ]
  %3341 = zext i32 %3339 to i64
  %3342 = getelementptr inbounds i8, i8 addrspace(4)* %3292, i64 %3341
  %3343 = load i8, i8 addrspace(4)* %3342, align 1, !tbaa !8
  %3344 = zext i8 %3343 to i64
  %3345 = shl i32 %3339, 3
  %3346 = zext i32 %3345 to i64
  %3347 = shl nuw i64 %3344, %3346
  %3348 = or i64 %3347, %3340
  %3349 = add nuw nsw i32 %3339, 1
  %3350 = icmp eq i32 %3349, %3293
  br i1 %3350, label %3351, label %3338

3351:                                             ; preds = %3338, %3298, %3296
  %3352 = phi i8 addrspace(4)* [ %3337, %3298 ], [ %3292, %3296 ], [ %3292, %3338 ]
  %3353 = phi i32 [ %3336, %3298 ], [ 0, %3296 ], [ 0, %3338 ]
  %3354 = phi i64 [ %3335, %3298 ], [ 0, %3296 ], [ %3348, %3338 ]
  %3355 = icmp ugt i32 %3353, 7
  br i1 %3355, label %3358, label %3356

3356:                                             ; preds = %3351
  %3357 = icmp eq i32 %3353, 0
  br i1 %3357, label %3411, label %3398

3358:                                             ; preds = %3351
  %3359 = load i8, i8 addrspace(4)* %3352, align 1, !tbaa !8
  %3360 = zext i8 %3359 to i64
  %3361 = getelementptr inbounds i8, i8 addrspace(4)* %3352, i64 1
  %3362 = load i8, i8 addrspace(4)* %3361, align 1, !tbaa !8
  %3363 = zext i8 %3362 to i64
  %3364 = shl nuw nsw i64 %3363, 8
  %3365 = or i64 %3364, %3360
  %3366 = getelementptr inbounds i8, i8 addrspace(4)* %3352, i64 2
  %3367 = load i8, i8 addrspace(4)* %3366, align 1, !tbaa !8
  %3368 = zext i8 %3367 to i64
  %3369 = shl nuw nsw i64 %3368, 16
  %3370 = or i64 %3365, %3369
  %3371 = getelementptr inbounds i8, i8 addrspace(4)* %3352, i64 3
  %3372 = load i8, i8 addrspace(4)* %3371, align 1, !tbaa !8
  %3373 = zext i8 %3372 to i64
  %3374 = shl nuw nsw i64 %3373, 24
  %3375 = or i64 %3370, %3374
  %3376 = getelementptr inbounds i8, i8 addrspace(4)* %3352, i64 4
  %3377 = load i8, i8 addrspace(4)* %3376, align 1, !tbaa !8
  %3378 = zext i8 %3377 to i64
  %3379 = shl nuw nsw i64 %3378, 32
  %3380 = or i64 %3375, %3379
  %3381 = getelementptr inbounds i8, i8 addrspace(4)* %3352, i64 5
  %3382 = load i8, i8 addrspace(4)* %3381, align 1, !tbaa !8
  %3383 = zext i8 %3382 to i64
  %3384 = shl nuw nsw i64 %3383, 40
  %3385 = or i64 %3380, %3384
  %3386 = getelementptr inbounds i8, i8 addrspace(4)* %3352, i64 6
  %3387 = load i8, i8 addrspace(4)* %3386, align 1, !tbaa !8
  %3388 = zext i8 %3387 to i64
  %3389 = shl nuw nsw i64 %3388, 48
  %3390 = or i64 %3385, %3389
  %3391 = getelementptr inbounds i8, i8 addrspace(4)* %3352, i64 7
  %3392 = load i8, i8 addrspace(4)* %3391, align 1, !tbaa !8
  %3393 = zext i8 %3392 to i64
  %3394 = shl nuw i64 %3393, 56
  %3395 = or i64 %3390, %3394
  %3396 = add nsw i32 %3353, -8
  %3397 = getelementptr inbounds i8, i8 addrspace(4)* %3352, i64 8
  br label %3411

3398:                                             ; preds = %3356, %3398
  %3399 = phi i32 [ %3409, %3398 ], [ 0, %3356 ]
  %3400 = phi i64 [ %3408, %3398 ], [ 0, %3356 ]
  %3401 = zext i32 %3399 to i64
  %3402 = getelementptr inbounds i8, i8 addrspace(4)* %3352, i64 %3401
  %3403 = load i8, i8 addrspace(4)* %3402, align 1, !tbaa !8
  %3404 = zext i8 %3403 to i64
  %3405 = shl i32 %3399, 3
  %3406 = zext i32 %3405 to i64
  %3407 = shl nuw i64 %3404, %3406
  %3408 = or i64 %3407, %3400
  %3409 = add nuw nsw i32 %3399, 1
  %3410 = icmp eq i32 %3409, %3353
  br i1 %3410, label %3411, label %3398

3411:                                             ; preds = %3398, %3358, %3356
  %3412 = phi i8 addrspace(4)* [ %3397, %3358 ], [ %3352, %3356 ], [ %3352, %3398 ]
  %3413 = phi i32 [ %3396, %3358 ], [ 0, %3356 ], [ 0, %3398 ]
  %3414 = phi i64 [ %3395, %3358 ], [ 0, %3356 ], [ %3408, %3398 ]
  %3415 = icmp ugt i32 %3413, 7
  br i1 %3415, label %3418, label %3416

3416:                                             ; preds = %3411
  %3417 = icmp eq i32 %3413, 0
  br i1 %3417, label %3471, label %3458

3418:                                             ; preds = %3411
  %3419 = load i8, i8 addrspace(4)* %3412, align 1, !tbaa !8
  %3420 = zext i8 %3419 to i64
  %3421 = getelementptr inbounds i8, i8 addrspace(4)* %3412, i64 1
  %3422 = load i8, i8 addrspace(4)* %3421, align 1, !tbaa !8
  %3423 = zext i8 %3422 to i64
  %3424 = shl nuw nsw i64 %3423, 8
  %3425 = or i64 %3424, %3420
  %3426 = getelementptr inbounds i8, i8 addrspace(4)* %3412, i64 2
  %3427 = load i8, i8 addrspace(4)* %3426, align 1, !tbaa !8
  %3428 = zext i8 %3427 to i64
  %3429 = shl nuw nsw i64 %3428, 16
  %3430 = or i64 %3425, %3429
  %3431 = getelementptr inbounds i8, i8 addrspace(4)* %3412, i64 3
  %3432 = load i8, i8 addrspace(4)* %3431, align 1, !tbaa !8
  %3433 = zext i8 %3432 to i64
  %3434 = shl nuw nsw i64 %3433, 24
  %3435 = or i64 %3430, %3434
  %3436 = getelementptr inbounds i8, i8 addrspace(4)* %3412, i64 4
  %3437 = load i8, i8 addrspace(4)* %3436, align 1, !tbaa !8
  %3438 = zext i8 %3437 to i64
  %3439 = shl nuw nsw i64 %3438, 32
  %3440 = or i64 %3435, %3439
  %3441 = getelementptr inbounds i8, i8 addrspace(4)* %3412, i64 5
  %3442 = load i8, i8 addrspace(4)* %3441, align 1, !tbaa !8
  %3443 = zext i8 %3442 to i64
  %3444 = shl nuw nsw i64 %3443, 40
  %3445 = or i64 %3440, %3444
  %3446 = getelementptr inbounds i8, i8 addrspace(4)* %3412, i64 6
  %3447 = load i8, i8 addrspace(4)* %3446, align 1, !tbaa !8
  %3448 = zext i8 %3447 to i64
  %3449 = shl nuw nsw i64 %3448, 48
  %3450 = or i64 %3445, %3449
  %3451 = getelementptr inbounds i8, i8 addrspace(4)* %3412, i64 7
  %3452 = load i8, i8 addrspace(4)* %3451, align 1, !tbaa !8
  %3453 = zext i8 %3452 to i64
  %3454 = shl nuw i64 %3453, 56
  %3455 = or i64 %3450, %3454
  %3456 = add nsw i32 %3413, -8
  %3457 = getelementptr inbounds i8, i8 addrspace(4)* %3412, i64 8
  br label %3471

3458:                                             ; preds = %3416, %3458
  %3459 = phi i32 [ %3469, %3458 ], [ 0, %3416 ]
  %3460 = phi i64 [ %3468, %3458 ], [ 0, %3416 ]
  %3461 = zext i32 %3459 to i64
  %3462 = getelementptr inbounds i8, i8 addrspace(4)* %3412, i64 %3461
  %3463 = load i8, i8 addrspace(4)* %3462, align 1, !tbaa !8
  %3464 = zext i8 %3463 to i64
  %3465 = shl i32 %3459, 3
  %3466 = zext i32 %3465 to i64
  %3467 = shl nuw i64 %3464, %3466
  %3468 = or i64 %3467, %3460
  %3469 = add nuw nsw i32 %3459, 1
  %3470 = icmp eq i32 %3469, %3413
  br i1 %3470, label %3471, label %3458

3471:                                             ; preds = %3458, %3418, %3416
  %3472 = phi i8 addrspace(4)* [ %3457, %3418 ], [ %3412, %3416 ], [ %3412, %3458 ]
  %3473 = phi i32 [ %3456, %3418 ], [ 0, %3416 ], [ 0, %3458 ]
  %3474 = phi i64 [ %3455, %3418 ], [ 0, %3416 ], [ %3468, %3458 ]
  %3475 = icmp ugt i32 %3473, 7
  br i1 %3475, label %3478, label %3476

3476:                                             ; preds = %3471
  %3477 = icmp eq i32 %3473, 0
  br i1 %3477, label %3531, label %3518

3478:                                             ; preds = %3471
  %3479 = load i8, i8 addrspace(4)* %3472, align 1, !tbaa !8
  %3480 = zext i8 %3479 to i64
  %3481 = getelementptr inbounds i8, i8 addrspace(4)* %3472, i64 1
  %3482 = load i8, i8 addrspace(4)* %3481, align 1, !tbaa !8
  %3483 = zext i8 %3482 to i64
  %3484 = shl nuw nsw i64 %3483, 8
  %3485 = or i64 %3484, %3480
  %3486 = getelementptr inbounds i8, i8 addrspace(4)* %3472, i64 2
  %3487 = load i8, i8 addrspace(4)* %3486, align 1, !tbaa !8
  %3488 = zext i8 %3487 to i64
  %3489 = shl nuw nsw i64 %3488, 16
  %3490 = or i64 %3485, %3489
  %3491 = getelementptr inbounds i8, i8 addrspace(4)* %3472, i64 3
  %3492 = load i8, i8 addrspace(4)* %3491, align 1, !tbaa !8
  %3493 = zext i8 %3492 to i64
  %3494 = shl nuw nsw i64 %3493, 24
  %3495 = or i64 %3490, %3494
  %3496 = getelementptr inbounds i8, i8 addrspace(4)* %3472, i64 4
  %3497 = load i8, i8 addrspace(4)* %3496, align 1, !tbaa !8
  %3498 = zext i8 %3497 to i64
  %3499 = shl nuw nsw i64 %3498, 32
  %3500 = or i64 %3495, %3499
  %3501 = getelementptr inbounds i8, i8 addrspace(4)* %3472, i64 5
  %3502 = load i8, i8 addrspace(4)* %3501, align 1, !tbaa !8
  %3503 = zext i8 %3502 to i64
  %3504 = shl nuw nsw i64 %3503, 40
  %3505 = or i64 %3500, %3504
  %3506 = getelementptr inbounds i8, i8 addrspace(4)* %3472, i64 6
  %3507 = load i8, i8 addrspace(4)* %3506, align 1, !tbaa !8
  %3508 = zext i8 %3507 to i64
  %3509 = shl nuw nsw i64 %3508, 48
  %3510 = or i64 %3505, %3509
  %3511 = getelementptr inbounds i8, i8 addrspace(4)* %3472, i64 7
  %3512 = load i8, i8 addrspace(4)* %3511, align 1, !tbaa !8
  %3513 = zext i8 %3512 to i64
  %3514 = shl nuw i64 %3513, 56
  %3515 = or i64 %3510, %3514
  %3516 = add nsw i32 %3473, -8
  %3517 = getelementptr inbounds i8, i8 addrspace(4)* %3472, i64 8
  br label %3531

3518:                                             ; preds = %3476, %3518
  %3519 = phi i32 [ %3529, %3518 ], [ 0, %3476 ]
  %3520 = phi i64 [ %3528, %3518 ], [ 0, %3476 ]
  %3521 = zext i32 %3519 to i64
  %3522 = getelementptr inbounds i8, i8 addrspace(4)* %3472, i64 %3521
  %3523 = load i8, i8 addrspace(4)* %3522, align 1, !tbaa !8
  %3524 = zext i8 %3523 to i64
  %3525 = shl i32 %3519, 3
  %3526 = zext i32 %3525 to i64
  %3527 = shl nuw i64 %3524, %3526
  %3528 = or i64 %3527, %3520
  %3529 = add nuw nsw i32 %3519, 1
  %3530 = icmp eq i32 %3529, %3473
  br i1 %3530, label %3531, label %3518

3531:                                             ; preds = %3518, %3478, %3476
  %3532 = phi i8 addrspace(4)* [ %3517, %3478 ], [ %3472, %3476 ], [ %3472, %3518 ]
  %3533 = phi i32 [ %3516, %3478 ], [ 0, %3476 ], [ 0, %3518 ]
  %3534 = phi i64 [ %3515, %3478 ], [ 0, %3476 ], [ %3528, %3518 ]
  %3535 = icmp ugt i32 %3533, 7
  br i1 %3535, label %3538, label %3536

3536:                                             ; preds = %3531
  %3537 = icmp eq i32 %3533, 0
  br i1 %3537, label %3591, label %3578

3538:                                             ; preds = %3531
  %3539 = load i8, i8 addrspace(4)* %3532, align 1, !tbaa !8
  %3540 = zext i8 %3539 to i64
  %3541 = getelementptr inbounds i8, i8 addrspace(4)* %3532, i64 1
  %3542 = load i8, i8 addrspace(4)* %3541, align 1, !tbaa !8
  %3543 = zext i8 %3542 to i64
  %3544 = shl nuw nsw i64 %3543, 8
  %3545 = or i64 %3544, %3540
  %3546 = getelementptr inbounds i8, i8 addrspace(4)* %3532, i64 2
  %3547 = load i8, i8 addrspace(4)* %3546, align 1, !tbaa !8
  %3548 = zext i8 %3547 to i64
  %3549 = shl nuw nsw i64 %3548, 16
  %3550 = or i64 %3545, %3549
  %3551 = getelementptr inbounds i8, i8 addrspace(4)* %3532, i64 3
  %3552 = load i8, i8 addrspace(4)* %3551, align 1, !tbaa !8
  %3553 = zext i8 %3552 to i64
  %3554 = shl nuw nsw i64 %3553, 24
  %3555 = or i64 %3550, %3554
  %3556 = getelementptr inbounds i8, i8 addrspace(4)* %3532, i64 4
  %3557 = load i8, i8 addrspace(4)* %3556, align 1, !tbaa !8
  %3558 = zext i8 %3557 to i64
  %3559 = shl nuw nsw i64 %3558, 32
  %3560 = or i64 %3555, %3559
  %3561 = getelementptr inbounds i8, i8 addrspace(4)* %3532, i64 5
  %3562 = load i8, i8 addrspace(4)* %3561, align 1, !tbaa !8
  %3563 = zext i8 %3562 to i64
  %3564 = shl nuw nsw i64 %3563, 40
  %3565 = or i64 %3560, %3564
  %3566 = getelementptr inbounds i8, i8 addrspace(4)* %3532, i64 6
  %3567 = load i8, i8 addrspace(4)* %3566, align 1, !tbaa !8
  %3568 = zext i8 %3567 to i64
  %3569 = shl nuw nsw i64 %3568, 48
  %3570 = or i64 %3565, %3569
  %3571 = getelementptr inbounds i8, i8 addrspace(4)* %3532, i64 7
  %3572 = load i8, i8 addrspace(4)* %3571, align 1, !tbaa !8
  %3573 = zext i8 %3572 to i64
  %3574 = shl nuw i64 %3573, 56
  %3575 = or i64 %3570, %3574
  %3576 = add nsw i32 %3533, -8
  %3577 = getelementptr inbounds i8, i8 addrspace(4)* %3532, i64 8
  br label %3591

3578:                                             ; preds = %3536, %3578
  %3579 = phi i32 [ %3589, %3578 ], [ 0, %3536 ]
  %3580 = phi i64 [ %3588, %3578 ], [ 0, %3536 ]
  %3581 = zext i32 %3579 to i64
  %3582 = getelementptr inbounds i8, i8 addrspace(4)* %3532, i64 %3581
  %3583 = load i8, i8 addrspace(4)* %3582, align 1, !tbaa !8
  %3584 = zext i8 %3583 to i64
  %3585 = shl i32 %3579, 3
  %3586 = zext i32 %3585 to i64
  %3587 = shl nuw i64 %3584, %3586
  %3588 = or i64 %3587, %3580
  %3589 = add nuw nsw i32 %3579, 1
  %3590 = icmp eq i32 %3589, %3533
  br i1 %3590, label %3591, label %3578

3591:                                             ; preds = %3578, %3538, %3536
  %3592 = phi i8 addrspace(4)* [ %3577, %3538 ], [ %3532, %3536 ], [ %3532, %3578 ]
  %3593 = phi i32 [ %3576, %3538 ], [ 0, %3536 ], [ 0, %3578 ]
  %3594 = phi i64 [ %3575, %3538 ], [ 0, %3536 ], [ %3588, %3578 ]
  %3595 = icmp ugt i32 %3593, 7
  br i1 %3595, label %3598, label %3596

3596:                                             ; preds = %3591
  %3597 = icmp eq i32 %3593, 0
  br i1 %3597, label %3649, label %3636

3598:                                             ; preds = %3591
  %3599 = load i8, i8 addrspace(4)* %3592, align 1, !tbaa !8
  %3600 = zext i8 %3599 to i64
  %3601 = getelementptr inbounds i8, i8 addrspace(4)* %3592, i64 1
  %3602 = load i8, i8 addrspace(4)* %3601, align 1, !tbaa !8
  %3603 = zext i8 %3602 to i64
  %3604 = shl nuw nsw i64 %3603, 8
  %3605 = or i64 %3604, %3600
  %3606 = getelementptr inbounds i8, i8 addrspace(4)* %3592, i64 2
  %3607 = load i8, i8 addrspace(4)* %3606, align 1, !tbaa !8
  %3608 = zext i8 %3607 to i64
  %3609 = shl nuw nsw i64 %3608, 16
  %3610 = or i64 %3605, %3609
  %3611 = getelementptr inbounds i8, i8 addrspace(4)* %3592, i64 3
  %3612 = load i8, i8 addrspace(4)* %3611, align 1, !tbaa !8
  %3613 = zext i8 %3612 to i64
  %3614 = shl nuw nsw i64 %3613, 24
  %3615 = or i64 %3610, %3614
  %3616 = getelementptr inbounds i8, i8 addrspace(4)* %3592, i64 4
  %3617 = load i8, i8 addrspace(4)* %3616, align 1, !tbaa !8
  %3618 = zext i8 %3617 to i64
  %3619 = shl nuw nsw i64 %3618, 32
  %3620 = or i64 %3615, %3619
  %3621 = getelementptr inbounds i8, i8 addrspace(4)* %3592, i64 5
  %3622 = load i8, i8 addrspace(4)* %3621, align 1, !tbaa !8
  %3623 = zext i8 %3622 to i64
  %3624 = shl nuw nsw i64 %3623, 40
  %3625 = or i64 %3620, %3624
  %3626 = getelementptr inbounds i8, i8 addrspace(4)* %3592, i64 6
  %3627 = load i8, i8 addrspace(4)* %3626, align 1, !tbaa !8
  %3628 = zext i8 %3627 to i64
  %3629 = shl nuw nsw i64 %3628, 48
  %3630 = or i64 %3625, %3629
  %3631 = getelementptr inbounds i8, i8 addrspace(4)* %3592, i64 7
  %3632 = load i8, i8 addrspace(4)* %3631, align 1, !tbaa !8
  %3633 = zext i8 %3632 to i64
  %3634 = shl nuw i64 %3633, 56
  %3635 = or i64 %3630, %3634
  br label %3649

3636:                                             ; preds = %3596, %3636
  %3637 = phi i32 [ %3647, %3636 ], [ 0, %3596 ]
  %3638 = phi i64 [ %3646, %3636 ], [ 0, %3596 ]
  %3639 = zext i32 %3637 to i64
  %3640 = getelementptr inbounds i8, i8 addrspace(4)* %3592, i64 %3639
  %3641 = load i8, i8 addrspace(4)* %3640, align 1, !tbaa !8
  %3642 = zext i8 %3641 to i64
  %3643 = shl i32 %3637, 3
  %3644 = zext i32 %3643 to i64
  %3645 = shl nuw i64 %3642, %3644
  %3646 = or i64 %3645, %3638
  %3647 = add nuw nsw i32 %3637, 1
  %3648 = icmp eq i32 %3647, %3593
  br i1 %3648, label %3649, label %3636

3649:                                             ; preds = %3636, %3598, %3596
  %3650 = phi i64 [ %3635, %3598 ], [ 0, %3596 ], [ %3646, %3636 ]
  %3651 = shl nuw nsw i64 %3232, 2
  %3652 = add nuw nsw i64 %3651, 28
  %3653 = and i64 %3652, 480
  %3654 = and i64 %3234, -225
  %3655 = or i64 %3654, %3653
  %3656 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %3655, i64 noundef %3294, i64 noundef %3354, i64 noundef %3414, i64 noundef %3474, i64 noundef %3534, i64 noundef %3594, i64 noundef %3650) #10
  %3657 = sub i64 %3224, %3232
  %3658 = getelementptr inbounds i8, i8 addrspace(4)* %3225, i64 %3232
  %3659 = icmp eq i64 %3657, 0
  br i1 %3659, label %3660, label %3223

3660:                                             ; preds = %3649, %3215
  %3661 = phi <2 x i64> [ %3218, %3215 ], [ %3656, %3649 ]
  %3662 = extractelement <2 x i64> %3661, i64 0
  %3663 = and i64 %3662, -227
  %3664 = or i64 %3663, 34
  %3665 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %3664, i64 noundef %3212, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %3666 = bitcast double addrspace(1)* %7 to i64 addrspace(1)*
  %3667 = load i64, i64 addrspace(1)* %3666, align 8, !tbaa !11
  %3668 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %3669 = extractelement <2 x i64> %3668, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([13 x i8], [13 x i8] addrspace(4)* @.str.8, i64 0, i64 0) to i8*), i8* null), label %3670, label %3674

3670:                                             ; preds = %3660
  %3671 = and i64 %3669, -225
  %3672 = or i64 %3671, 32
  %3673 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %3672, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %4115

3674:                                             ; preds = %3660
  %3675 = and i64 %3669, 2
  %3676 = and i64 %3669, -3
  %3677 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %3676, i64 0
  br label %3678

3678:                                             ; preds = %4104, %3674
  %3679 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([13 x i8], [13 x i8] addrspace(4)* @.str.8, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([13 x i8], [13 x i8] addrspace(4)* @.str.8, i64 0, i64 12) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([13 x i8]* addrspacecast ([13 x i8] addrspace(4)* @.str.8 to [13 x i8]*) to i64)), i64 1))), %3674 ], [ %4112, %4104 ]
  %3680 = phi i8 addrspace(4)* [ getelementptr inbounds ([13 x i8], [13 x i8] addrspace(4)* @.str.8, i64 0, i64 0), %3674 ], [ %4113, %4104 ]
  %3681 = phi <2 x i64> [ %3677, %3674 ], [ %4111, %4104 ]
  %3682 = icmp ugt i64 %3679, 56
  %3683 = extractelement <2 x i64> %3681, i64 0
  %3684 = or i64 %3683, %3675
  %3685 = insertelement <2 x i64> poison, i64 %3684, i64 0
  %3686 = select i1 %3682, <2 x i64> %3681, <2 x i64> %3685
  %3687 = tail call i64 @llvm.umin.i64(i64 %3679, i64 56)
  %3688 = trunc i64 %3687 to i32
  %3689 = extractelement <2 x i64> %3686, i64 0
  %3690 = icmp ugt i32 %3688, 7
  br i1 %3690, label %3693, label %3691

3691:                                             ; preds = %3678
  %3692 = icmp eq i32 %3688, 0
  br i1 %3692, label %3746, label %3733

3693:                                             ; preds = %3678
  %3694 = load i8, i8 addrspace(4)* %3680, align 1, !tbaa !8
  %3695 = zext i8 %3694 to i64
  %3696 = getelementptr inbounds i8, i8 addrspace(4)* %3680, i64 1
  %3697 = load i8, i8 addrspace(4)* %3696, align 1, !tbaa !8
  %3698 = zext i8 %3697 to i64
  %3699 = shl nuw nsw i64 %3698, 8
  %3700 = or i64 %3699, %3695
  %3701 = getelementptr inbounds i8, i8 addrspace(4)* %3680, i64 2
  %3702 = load i8, i8 addrspace(4)* %3701, align 1, !tbaa !8
  %3703 = zext i8 %3702 to i64
  %3704 = shl nuw nsw i64 %3703, 16
  %3705 = or i64 %3700, %3704
  %3706 = getelementptr inbounds i8, i8 addrspace(4)* %3680, i64 3
  %3707 = load i8, i8 addrspace(4)* %3706, align 1, !tbaa !8
  %3708 = zext i8 %3707 to i64
  %3709 = shl nuw nsw i64 %3708, 24
  %3710 = or i64 %3705, %3709
  %3711 = getelementptr inbounds i8, i8 addrspace(4)* %3680, i64 4
  %3712 = load i8, i8 addrspace(4)* %3711, align 1, !tbaa !8
  %3713 = zext i8 %3712 to i64
  %3714 = shl nuw nsw i64 %3713, 32
  %3715 = or i64 %3710, %3714
  %3716 = getelementptr inbounds i8, i8 addrspace(4)* %3680, i64 5
  %3717 = load i8, i8 addrspace(4)* %3716, align 1, !tbaa !8
  %3718 = zext i8 %3717 to i64
  %3719 = shl nuw nsw i64 %3718, 40
  %3720 = or i64 %3715, %3719
  %3721 = getelementptr inbounds i8, i8 addrspace(4)* %3680, i64 6
  %3722 = load i8, i8 addrspace(4)* %3721, align 1, !tbaa !8
  %3723 = zext i8 %3722 to i64
  %3724 = shl nuw nsw i64 %3723, 48
  %3725 = or i64 %3720, %3724
  %3726 = getelementptr inbounds i8, i8 addrspace(4)* %3680, i64 7
  %3727 = load i8, i8 addrspace(4)* %3726, align 1, !tbaa !8
  %3728 = zext i8 %3727 to i64
  %3729 = shl nuw i64 %3728, 56
  %3730 = or i64 %3725, %3729
  %3731 = add nsw i32 %3688, -8
  %3732 = getelementptr inbounds i8, i8 addrspace(4)* %3680, i64 8
  br label %3746

3733:                                             ; preds = %3691, %3733
  %3734 = phi i32 [ %3744, %3733 ], [ 0, %3691 ]
  %3735 = phi i64 [ %3743, %3733 ], [ 0, %3691 ]
  %3736 = zext i32 %3734 to i64
  %3737 = getelementptr inbounds i8, i8 addrspace(4)* %3680, i64 %3736
  %3738 = load i8, i8 addrspace(4)* %3737, align 1, !tbaa !8
  %3739 = zext i8 %3738 to i64
  %3740 = shl i32 %3734, 3
  %3741 = zext i32 %3740 to i64
  %3742 = shl nuw i64 %3739, %3741
  %3743 = or i64 %3742, %3735
  %3744 = add nuw nsw i32 %3734, 1
  %3745 = icmp eq i32 %3744, %3688
  br i1 %3745, label %3746, label %3733, !llvm.loop !9

3746:                                             ; preds = %3733, %3693, %3691
  %3747 = phi i8 addrspace(4)* [ %3732, %3693 ], [ %3680, %3691 ], [ %3680, %3733 ]
  %3748 = phi i32 [ %3731, %3693 ], [ 0, %3691 ], [ 0, %3733 ]
  %3749 = phi i64 [ %3730, %3693 ], [ 0, %3691 ], [ %3743, %3733 ]
  %3750 = icmp ugt i32 %3748, 7
  br i1 %3750, label %3753, label %3751

3751:                                             ; preds = %3746
  %3752 = icmp eq i32 %3748, 0
  br i1 %3752, label %3806, label %3793

3753:                                             ; preds = %3746
  %3754 = load i8, i8 addrspace(4)* %3747, align 1, !tbaa !8
  %3755 = zext i8 %3754 to i64
  %3756 = getelementptr inbounds i8, i8 addrspace(4)* %3747, i64 1
  %3757 = load i8, i8 addrspace(4)* %3756, align 1, !tbaa !8
  %3758 = zext i8 %3757 to i64
  %3759 = shl nuw nsw i64 %3758, 8
  %3760 = or i64 %3759, %3755
  %3761 = getelementptr inbounds i8, i8 addrspace(4)* %3747, i64 2
  %3762 = load i8, i8 addrspace(4)* %3761, align 1, !tbaa !8
  %3763 = zext i8 %3762 to i64
  %3764 = shl nuw nsw i64 %3763, 16
  %3765 = or i64 %3760, %3764
  %3766 = getelementptr inbounds i8, i8 addrspace(4)* %3747, i64 3
  %3767 = load i8, i8 addrspace(4)* %3766, align 1, !tbaa !8
  %3768 = zext i8 %3767 to i64
  %3769 = shl nuw nsw i64 %3768, 24
  %3770 = or i64 %3765, %3769
  %3771 = getelementptr inbounds i8, i8 addrspace(4)* %3747, i64 4
  %3772 = load i8, i8 addrspace(4)* %3771, align 1, !tbaa !8
  %3773 = zext i8 %3772 to i64
  %3774 = shl nuw nsw i64 %3773, 32
  %3775 = or i64 %3770, %3774
  %3776 = getelementptr inbounds i8, i8 addrspace(4)* %3747, i64 5
  %3777 = load i8, i8 addrspace(4)* %3776, align 1, !tbaa !8
  %3778 = zext i8 %3777 to i64
  %3779 = shl nuw nsw i64 %3778, 40
  %3780 = or i64 %3775, %3779
  %3781 = getelementptr inbounds i8, i8 addrspace(4)* %3747, i64 6
  %3782 = load i8, i8 addrspace(4)* %3781, align 1, !tbaa !8
  %3783 = zext i8 %3782 to i64
  %3784 = shl nuw nsw i64 %3783, 48
  %3785 = or i64 %3780, %3784
  %3786 = getelementptr inbounds i8, i8 addrspace(4)* %3747, i64 7
  %3787 = load i8, i8 addrspace(4)* %3786, align 1, !tbaa !8
  %3788 = zext i8 %3787 to i64
  %3789 = shl nuw i64 %3788, 56
  %3790 = or i64 %3785, %3789
  %3791 = add nsw i32 %3748, -8
  %3792 = getelementptr inbounds i8, i8 addrspace(4)* %3747, i64 8
  br label %3806

3793:                                             ; preds = %3751, %3793
  %3794 = phi i32 [ %3804, %3793 ], [ 0, %3751 ]
  %3795 = phi i64 [ %3803, %3793 ], [ 0, %3751 ]
  %3796 = zext i32 %3794 to i64
  %3797 = getelementptr inbounds i8, i8 addrspace(4)* %3747, i64 %3796
  %3798 = load i8, i8 addrspace(4)* %3797, align 1, !tbaa !8
  %3799 = zext i8 %3798 to i64
  %3800 = shl i32 %3794, 3
  %3801 = zext i32 %3800 to i64
  %3802 = shl nuw i64 %3799, %3801
  %3803 = or i64 %3802, %3795
  %3804 = add nuw nsw i32 %3794, 1
  %3805 = icmp eq i32 %3804, %3748
  br i1 %3805, label %3806, label %3793

3806:                                             ; preds = %3793, %3753, %3751
  %3807 = phi i8 addrspace(4)* [ %3792, %3753 ], [ %3747, %3751 ], [ %3747, %3793 ]
  %3808 = phi i32 [ %3791, %3753 ], [ 0, %3751 ], [ 0, %3793 ]
  %3809 = phi i64 [ %3790, %3753 ], [ 0, %3751 ], [ %3803, %3793 ]
  %3810 = icmp ugt i32 %3808, 7
  br i1 %3810, label %3813, label %3811

3811:                                             ; preds = %3806
  %3812 = icmp eq i32 %3808, 0
  br i1 %3812, label %3866, label %3853

3813:                                             ; preds = %3806
  %3814 = load i8, i8 addrspace(4)* %3807, align 1, !tbaa !8
  %3815 = zext i8 %3814 to i64
  %3816 = getelementptr inbounds i8, i8 addrspace(4)* %3807, i64 1
  %3817 = load i8, i8 addrspace(4)* %3816, align 1, !tbaa !8
  %3818 = zext i8 %3817 to i64
  %3819 = shl nuw nsw i64 %3818, 8
  %3820 = or i64 %3819, %3815
  %3821 = getelementptr inbounds i8, i8 addrspace(4)* %3807, i64 2
  %3822 = load i8, i8 addrspace(4)* %3821, align 1, !tbaa !8
  %3823 = zext i8 %3822 to i64
  %3824 = shl nuw nsw i64 %3823, 16
  %3825 = or i64 %3820, %3824
  %3826 = getelementptr inbounds i8, i8 addrspace(4)* %3807, i64 3
  %3827 = load i8, i8 addrspace(4)* %3826, align 1, !tbaa !8
  %3828 = zext i8 %3827 to i64
  %3829 = shl nuw nsw i64 %3828, 24
  %3830 = or i64 %3825, %3829
  %3831 = getelementptr inbounds i8, i8 addrspace(4)* %3807, i64 4
  %3832 = load i8, i8 addrspace(4)* %3831, align 1, !tbaa !8
  %3833 = zext i8 %3832 to i64
  %3834 = shl nuw nsw i64 %3833, 32
  %3835 = or i64 %3830, %3834
  %3836 = getelementptr inbounds i8, i8 addrspace(4)* %3807, i64 5
  %3837 = load i8, i8 addrspace(4)* %3836, align 1, !tbaa !8
  %3838 = zext i8 %3837 to i64
  %3839 = shl nuw nsw i64 %3838, 40
  %3840 = or i64 %3835, %3839
  %3841 = getelementptr inbounds i8, i8 addrspace(4)* %3807, i64 6
  %3842 = load i8, i8 addrspace(4)* %3841, align 1, !tbaa !8
  %3843 = zext i8 %3842 to i64
  %3844 = shl nuw nsw i64 %3843, 48
  %3845 = or i64 %3840, %3844
  %3846 = getelementptr inbounds i8, i8 addrspace(4)* %3807, i64 7
  %3847 = load i8, i8 addrspace(4)* %3846, align 1, !tbaa !8
  %3848 = zext i8 %3847 to i64
  %3849 = shl nuw i64 %3848, 56
  %3850 = or i64 %3845, %3849
  %3851 = add nsw i32 %3808, -8
  %3852 = getelementptr inbounds i8, i8 addrspace(4)* %3807, i64 8
  br label %3866

3853:                                             ; preds = %3811, %3853
  %3854 = phi i32 [ %3864, %3853 ], [ 0, %3811 ]
  %3855 = phi i64 [ %3863, %3853 ], [ 0, %3811 ]
  %3856 = zext i32 %3854 to i64
  %3857 = getelementptr inbounds i8, i8 addrspace(4)* %3807, i64 %3856
  %3858 = load i8, i8 addrspace(4)* %3857, align 1, !tbaa !8
  %3859 = zext i8 %3858 to i64
  %3860 = shl i32 %3854, 3
  %3861 = zext i32 %3860 to i64
  %3862 = shl nuw i64 %3859, %3861
  %3863 = or i64 %3862, %3855
  %3864 = add nuw nsw i32 %3854, 1
  %3865 = icmp eq i32 %3864, %3808
  br i1 %3865, label %3866, label %3853

3866:                                             ; preds = %3853, %3813, %3811
  %3867 = phi i8 addrspace(4)* [ %3852, %3813 ], [ %3807, %3811 ], [ %3807, %3853 ]
  %3868 = phi i32 [ %3851, %3813 ], [ 0, %3811 ], [ 0, %3853 ]
  %3869 = phi i64 [ %3850, %3813 ], [ 0, %3811 ], [ %3863, %3853 ]
  %3870 = icmp ugt i32 %3868, 7
  br i1 %3870, label %3873, label %3871

3871:                                             ; preds = %3866
  %3872 = icmp eq i32 %3868, 0
  br i1 %3872, label %3926, label %3913

3873:                                             ; preds = %3866
  %3874 = load i8, i8 addrspace(4)* %3867, align 1, !tbaa !8
  %3875 = zext i8 %3874 to i64
  %3876 = getelementptr inbounds i8, i8 addrspace(4)* %3867, i64 1
  %3877 = load i8, i8 addrspace(4)* %3876, align 1, !tbaa !8
  %3878 = zext i8 %3877 to i64
  %3879 = shl nuw nsw i64 %3878, 8
  %3880 = or i64 %3879, %3875
  %3881 = getelementptr inbounds i8, i8 addrspace(4)* %3867, i64 2
  %3882 = load i8, i8 addrspace(4)* %3881, align 1, !tbaa !8
  %3883 = zext i8 %3882 to i64
  %3884 = shl nuw nsw i64 %3883, 16
  %3885 = or i64 %3880, %3884
  %3886 = getelementptr inbounds i8, i8 addrspace(4)* %3867, i64 3
  %3887 = load i8, i8 addrspace(4)* %3886, align 1, !tbaa !8
  %3888 = zext i8 %3887 to i64
  %3889 = shl nuw nsw i64 %3888, 24
  %3890 = or i64 %3885, %3889
  %3891 = getelementptr inbounds i8, i8 addrspace(4)* %3867, i64 4
  %3892 = load i8, i8 addrspace(4)* %3891, align 1, !tbaa !8
  %3893 = zext i8 %3892 to i64
  %3894 = shl nuw nsw i64 %3893, 32
  %3895 = or i64 %3890, %3894
  %3896 = getelementptr inbounds i8, i8 addrspace(4)* %3867, i64 5
  %3897 = load i8, i8 addrspace(4)* %3896, align 1, !tbaa !8
  %3898 = zext i8 %3897 to i64
  %3899 = shl nuw nsw i64 %3898, 40
  %3900 = or i64 %3895, %3899
  %3901 = getelementptr inbounds i8, i8 addrspace(4)* %3867, i64 6
  %3902 = load i8, i8 addrspace(4)* %3901, align 1, !tbaa !8
  %3903 = zext i8 %3902 to i64
  %3904 = shl nuw nsw i64 %3903, 48
  %3905 = or i64 %3900, %3904
  %3906 = getelementptr inbounds i8, i8 addrspace(4)* %3867, i64 7
  %3907 = load i8, i8 addrspace(4)* %3906, align 1, !tbaa !8
  %3908 = zext i8 %3907 to i64
  %3909 = shl nuw i64 %3908, 56
  %3910 = or i64 %3905, %3909
  %3911 = add nsw i32 %3868, -8
  %3912 = getelementptr inbounds i8, i8 addrspace(4)* %3867, i64 8
  br label %3926

3913:                                             ; preds = %3871, %3913
  %3914 = phi i32 [ %3924, %3913 ], [ 0, %3871 ]
  %3915 = phi i64 [ %3923, %3913 ], [ 0, %3871 ]
  %3916 = zext i32 %3914 to i64
  %3917 = getelementptr inbounds i8, i8 addrspace(4)* %3867, i64 %3916
  %3918 = load i8, i8 addrspace(4)* %3917, align 1, !tbaa !8
  %3919 = zext i8 %3918 to i64
  %3920 = shl i32 %3914, 3
  %3921 = zext i32 %3920 to i64
  %3922 = shl nuw i64 %3919, %3921
  %3923 = or i64 %3922, %3915
  %3924 = add nuw nsw i32 %3914, 1
  %3925 = icmp eq i32 %3924, %3868
  br i1 %3925, label %3926, label %3913

3926:                                             ; preds = %3913, %3873, %3871
  %3927 = phi i8 addrspace(4)* [ %3912, %3873 ], [ %3867, %3871 ], [ %3867, %3913 ]
  %3928 = phi i32 [ %3911, %3873 ], [ 0, %3871 ], [ 0, %3913 ]
  %3929 = phi i64 [ %3910, %3873 ], [ 0, %3871 ], [ %3923, %3913 ]
  %3930 = icmp ugt i32 %3928, 7
  br i1 %3930, label %3933, label %3931

3931:                                             ; preds = %3926
  %3932 = icmp eq i32 %3928, 0
  br i1 %3932, label %3986, label %3973

3933:                                             ; preds = %3926
  %3934 = load i8, i8 addrspace(4)* %3927, align 1, !tbaa !8
  %3935 = zext i8 %3934 to i64
  %3936 = getelementptr inbounds i8, i8 addrspace(4)* %3927, i64 1
  %3937 = load i8, i8 addrspace(4)* %3936, align 1, !tbaa !8
  %3938 = zext i8 %3937 to i64
  %3939 = shl nuw nsw i64 %3938, 8
  %3940 = or i64 %3939, %3935
  %3941 = getelementptr inbounds i8, i8 addrspace(4)* %3927, i64 2
  %3942 = load i8, i8 addrspace(4)* %3941, align 1, !tbaa !8
  %3943 = zext i8 %3942 to i64
  %3944 = shl nuw nsw i64 %3943, 16
  %3945 = or i64 %3940, %3944
  %3946 = getelementptr inbounds i8, i8 addrspace(4)* %3927, i64 3
  %3947 = load i8, i8 addrspace(4)* %3946, align 1, !tbaa !8
  %3948 = zext i8 %3947 to i64
  %3949 = shl nuw nsw i64 %3948, 24
  %3950 = or i64 %3945, %3949
  %3951 = getelementptr inbounds i8, i8 addrspace(4)* %3927, i64 4
  %3952 = load i8, i8 addrspace(4)* %3951, align 1, !tbaa !8
  %3953 = zext i8 %3952 to i64
  %3954 = shl nuw nsw i64 %3953, 32
  %3955 = or i64 %3950, %3954
  %3956 = getelementptr inbounds i8, i8 addrspace(4)* %3927, i64 5
  %3957 = load i8, i8 addrspace(4)* %3956, align 1, !tbaa !8
  %3958 = zext i8 %3957 to i64
  %3959 = shl nuw nsw i64 %3958, 40
  %3960 = or i64 %3955, %3959
  %3961 = getelementptr inbounds i8, i8 addrspace(4)* %3927, i64 6
  %3962 = load i8, i8 addrspace(4)* %3961, align 1, !tbaa !8
  %3963 = zext i8 %3962 to i64
  %3964 = shl nuw nsw i64 %3963, 48
  %3965 = or i64 %3960, %3964
  %3966 = getelementptr inbounds i8, i8 addrspace(4)* %3927, i64 7
  %3967 = load i8, i8 addrspace(4)* %3966, align 1, !tbaa !8
  %3968 = zext i8 %3967 to i64
  %3969 = shl nuw i64 %3968, 56
  %3970 = or i64 %3965, %3969
  %3971 = add nsw i32 %3928, -8
  %3972 = getelementptr inbounds i8, i8 addrspace(4)* %3927, i64 8
  br label %3986

3973:                                             ; preds = %3931, %3973
  %3974 = phi i32 [ %3984, %3973 ], [ 0, %3931 ]
  %3975 = phi i64 [ %3983, %3973 ], [ 0, %3931 ]
  %3976 = zext i32 %3974 to i64
  %3977 = getelementptr inbounds i8, i8 addrspace(4)* %3927, i64 %3976
  %3978 = load i8, i8 addrspace(4)* %3977, align 1, !tbaa !8
  %3979 = zext i8 %3978 to i64
  %3980 = shl i32 %3974, 3
  %3981 = zext i32 %3980 to i64
  %3982 = shl nuw i64 %3979, %3981
  %3983 = or i64 %3982, %3975
  %3984 = add nuw nsw i32 %3974, 1
  %3985 = icmp eq i32 %3984, %3928
  br i1 %3985, label %3986, label %3973

3986:                                             ; preds = %3973, %3933, %3931
  %3987 = phi i8 addrspace(4)* [ %3972, %3933 ], [ %3927, %3931 ], [ %3927, %3973 ]
  %3988 = phi i32 [ %3971, %3933 ], [ 0, %3931 ], [ 0, %3973 ]
  %3989 = phi i64 [ %3970, %3933 ], [ 0, %3931 ], [ %3983, %3973 ]
  %3990 = icmp ugt i32 %3988, 7
  br i1 %3990, label %3993, label %3991

3991:                                             ; preds = %3986
  %3992 = icmp eq i32 %3988, 0
  br i1 %3992, label %4046, label %4033

3993:                                             ; preds = %3986
  %3994 = load i8, i8 addrspace(4)* %3987, align 1, !tbaa !8
  %3995 = zext i8 %3994 to i64
  %3996 = getelementptr inbounds i8, i8 addrspace(4)* %3987, i64 1
  %3997 = load i8, i8 addrspace(4)* %3996, align 1, !tbaa !8
  %3998 = zext i8 %3997 to i64
  %3999 = shl nuw nsw i64 %3998, 8
  %4000 = or i64 %3999, %3995
  %4001 = getelementptr inbounds i8, i8 addrspace(4)* %3987, i64 2
  %4002 = load i8, i8 addrspace(4)* %4001, align 1, !tbaa !8
  %4003 = zext i8 %4002 to i64
  %4004 = shl nuw nsw i64 %4003, 16
  %4005 = or i64 %4000, %4004
  %4006 = getelementptr inbounds i8, i8 addrspace(4)* %3987, i64 3
  %4007 = load i8, i8 addrspace(4)* %4006, align 1, !tbaa !8
  %4008 = zext i8 %4007 to i64
  %4009 = shl nuw nsw i64 %4008, 24
  %4010 = or i64 %4005, %4009
  %4011 = getelementptr inbounds i8, i8 addrspace(4)* %3987, i64 4
  %4012 = load i8, i8 addrspace(4)* %4011, align 1, !tbaa !8
  %4013 = zext i8 %4012 to i64
  %4014 = shl nuw nsw i64 %4013, 32
  %4015 = or i64 %4010, %4014
  %4016 = getelementptr inbounds i8, i8 addrspace(4)* %3987, i64 5
  %4017 = load i8, i8 addrspace(4)* %4016, align 1, !tbaa !8
  %4018 = zext i8 %4017 to i64
  %4019 = shl nuw nsw i64 %4018, 40
  %4020 = or i64 %4015, %4019
  %4021 = getelementptr inbounds i8, i8 addrspace(4)* %3987, i64 6
  %4022 = load i8, i8 addrspace(4)* %4021, align 1, !tbaa !8
  %4023 = zext i8 %4022 to i64
  %4024 = shl nuw nsw i64 %4023, 48
  %4025 = or i64 %4020, %4024
  %4026 = getelementptr inbounds i8, i8 addrspace(4)* %3987, i64 7
  %4027 = load i8, i8 addrspace(4)* %4026, align 1, !tbaa !8
  %4028 = zext i8 %4027 to i64
  %4029 = shl nuw i64 %4028, 56
  %4030 = or i64 %4025, %4029
  %4031 = add nsw i32 %3988, -8
  %4032 = getelementptr inbounds i8, i8 addrspace(4)* %3987, i64 8
  br label %4046

4033:                                             ; preds = %3991, %4033
  %4034 = phi i32 [ %4044, %4033 ], [ 0, %3991 ]
  %4035 = phi i64 [ %4043, %4033 ], [ 0, %3991 ]
  %4036 = zext i32 %4034 to i64
  %4037 = getelementptr inbounds i8, i8 addrspace(4)* %3987, i64 %4036
  %4038 = load i8, i8 addrspace(4)* %4037, align 1, !tbaa !8
  %4039 = zext i8 %4038 to i64
  %4040 = shl i32 %4034, 3
  %4041 = zext i32 %4040 to i64
  %4042 = shl nuw i64 %4039, %4041
  %4043 = or i64 %4042, %4035
  %4044 = add nuw nsw i32 %4034, 1
  %4045 = icmp eq i32 %4044, %3988
  br i1 %4045, label %4046, label %4033

4046:                                             ; preds = %4033, %3993, %3991
  %4047 = phi i8 addrspace(4)* [ %4032, %3993 ], [ %3987, %3991 ], [ %3987, %4033 ]
  %4048 = phi i32 [ %4031, %3993 ], [ 0, %3991 ], [ 0, %4033 ]
  %4049 = phi i64 [ %4030, %3993 ], [ 0, %3991 ], [ %4043, %4033 ]
  %4050 = icmp ugt i32 %4048, 7
  br i1 %4050, label %4053, label %4051

4051:                                             ; preds = %4046
  %4052 = icmp eq i32 %4048, 0
  br i1 %4052, label %4104, label %4091

4053:                                             ; preds = %4046
  %4054 = load i8, i8 addrspace(4)* %4047, align 1, !tbaa !8
  %4055 = zext i8 %4054 to i64
  %4056 = getelementptr inbounds i8, i8 addrspace(4)* %4047, i64 1
  %4057 = load i8, i8 addrspace(4)* %4056, align 1, !tbaa !8
  %4058 = zext i8 %4057 to i64
  %4059 = shl nuw nsw i64 %4058, 8
  %4060 = or i64 %4059, %4055
  %4061 = getelementptr inbounds i8, i8 addrspace(4)* %4047, i64 2
  %4062 = load i8, i8 addrspace(4)* %4061, align 1, !tbaa !8
  %4063 = zext i8 %4062 to i64
  %4064 = shl nuw nsw i64 %4063, 16
  %4065 = or i64 %4060, %4064
  %4066 = getelementptr inbounds i8, i8 addrspace(4)* %4047, i64 3
  %4067 = load i8, i8 addrspace(4)* %4066, align 1, !tbaa !8
  %4068 = zext i8 %4067 to i64
  %4069 = shl nuw nsw i64 %4068, 24
  %4070 = or i64 %4065, %4069
  %4071 = getelementptr inbounds i8, i8 addrspace(4)* %4047, i64 4
  %4072 = load i8, i8 addrspace(4)* %4071, align 1, !tbaa !8
  %4073 = zext i8 %4072 to i64
  %4074 = shl nuw nsw i64 %4073, 32
  %4075 = or i64 %4070, %4074
  %4076 = getelementptr inbounds i8, i8 addrspace(4)* %4047, i64 5
  %4077 = load i8, i8 addrspace(4)* %4076, align 1, !tbaa !8
  %4078 = zext i8 %4077 to i64
  %4079 = shl nuw nsw i64 %4078, 40
  %4080 = or i64 %4075, %4079
  %4081 = getelementptr inbounds i8, i8 addrspace(4)* %4047, i64 6
  %4082 = load i8, i8 addrspace(4)* %4081, align 1, !tbaa !8
  %4083 = zext i8 %4082 to i64
  %4084 = shl nuw nsw i64 %4083, 48
  %4085 = or i64 %4080, %4084
  %4086 = getelementptr inbounds i8, i8 addrspace(4)* %4047, i64 7
  %4087 = load i8, i8 addrspace(4)* %4086, align 1, !tbaa !8
  %4088 = zext i8 %4087 to i64
  %4089 = shl nuw i64 %4088, 56
  %4090 = or i64 %4085, %4089
  br label %4104

4091:                                             ; preds = %4051, %4091
  %4092 = phi i32 [ %4102, %4091 ], [ 0, %4051 ]
  %4093 = phi i64 [ %4101, %4091 ], [ 0, %4051 ]
  %4094 = zext i32 %4092 to i64
  %4095 = getelementptr inbounds i8, i8 addrspace(4)* %4047, i64 %4094
  %4096 = load i8, i8 addrspace(4)* %4095, align 1, !tbaa !8
  %4097 = zext i8 %4096 to i64
  %4098 = shl i32 %4092, 3
  %4099 = zext i32 %4098 to i64
  %4100 = shl nuw i64 %4097, %4099
  %4101 = or i64 %4100, %4093
  %4102 = add nuw nsw i32 %4092, 1
  %4103 = icmp eq i32 %4102, %4048
  br i1 %4103, label %4104, label %4091

4104:                                             ; preds = %4091, %4053, %4051
  %4105 = phi i64 [ %4090, %4053 ], [ 0, %4051 ], [ %4101, %4091 ]
  %4106 = shl nuw nsw i64 %3687, 2
  %4107 = add nuw nsw i64 %4106, 28
  %4108 = and i64 %4107, 480
  %4109 = and i64 %3689, -225
  %4110 = or i64 %4109, %4108
  %4111 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %4110, i64 noundef %3749, i64 noundef %3809, i64 noundef %3869, i64 noundef %3929, i64 noundef %3989, i64 noundef %4049, i64 noundef %4105) #10
  %4112 = sub i64 %3679, %3687
  %4113 = getelementptr inbounds i8, i8 addrspace(4)* %3680, i64 %3687
  %4114 = icmp eq i64 %4112, 0
  br i1 %4114, label %4115, label %3678

4115:                                             ; preds = %4104, %3670
  %4116 = phi <2 x i64> [ %3673, %3670 ], [ %4111, %4104 ]
  %4117 = extractelement <2 x i64> %4116, i64 0
  %4118 = and i64 %4117, -227
  %4119 = or i64 %4118, 34
  %4120 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %17, i64 noundef %4119, i64 noundef %3667, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #2

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) unnamed_addr #3 {
  %10 = alloca i8*, align 8, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca i64, align 8, addrspace(5)
  %13 = alloca i64, align 8, addrspace(5)
  %14 = alloca i64, align 8, addrspace(5)
  %15 = alloca i64, align 8, addrspace(5)
  %16 = alloca i64, align 8, addrspace(5)
  %17 = alloca i64, align 8, addrspace(5)
  %18 = alloca i64, align 8, addrspace(5)
  %19 = alloca i64, align 8, addrspace(5)
  %20 = alloca i32, align 4, addrspace(5)
  %21 = alloca i32, align 4, addrspace(5)
  %22 = alloca %0 addrspace(1)*, align 8, addrspace(5)
  %23 = alloca i64, align 8, addrspace(5)
  %24 = alloca %1 addrspace(1)*, align 8, addrspace(5)
  %25 = alloca %2 addrspace(1)*, align 8, addrspace(5)
  %26 = alloca <2 x i64>, align 16, addrspace(5)
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !15
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !17
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !4
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !4
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !4
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !4
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !4
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !4
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !4
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !4
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !17
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !17
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !19
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !17
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !17
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !17
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !15
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !15
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !15
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !17
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !17
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !20
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !23
  %50 = and i64 %49, %45
  %51 = getelementptr inbounds %1, %1 addrspace(1)* %48, i64 %50, i32 0
  %52 = load atomic i64, i64 addrspace(1)* %51 syncscope("one-as") monotonic, align 8
  %53 = cmpxchg i64 addrspace(1)* %44, i64 %45, i64 %52 syncscope("one-as") acquire monotonic, align 8
  %54 = extractvalue { i64, i1 } %53, 1
  br i1 %54, label %65, label %55

55:                                               ; preds = %55, %43
  %56 = phi { i64, i1 } [ %63, %55 ], [ %53, %43 ]
  %57 = extractvalue { i64, i1 } %56, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !20
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !23
  %60 = and i64 %59, %57
  %61 = getelementptr inbounds %1, %1 addrspace(1)* %58, i64 %60, i32 0
  %62 = load atomic i64, i64 addrspace(1)* %61 syncscope("one-as") monotonic, align 8
  %63 = cmpxchg i64 addrspace(1)* %44, i64 %57, i64 %62 syncscope("one-as") acquire monotonic, align 8
  %64 = extractvalue { i64, i1 } %63, 1
  br i1 %64, label %65, label %55

65:                                               ; preds = %55, %43
  %66 = phi { i64, i1 } [ %53, %43 ], [ %63, %55 ]
  %67 = extractvalue { i64, i1 } %66, 0
  br label %68

68:                                               ; preds = %9, %65
  %69 = phi i64 [ %67, %65 ], [ 0, %9 ]
  %70 = trunc i64 %69 to i32
  %71 = lshr i64 %69, 32
  %72 = trunc i64 %71 to i32
  %73 = call i32 @llvm.amdgcn.readfirstlane(i32 %70)
  %74 = call i32 @llvm.amdgcn.readfirstlane(i32 %72)
  %75 = zext i32 %74 to i64
  %76 = shl nuw i64 %75, 32
  %77 = zext i32 %73 to i64
  %78 = or i64 %76, %77
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !4
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !15
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !20
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !23
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !15
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !15
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !24
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !23
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !15
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !15
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !15
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !17
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !4
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !4
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !4
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !4
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !4
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !4
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !4
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !4
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !17
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !17
  %110 = call i64 @llvm.read_register.i64(metadata !25) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !26
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !28
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !29
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !4
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !4
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !4
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !4
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !4
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !4
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !4
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !4
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !15
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !17
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !17
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !20
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !23
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !30
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !30
  %145 = cmpxchg i64 addrspace(1)* %132, i64 %144, i64 %127 syncscope("one-as") release monotonic, align 8
  %146 = extractvalue { i64, i1 } %145, 1
  br i1 %146, label %147, label %142

147:                                              ; preds = %142, %131
  %148 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 2, i32 0
  %149 = load i64, i64 addrspace(1)* %148, align 8
  %150 = inttoptr i64 %149 to %4 addrspace(1)*
  %151 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 1, i32 0
  %152 = atomicrmw add i64 addrspace(1)* %151, i64 1 syncscope("one-as") release, align 8
  %153 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 2
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !31
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !33
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !15
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !15
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !17
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !17
  %169 = icmp eq i32 %167, %168
  %170 = getelementptr inbounds %1, %1 addrspace(1)* %165, i64 0, i32 3
  br label %171

171:                                              ; preds = %179, %163
  br i1 %169, label %172, label %175

172:                                              ; preds = %171
  %173 = load atomic i32, i32 addrspace(1)* %170 syncscope("one-as") acquire, align 4
  %174 = and i32 %173, 1
  br label %175

175:                                              ; preds = %172, %171
  %176 = phi i32 [ %174, %172 ], [ 1, %171 ]
  %177 = call i32 @llvm.amdgcn.readfirstlane(i32 %176)
  %178 = icmp eq i32 %177, 0
  br i1 %178, label %180, label %179

179:                                              ; preds = %175
  call void @llvm.amdgcn.s.sleep(i32 1)
  br label %171

180:                                              ; preds = %175
  %181 = zext i32 %167 to i64
  %182 = getelementptr inbounds %2, %2 addrspace(1)* %166, i64 0, i32 0, i64 %181, i64 0
  %183 = getelementptr inbounds %2, %2 addrspace(1)* %166, i64 0, i32 0, i64 %181, i64 1
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !4
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !4
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !8
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !15
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !17
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !17
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !23
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !20
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !30
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !30
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !8
  %215 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %215) #6
  %216 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %216) #6
  %217 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %217) #6
  %218 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %218) #6
  %219 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %219) #6
  %220 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %220) #6
  %221 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %221) #6
  ret <2 x i64> %214
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #4

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #5

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #6

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #7

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #8

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #8

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #9

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #4 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #5 = { mustprogress nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { nofree nounwind readonly }
attributes #8 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #9 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #10 = { convergent nounwind }
attributes #11 = { convergent }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!6, !6, i64 0}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C++ TBAA"}
!15 = !{!16, !16, i64 0}
!16 = !{!"any pointer", !6, i64 0}
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !6, i64 0}
!19 = !{i64 2662}
!20 = !{!21, !16, i64 0}
!21 = !{!"", !16, i64 0, !16, i64 8, !22, i64 16, !5, i64 24, !5, i64 32, !5, i64 40}
!22 = !{!"hsa_signal_s", !5, i64 0}
!23 = !{!21, !5, i64 40}
!24 = !{!21, !16, i64 8}
!25 = !{!"exec"}
!26 = !{!27, !18, i64 16}
!27 = !{!"", !5, i64 0, !5, i64 8, !18, i64 16, !18, i64 20}
!28 = !{!27, !5, i64 8}
!29 = !{!27, !18, i64 20}
!30 = !{!27, !5, i64 0}
!31 = !{!32, !5, i64 16}
!32 = !{!"amd_signal_s", !5, i64 0, !6, i64 8, !5, i64 16, !18, i64 24, !18, i64 28, !5, i64 32, !5, i64 40, !6, i64 48, !6, i64 56}
!33 = !{!32, !18, i64 24}
