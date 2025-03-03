; ModuleID = '../data/hip_kernels/8510/10/main.cu'
source_filename = "../data/hip_kernels/8510/10/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [34 x i8] c"CUDA KERNEL ADD %ld + %ld = %ld \0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z3addiPlS_S_(i32 %0, i64 addrspace(1)* nocapture readonly %1, i64 addrspace(1)* nocapture readonly %2, i64 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #1 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %0
  br i1 %14, label %15, label %492

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %16
  %18 = load i64, i64 addrspace(1)* %17, align 8, !tbaa !7, !amdgpu.noclobber !5
  %19 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %16
  %20 = load i64, i64 addrspace(1)* %19, align 8, !tbaa !7, !amdgpu.noclobber !5
  %21 = add nsw i64 %20, %18
  %22 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %16
  store i64 %21, i64 addrspace(1)* %22, align 8, !tbaa !7
  %23 = load i64, i64 addrspace(1)* %17, align 8, !tbaa !7
  %24 = load i64, i64 addrspace(1)* %19, align 8, !tbaa !7
  %25 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %26 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 24
  %27 = bitcast i8 addrspace(4)* %26 to i64 addrspace(4)*
  %28 = load i64, i64 addrspace(4)* %27, align 8, !tbaa !11
  %29 = inttoptr i64 %28 to i8 addrspace(1)*
  %30 = addrspacecast i8 addrspace(1)* %29 to i8*
  %31 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %30, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %32 = extractelement <2 x i64> %31, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([34 x i8], [34 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %33, label %37

33:                                               ; preds = %15
  %34 = and i64 %32, -225
  %35 = or i64 %34, 32
  %36 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %30, i64 noundef %35, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %478

37:                                               ; preds = %15
  %38 = and i64 %32, 2
  %39 = and i64 %32, -3
  %40 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %39, i64 0
  br label %41

41:                                               ; preds = %467, %37
  %42 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([34 x i8], [34 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([34 x i8], [34 x i8] addrspace(4)* @.str, i64 0, i64 33) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([34 x i8]* addrspacecast ([34 x i8] addrspace(4)* @.str to [34 x i8]*) to i64)), i64 1))), %37 ], [ %475, %467 ]
  %43 = phi i8 addrspace(4)* [ getelementptr inbounds ([34 x i8], [34 x i8] addrspace(4)* @.str, i64 0, i64 0), %37 ], [ %476, %467 ]
  %44 = phi <2 x i64> [ %40, %37 ], [ %474, %467 ]
  %45 = icmp ugt i64 %42, 56
  %46 = extractelement <2 x i64> %44, i64 0
  %47 = or i64 %46, %38
  %48 = insertelement <2 x i64> poison, i64 %47, i64 0
  %49 = select i1 %45, <2 x i64> %44, <2 x i64> %48
  %50 = tail call i64 @llvm.umin.i64(i64 %42, i64 56)
  %51 = trunc i64 %50 to i32
  %52 = extractelement <2 x i64> %49, i64 0
  %53 = icmp ugt i32 %51, 7
  br i1 %53, label %56, label %54

54:                                               ; preds = %41
  %55 = icmp eq i32 %51, 0
  br i1 %55, label %109, label %96

56:                                               ; preds = %41
  %57 = load i8, i8 addrspace(4)* %43, align 1, !tbaa !15
  %58 = zext i8 %57 to i64
  %59 = getelementptr inbounds i8, i8 addrspace(4)* %43, i64 1
  %60 = load i8, i8 addrspace(4)* %59, align 1, !tbaa !15
  %61 = zext i8 %60 to i64
  %62 = shl nuw nsw i64 %61, 8
  %63 = or i64 %62, %58
  %64 = getelementptr inbounds i8, i8 addrspace(4)* %43, i64 2
  %65 = load i8, i8 addrspace(4)* %64, align 1, !tbaa !15
  %66 = zext i8 %65 to i64
  %67 = shl nuw nsw i64 %66, 16
  %68 = or i64 %63, %67
  %69 = getelementptr inbounds i8, i8 addrspace(4)* %43, i64 3
  %70 = load i8, i8 addrspace(4)* %69, align 1, !tbaa !15
  %71 = zext i8 %70 to i64
  %72 = shl nuw nsw i64 %71, 24
  %73 = or i64 %68, %72
  %74 = getelementptr inbounds i8, i8 addrspace(4)* %43, i64 4
  %75 = load i8, i8 addrspace(4)* %74, align 1, !tbaa !15
  %76 = zext i8 %75 to i64
  %77 = shl nuw nsw i64 %76, 32
  %78 = or i64 %73, %77
  %79 = getelementptr inbounds i8, i8 addrspace(4)* %43, i64 5
  %80 = load i8, i8 addrspace(4)* %79, align 1, !tbaa !15
  %81 = zext i8 %80 to i64
  %82 = shl nuw nsw i64 %81, 40
  %83 = or i64 %78, %82
  %84 = getelementptr inbounds i8, i8 addrspace(4)* %43, i64 6
  %85 = load i8, i8 addrspace(4)* %84, align 1, !tbaa !15
  %86 = zext i8 %85 to i64
  %87 = shl nuw nsw i64 %86, 48
  %88 = or i64 %83, %87
  %89 = getelementptr inbounds i8, i8 addrspace(4)* %43, i64 7
  %90 = load i8, i8 addrspace(4)* %89, align 1, !tbaa !15
  %91 = zext i8 %90 to i64
  %92 = shl nuw i64 %91, 56
  %93 = or i64 %88, %92
  %94 = add nsw i32 %51, -8
  %95 = getelementptr inbounds i8, i8 addrspace(4)* %43, i64 8
  br label %109

96:                                               ; preds = %54, %96
  %97 = phi i32 [ %107, %96 ], [ 0, %54 ]
  %98 = phi i64 [ %106, %96 ], [ 0, %54 ]
  %99 = zext i32 %97 to i64
  %100 = getelementptr inbounds i8, i8 addrspace(4)* %43, i64 %99
  %101 = load i8, i8 addrspace(4)* %100, align 1, !tbaa !15
  %102 = zext i8 %101 to i64
  %103 = shl i32 %97, 3
  %104 = zext i32 %103 to i64
  %105 = shl nuw i64 %102, %104
  %106 = or i64 %105, %98
  %107 = add nuw nsw i32 %97, 1
  %108 = icmp eq i32 %107, %51
  br i1 %108, label %109, label %96, !llvm.loop !16

109:                                              ; preds = %96, %56, %54
  %110 = phi i8 addrspace(4)* [ %95, %56 ], [ %43, %54 ], [ %43, %96 ]
  %111 = phi i32 [ %94, %56 ], [ 0, %54 ], [ 0, %96 ]
  %112 = phi i64 [ %93, %56 ], [ 0, %54 ], [ %106, %96 ]
  %113 = icmp ugt i32 %111, 7
  br i1 %113, label %116, label %114

114:                                              ; preds = %109
  %115 = icmp eq i32 %111, 0
  br i1 %115, label %169, label %156

116:                                              ; preds = %109
  %117 = load i8, i8 addrspace(4)* %110, align 1, !tbaa !15
  %118 = zext i8 %117 to i64
  %119 = getelementptr inbounds i8, i8 addrspace(4)* %110, i64 1
  %120 = load i8, i8 addrspace(4)* %119, align 1, !tbaa !15
  %121 = zext i8 %120 to i64
  %122 = shl nuw nsw i64 %121, 8
  %123 = or i64 %122, %118
  %124 = getelementptr inbounds i8, i8 addrspace(4)* %110, i64 2
  %125 = load i8, i8 addrspace(4)* %124, align 1, !tbaa !15
  %126 = zext i8 %125 to i64
  %127 = shl nuw nsw i64 %126, 16
  %128 = or i64 %123, %127
  %129 = getelementptr inbounds i8, i8 addrspace(4)* %110, i64 3
  %130 = load i8, i8 addrspace(4)* %129, align 1, !tbaa !15
  %131 = zext i8 %130 to i64
  %132 = shl nuw nsw i64 %131, 24
  %133 = or i64 %128, %132
  %134 = getelementptr inbounds i8, i8 addrspace(4)* %110, i64 4
  %135 = load i8, i8 addrspace(4)* %134, align 1, !tbaa !15
  %136 = zext i8 %135 to i64
  %137 = shl nuw nsw i64 %136, 32
  %138 = or i64 %133, %137
  %139 = getelementptr inbounds i8, i8 addrspace(4)* %110, i64 5
  %140 = load i8, i8 addrspace(4)* %139, align 1, !tbaa !15
  %141 = zext i8 %140 to i64
  %142 = shl nuw nsw i64 %141, 40
  %143 = or i64 %138, %142
  %144 = getelementptr inbounds i8, i8 addrspace(4)* %110, i64 6
  %145 = load i8, i8 addrspace(4)* %144, align 1, !tbaa !15
  %146 = zext i8 %145 to i64
  %147 = shl nuw nsw i64 %146, 48
  %148 = or i64 %143, %147
  %149 = getelementptr inbounds i8, i8 addrspace(4)* %110, i64 7
  %150 = load i8, i8 addrspace(4)* %149, align 1, !tbaa !15
  %151 = zext i8 %150 to i64
  %152 = shl nuw i64 %151, 56
  %153 = or i64 %148, %152
  %154 = add nsw i32 %111, -8
  %155 = getelementptr inbounds i8, i8 addrspace(4)* %110, i64 8
  br label %169

156:                                              ; preds = %114, %156
  %157 = phi i32 [ %167, %156 ], [ 0, %114 ]
  %158 = phi i64 [ %166, %156 ], [ 0, %114 ]
  %159 = zext i32 %157 to i64
  %160 = getelementptr inbounds i8, i8 addrspace(4)* %110, i64 %159
  %161 = load i8, i8 addrspace(4)* %160, align 1, !tbaa !15
  %162 = zext i8 %161 to i64
  %163 = shl i32 %157, 3
  %164 = zext i32 %163 to i64
  %165 = shl nuw i64 %162, %164
  %166 = or i64 %165, %158
  %167 = add nuw nsw i32 %157, 1
  %168 = icmp eq i32 %167, %111
  br i1 %168, label %169, label %156

169:                                              ; preds = %156, %116, %114
  %170 = phi i8 addrspace(4)* [ %155, %116 ], [ %110, %114 ], [ %110, %156 ]
  %171 = phi i32 [ %154, %116 ], [ 0, %114 ], [ 0, %156 ]
  %172 = phi i64 [ %153, %116 ], [ 0, %114 ], [ %166, %156 ]
  %173 = icmp ugt i32 %171, 7
  br i1 %173, label %176, label %174

174:                                              ; preds = %169
  %175 = icmp eq i32 %171, 0
  br i1 %175, label %229, label %216

176:                                              ; preds = %169
  %177 = load i8, i8 addrspace(4)* %170, align 1, !tbaa !15
  %178 = zext i8 %177 to i64
  %179 = getelementptr inbounds i8, i8 addrspace(4)* %170, i64 1
  %180 = load i8, i8 addrspace(4)* %179, align 1, !tbaa !15
  %181 = zext i8 %180 to i64
  %182 = shl nuw nsw i64 %181, 8
  %183 = or i64 %182, %178
  %184 = getelementptr inbounds i8, i8 addrspace(4)* %170, i64 2
  %185 = load i8, i8 addrspace(4)* %184, align 1, !tbaa !15
  %186 = zext i8 %185 to i64
  %187 = shl nuw nsw i64 %186, 16
  %188 = or i64 %183, %187
  %189 = getelementptr inbounds i8, i8 addrspace(4)* %170, i64 3
  %190 = load i8, i8 addrspace(4)* %189, align 1, !tbaa !15
  %191 = zext i8 %190 to i64
  %192 = shl nuw nsw i64 %191, 24
  %193 = or i64 %188, %192
  %194 = getelementptr inbounds i8, i8 addrspace(4)* %170, i64 4
  %195 = load i8, i8 addrspace(4)* %194, align 1, !tbaa !15
  %196 = zext i8 %195 to i64
  %197 = shl nuw nsw i64 %196, 32
  %198 = or i64 %193, %197
  %199 = getelementptr inbounds i8, i8 addrspace(4)* %170, i64 5
  %200 = load i8, i8 addrspace(4)* %199, align 1, !tbaa !15
  %201 = zext i8 %200 to i64
  %202 = shl nuw nsw i64 %201, 40
  %203 = or i64 %198, %202
  %204 = getelementptr inbounds i8, i8 addrspace(4)* %170, i64 6
  %205 = load i8, i8 addrspace(4)* %204, align 1, !tbaa !15
  %206 = zext i8 %205 to i64
  %207 = shl nuw nsw i64 %206, 48
  %208 = or i64 %203, %207
  %209 = getelementptr inbounds i8, i8 addrspace(4)* %170, i64 7
  %210 = load i8, i8 addrspace(4)* %209, align 1, !tbaa !15
  %211 = zext i8 %210 to i64
  %212 = shl nuw i64 %211, 56
  %213 = or i64 %208, %212
  %214 = add nsw i32 %171, -8
  %215 = getelementptr inbounds i8, i8 addrspace(4)* %170, i64 8
  br label %229

216:                                              ; preds = %174, %216
  %217 = phi i32 [ %227, %216 ], [ 0, %174 ]
  %218 = phi i64 [ %226, %216 ], [ 0, %174 ]
  %219 = zext i32 %217 to i64
  %220 = getelementptr inbounds i8, i8 addrspace(4)* %170, i64 %219
  %221 = load i8, i8 addrspace(4)* %220, align 1, !tbaa !15
  %222 = zext i8 %221 to i64
  %223 = shl i32 %217, 3
  %224 = zext i32 %223 to i64
  %225 = shl nuw i64 %222, %224
  %226 = or i64 %225, %218
  %227 = add nuw nsw i32 %217, 1
  %228 = icmp eq i32 %227, %171
  br i1 %228, label %229, label %216

229:                                              ; preds = %216, %176, %174
  %230 = phi i8 addrspace(4)* [ %215, %176 ], [ %170, %174 ], [ %170, %216 ]
  %231 = phi i32 [ %214, %176 ], [ 0, %174 ], [ 0, %216 ]
  %232 = phi i64 [ %213, %176 ], [ 0, %174 ], [ %226, %216 ]
  %233 = icmp ugt i32 %231, 7
  br i1 %233, label %236, label %234

234:                                              ; preds = %229
  %235 = icmp eq i32 %231, 0
  br i1 %235, label %289, label %276

236:                                              ; preds = %229
  %237 = load i8, i8 addrspace(4)* %230, align 1, !tbaa !15
  %238 = zext i8 %237 to i64
  %239 = getelementptr inbounds i8, i8 addrspace(4)* %230, i64 1
  %240 = load i8, i8 addrspace(4)* %239, align 1, !tbaa !15
  %241 = zext i8 %240 to i64
  %242 = shl nuw nsw i64 %241, 8
  %243 = or i64 %242, %238
  %244 = getelementptr inbounds i8, i8 addrspace(4)* %230, i64 2
  %245 = load i8, i8 addrspace(4)* %244, align 1, !tbaa !15
  %246 = zext i8 %245 to i64
  %247 = shl nuw nsw i64 %246, 16
  %248 = or i64 %243, %247
  %249 = getelementptr inbounds i8, i8 addrspace(4)* %230, i64 3
  %250 = load i8, i8 addrspace(4)* %249, align 1, !tbaa !15
  %251 = zext i8 %250 to i64
  %252 = shl nuw nsw i64 %251, 24
  %253 = or i64 %248, %252
  %254 = getelementptr inbounds i8, i8 addrspace(4)* %230, i64 4
  %255 = load i8, i8 addrspace(4)* %254, align 1, !tbaa !15
  %256 = zext i8 %255 to i64
  %257 = shl nuw nsw i64 %256, 32
  %258 = or i64 %253, %257
  %259 = getelementptr inbounds i8, i8 addrspace(4)* %230, i64 5
  %260 = load i8, i8 addrspace(4)* %259, align 1, !tbaa !15
  %261 = zext i8 %260 to i64
  %262 = shl nuw nsw i64 %261, 40
  %263 = or i64 %258, %262
  %264 = getelementptr inbounds i8, i8 addrspace(4)* %230, i64 6
  %265 = load i8, i8 addrspace(4)* %264, align 1, !tbaa !15
  %266 = zext i8 %265 to i64
  %267 = shl nuw nsw i64 %266, 48
  %268 = or i64 %263, %267
  %269 = getelementptr inbounds i8, i8 addrspace(4)* %230, i64 7
  %270 = load i8, i8 addrspace(4)* %269, align 1, !tbaa !15
  %271 = zext i8 %270 to i64
  %272 = shl nuw i64 %271, 56
  %273 = or i64 %268, %272
  %274 = add nsw i32 %231, -8
  %275 = getelementptr inbounds i8, i8 addrspace(4)* %230, i64 8
  br label %289

276:                                              ; preds = %234, %276
  %277 = phi i32 [ %287, %276 ], [ 0, %234 ]
  %278 = phi i64 [ %286, %276 ], [ 0, %234 ]
  %279 = zext i32 %277 to i64
  %280 = getelementptr inbounds i8, i8 addrspace(4)* %230, i64 %279
  %281 = load i8, i8 addrspace(4)* %280, align 1, !tbaa !15
  %282 = zext i8 %281 to i64
  %283 = shl i32 %277, 3
  %284 = zext i32 %283 to i64
  %285 = shl nuw i64 %282, %284
  %286 = or i64 %285, %278
  %287 = add nuw nsw i32 %277, 1
  %288 = icmp eq i32 %287, %231
  br i1 %288, label %289, label %276

289:                                              ; preds = %276, %236, %234
  %290 = phi i8 addrspace(4)* [ %275, %236 ], [ %230, %234 ], [ %230, %276 ]
  %291 = phi i32 [ %274, %236 ], [ 0, %234 ], [ 0, %276 ]
  %292 = phi i64 [ %273, %236 ], [ 0, %234 ], [ %286, %276 ]
  %293 = icmp ugt i32 %291, 7
  br i1 %293, label %296, label %294

294:                                              ; preds = %289
  %295 = icmp eq i32 %291, 0
  br i1 %295, label %349, label %336

296:                                              ; preds = %289
  %297 = load i8, i8 addrspace(4)* %290, align 1, !tbaa !15
  %298 = zext i8 %297 to i64
  %299 = getelementptr inbounds i8, i8 addrspace(4)* %290, i64 1
  %300 = load i8, i8 addrspace(4)* %299, align 1, !tbaa !15
  %301 = zext i8 %300 to i64
  %302 = shl nuw nsw i64 %301, 8
  %303 = or i64 %302, %298
  %304 = getelementptr inbounds i8, i8 addrspace(4)* %290, i64 2
  %305 = load i8, i8 addrspace(4)* %304, align 1, !tbaa !15
  %306 = zext i8 %305 to i64
  %307 = shl nuw nsw i64 %306, 16
  %308 = or i64 %303, %307
  %309 = getelementptr inbounds i8, i8 addrspace(4)* %290, i64 3
  %310 = load i8, i8 addrspace(4)* %309, align 1, !tbaa !15
  %311 = zext i8 %310 to i64
  %312 = shl nuw nsw i64 %311, 24
  %313 = or i64 %308, %312
  %314 = getelementptr inbounds i8, i8 addrspace(4)* %290, i64 4
  %315 = load i8, i8 addrspace(4)* %314, align 1, !tbaa !15
  %316 = zext i8 %315 to i64
  %317 = shl nuw nsw i64 %316, 32
  %318 = or i64 %313, %317
  %319 = getelementptr inbounds i8, i8 addrspace(4)* %290, i64 5
  %320 = load i8, i8 addrspace(4)* %319, align 1, !tbaa !15
  %321 = zext i8 %320 to i64
  %322 = shl nuw nsw i64 %321, 40
  %323 = or i64 %318, %322
  %324 = getelementptr inbounds i8, i8 addrspace(4)* %290, i64 6
  %325 = load i8, i8 addrspace(4)* %324, align 1, !tbaa !15
  %326 = zext i8 %325 to i64
  %327 = shl nuw nsw i64 %326, 48
  %328 = or i64 %323, %327
  %329 = getelementptr inbounds i8, i8 addrspace(4)* %290, i64 7
  %330 = load i8, i8 addrspace(4)* %329, align 1, !tbaa !15
  %331 = zext i8 %330 to i64
  %332 = shl nuw i64 %331, 56
  %333 = or i64 %328, %332
  %334 = add nsw i32 %291, -8
  %335 = getelementptr inbounds i8, i8 addrspace(4)* %290, i64 8
  br label %349

336:                                              ; preds = %294, %336
  %337 = phi i32 [ %347, %336 ], [ 0, %294 ]
  %338 = phi i64 [ %346, %336 ], [ 0, %294 ]
  %339 = zext i32 %337 to i64
  %340 = getelementptr inbounds i8, i8 addrspace(4)* %290, i64 %339
  %341 = load i8, i8 addrspace(4)* %340, align 1, !tbaa !15
  %342 = zext i8 %341 to i64
  %343 = shl i32 %337, 3
  %344 = zext i32 %343 to i64
  %345 = shl nuw i64 %342, %344
  %346 = or i64 %345, %338
  %347 = add nuw nsw i32 %337, 1
  %348 = icmp eq i32 %347, %291
  br i1 %348, label %349, label %336

349:                                              ; preds = %336, %296, %294
  %350 = phi i8 addrspace(4)* [ %335, %296 ], [ %290, %294 ], [ %290, %336 ]
  %351 = phi i32 [ %334, %296 ], [ 0, %294 ], [ 0, %336 ]
  %352 = phi i64 [ %333, %296 ], [ 0, %294 ], [ %346, %336 ]
  %353 = icmp ugt i32 %351, 7
  br i1 %353, label %356, label %354

354:                                              ; preds = %349
  %355 = icmp eq i32 %351, 0
  br i1 %355, label %409, label %396

356:                                              ; preds = %349
  %357 = load i8, i8 addrspace(4)* %350, align 1, !tbaa !15
  %358 = zext i8 %357 to i64
  %359 = getelementptr inbounds i8, i8 addrspace(4)* %350, i64 1
  %360 = load i8, i8 addrspace(4)* %359, align 1, !tbaa !15
  %361 = zext i8 %360 to i64
  %362 = shl nuw nsw i64 %361, 8
  %363 = or i64 %362, %358
  %364 = getelementptr inbounds i8, i8 addrspace(4)* %350, i64 2
  %365 = load i8, i8 addrspace(4)* %364, align 1, !tbaa !15
  %366 = zext i8 %365 to i64
  %367 = shl nuw nsw i64 %366, 16
  %368 = or i64 %363, %367
  %369 = getelementptr inbounds i8, i8 addrspace(4)* %350, i64 3
  %370 = load i8, i8 addrspace(4)* %369, align 1, !tbaa !15
  %371 = zext i8 %370 to i64
  %372 = shl nuw nsw i64 %371, 24
  %373 = or i64 %368, %372
  %374 = getelementptr inbounds i8, i8 addrspace(4)* %350, i64 4
  %375 = load i8, i8 addrspace(4)* %374, align 1, !tbaa !15
  %376 = zext i8 %375 to i64
  %377 = shl nuw nsw i64 %376, 32
  %378 = or i64 %373, %377
  %379 = getelementptr inbounds i8, i8 addrspace(4)* %350, i64 5
  %380 = load i8, i8 addrspace(4)* %379, align 1, !tbaa !15
  %381 = zext i8 %380 to i64
  %382 = shl nuw nsw i64 %381, 40
  %383 = or i64 %378, %382
  %384 = getelementptr inbounds i8, i8 addrspace(4)* %350, i64 6
  %385 = load i8, i8 addrspace(4)* %384, align 1, !tbaa !15
  %386 = zext i8 %385 to i64
  %387 = shl nuw nsw i64 %386, 48
  %388 = or i64 %383, %387
  %389 = getelementptr inbounds i8, i8 addrspace(4)* %350, i64 7
  %390 = load i8, i8 addrspace(4)* %389, align 1, !tbaa !15
  %391 = zext i8 %390 to i64
  %392 = shl nuw i64 %391, 56
  %393 = or i64 %388, %392
  %394 = add nsw i32 %351, -8
  %395 = getelementptr inbounds i8, i8 addrspace(4)* %350, i64 8
  br label %409

396:                                              ; preds = %354, %396
  %397 = phi i32 [ %407, %396 ], [ 0, %354 ]
  %398 = phi i64 [ %406, %396 ], [ 0, %354 ]
  %399 = zext i32 %397 to i64
  %400 = getelementptr inbounds i8, i8 addrspace(4)* %350, i64 %399
  %401 = load i8, i8 addrspace(4)* %400, align 1, !tbaa !15
  %402 = zext i8 %401 to i64
  %403 = shl i32 %397, 3
  %404 = zext i32 %403 to i64
  %405 = shl nuw i64 %402, %404
  %406 = or i64 %405, %398
  %407 = add nuw nsw i32 %397, 1
  %408 = icmp eq i32 %407, %351
  br i1 %408, label %409, label %396

409:                                              ; preds = %396, %356, %354
  %410 = phi i8 addrspace(4)* [ %395, %356 ], [ %350, %354 ], [ %350, %396 ]
  %411 = phi i32 [ %394, %356 ], [ 0, %354 ], [ 0, %396 ]
  %412 = phi i64 [ %393, %356 ], [ 0, %354 ], [ %406, %396 ]
  %413 = icmp ugt i32 %411, 7
  br i1 %413, label %416, label %414

414:                                              ; preds = %409
  %415 = icmp eq i32 %411, 0
  br i1 %415, label %467, label %454

416:                                              ; preds = %409
  %417 = load i8, i8 addrspace(4)* %410, align 1, !tbaa !15
  %418 = zext i8 %417 to i64
  %419 = getelementptr inbounds i8, i8 addrspace(4)* %410, i64 1
  %420 = load i8, i8 addrspace(4)* %419, align 1, !tbaa !15
  %421 = zext i8 %420 to i64
  %422 = shl nuw nsw i64 %421, 8
  %423 = or i64 %422, %418
  %424 = getelementptr inbounds i8, i8 addrspace(4)* %410, i64 2
  %425 = load i8, i8 addrspace(4)* %424, align 1, !tbaa !15
  %426 = zext i8 %425 to i64
  %427 = shl nuw nsw i64 %426, 16
  %428 = or i64 %423, %427
  %429 = getelementptr inbounds i8, i8 addrspace(4)* %410, i64 3
  %430 = load i8, i8 addrspace(4)* %429, align 1, !tbaa !15
  %431 = zext i8 %430 to i64
  %432 = shl nuw nsw i64 %431, 24
  %433 = or i64 %428, %432
  %434 = getelementptr inbounds i8, i8 addrspace(4)* %410, i64 4
  %435 = load i8, i8 addrspace(4)* %434, align 1, !tbaa !15
  %436 = zext i8 %435 to i64
  %437 = shl nuw nsw i64 %436, 32
  %438 = or i64 %433, %437
  %439 = getelementptr inbounds i8, i8 addrspace(4)* %410, i64 5
  %440 = load i8, i8 addrspace(4)* %439, align 1, !tbaa !15
  %441 = zext i8 %440 to i64
  %442 = shl nuw nsw i64 %441, 40
  %443 = or i64 %438, %442
  %444 = getelementptr inbounds i8, i8 addrspace(4)* %410, i64 6
  %445 = load i8, i8 addrspace(4)* %444, align 1, !tbaa !15
  %446 = zext i8 %445 to i64
  %447 = shl nuw nsw i64 %446, 48
  %448 = or i64 %443, %447
  %449 = getelementptr inbounds i8, i8 addrspace(4)* %410, i64 7
  %450 = load i8, i8 addrspace(4)* %449, align 1, !tbaa !15
  %451 = zext i8 %450 to i64
  %452 = shl nuw i64 %451, 56
  %453 = or i64 %448, %452
  br label %467

454:                                              ; preds = %414, %454
  %455 = phi i32 [ %465, %454 ], [ 0, %414 ]
  %456 = phi i64 [ %464, %454 ], [ 0, %414 ]
  %457 = zext i32 %455 to i64
  %458 = getelementptr inbounds i8, i8 addrspace(4)* %410, i64 %457
  %459 = load i8, i8 addrspace(4)* %458, align 1, !tbaa !15
  %460 = zext i8 %459 to i64
  %461 = shl i32 %455, 3
  %462 = zext i32 %461 to i64
  %463 = shl nuw i64 %460, %462
  %464 = or i64 %463, %456
  %465 = add nuw nsw i32 %455, 1
  %466 = icmp eq i32 %465, %411
  br i1 %466, label %467, label %454

467:                                              ; preds = %454, %416, %414
  %468 = phi i64 [ %453, %416 ], [ 0, %414 ], [ %464, %454 ]
  %469 = shl nuw nsw i64 %50, 2
  %470 = add nuw nsw i64 %469, 28
  %471 = and i64 %470, 480
  %472 = and i64 %52, -225
  %473 = or i64 %472, %471
  %474 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %30, i64 noundef %473, i64 noundef %112, i64 noundef %172, i64 noundef %232, i64 noundef %292, i64 noundef %352, i64 noundef %412, i64 noundef %468) #10
  %475 = sub i64 %42, %50
  %476 = getelementptr inbounds i8, i8 addrspace(4)* %43, i64 %50
  %477 = icmp eq i64 %475, 0
  br i1 %477, label %478, label %41

478:                                              ; preds = %467, %33
  %479 = phi <2 x i64> [ %36, %33 ], [ %474, %467 ]
  %480 = extractelement <2 x i64> %479, i64 0
  %481 = and i64 %480, -225
  %482 = or i64 %481, 32
  %483 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %30, i64 noundef %482, i64 noundef %23, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %484 = extractelement <2 x i64> %483, i64 0
  %485 = and i64 %484, -225
  %486 = or i64 %485, 32
  %487 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %30, i64 noundef %486, i64 noundef %24, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %488 = extractelement <2 x i64> %487, i64 0
  %489 = and i64 %488, -227
  %490 = or i64 %489, 34
  %491 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %30, i64 noundef %490, i64 noundef %21, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %492

492:                                              ; preds = %478, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !18
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !20
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !11
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !11
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !11
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !11
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !11
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !11
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !11
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !11
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !20
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !22
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !20
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !20
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !18
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !23
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !26
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !23
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !26
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !11
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !23
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !26
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !18
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !27
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !26
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !18
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !18
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !18
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !20
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !11
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !11
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !11
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !11
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !11
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !11
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !11
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !11
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %110 = call i64 @llvm.read_register.i64(metadata !28) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !29
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !31
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !32
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !11
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !11
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !11
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !11
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !11
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !11
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !11
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !11
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !23
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !26
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !33
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !33
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !34
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !36
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !18
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !18
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !11
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !11
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !15
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !26
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !23
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !33
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !33
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !15
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"long", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !{!13, !13, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
!18 = !{!19, !19, i64 0}
!19 = !{!"any pointer", !13, i64 0}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !13, i64 0}
!22 = !{i64 2662}
!23 = !{!24, !19, i64 0}
!24 = !{!"", !19, i64 0, !19, i64 8, !25, i64 16, !12, i64 24, !12, i64 32, !12, i64 40}
!25 = !{!"hsa_signal_s", !12, i64 0}
!26 = !{!24, !12, i64 40}
!27 = !{!24, !19, i64 8}
!28 = !{!"exec"}
!29 = !{!30, !21, i64 16}
!30 = !{!"", !12, i64 0, !12, i64 8, !21, i64 16, !21, i64 20}
!31 = !{!30, !12, i64 8}
!32 = !{!30, !21, i64 20}
!33 = !{!30, !12, i64 0}
!34 = !{!35, !12, i64 16}
!35 = !{!"amd_signal_s", !12, i64 0, !13, i64 8, !12, i64 16, !21, i64 24, !21, i64 28, !12, i64 32, !12, i64 40, !13, i64 48, !13, i64 56}
!36 = !{!35, !21, i64 24}
