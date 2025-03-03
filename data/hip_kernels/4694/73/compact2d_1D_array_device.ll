; ModuleID = '../data/hip_kernels/4694/73/main.cu'
source_filename = "../data/hip_kernels/4694/73/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [53 x i8] c"gid : %d , index :%d , value : %d, prev_value : %d \0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [40 x i8] c"column index : %d --- row length : %d \0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z18compact2d_1D_arrayPiS_S_S_S_S_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readnone %5, i32 %6) local_unnamed_addr #1 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %12
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp sgt i32 %16, 0
  %18 = icmp slt i32 %16, %6
  %19 = select i1 %17, i1 %18, i1 false
  br i1 %19, label %20, label %987

20:                                               ; preds = %7
  %21 = zext i32 %16 to i64
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %21
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %21
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !5
  %26 = add nsw i32 %16, -1
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !5
  %30 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %31 = getelementptr inbounds i8, i8 addrspace(4)* %30, i64 24
  %32 = bitcast i8 addrspace(4)* %31 to i64 addrspace(4)*
  %33 = load i64, i64 addrspace(4)* %32, align 8, !tbaa !11
  %34 = inttoptr i64 %33 to i8 addrspace(1)*
  %35 = addrspacecast i8 addrspace(1)* %34 to i8*
  %36 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %35, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %37 = extractelement <2 x i64> %36, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([53 x i8], [53 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %38, label %42

38:                                               ; preds = %20
  %39 = and i64 %37, -225
  %40 = or i64 %39, 32
  %41 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %35, i64 noundef %40, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %483

42:                                               ; preds = %20
  %43 = and i64 %37, 2
  %44 = and i64 %37, -3
  %45 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %44, i64 0
  br label %46

46:                                               ; preds = %472, %42
  %47 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([53 x i8], [53 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([53 x i8], [53 x i8] addrspace(4)* @.str, i64 0, i64 52) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([53 x i8]* addrspacecast ([53 x i8] addrspace(4)* @.str to [53 x i8]*) to i64)), i64 1))), %42 ], [ %480, %472 ]
  %48 = phi i8 addrspace(4)* [ getelementptr inbounds ([53 x i8], [53 x i8] addrspace(4)* @.str, i64 0, i64 0), %42 ], [ %481, %472 ]
  %49 = phi <2 x i64> [ %45, %42 ], [ %479, %472 ]
  %50 = icmp ugt i64 %47, 56
  %51 = extractelement <2 x i64> %49, i64 0
  %52 = or i64 %51, %43
  %53 = insertelement <2 x i64> poison, i64 %52, i64 0
  %54 = select i1 %50, <2 x i64> %49, <2 x i64> %53
  %55 = tail call i64 @llvm.umin.i64(i64 %47, i64 56)
  %56 = trunc i64 %55 to i32
  %57 = extractelement <2 x i64> %54, i64 0
  %58 = icmp ugt i32 %56, 7
  br i1 %58, label %61, label %59

59:                                               ; preds = %46
  %60 = icmp eq i32 %56, 0
  br i1 %60, label %114, label %101

61:                                               ; preds = %46
  %62 = load i8, i8 addrspace(4)* %48, align 1, !tbaa !15
  %63 = zext i8 %62 to i64
  %64 = getelementptr inbounds i8, i8 addrspace(4)* %48, i64 1
  %65 = load i8, i8 addrspace(4)* %64, align 1, !tbaa !15
  %66 = zext i8 %65 to i64
  %67 = shl nuw nsw i64 %66, 8
  %68 = or i64 %67, %63
  %69 = getelementptr inbounds i8, i8 addrspace(4)* %48, i64 2
  %70 = load i8, i8 addrspace(4)* %69, align 1, !tbaa !15
  %71 = zext i8 %70 to i64
  %72 = shl nuw nsw i64 %71, 16
  %73 = or i64 %68, %72
  %74 = getelementptr inbounds i8, i8 addrspace(4)* %48, i64 3
  %75 = load i8, i8 addrspace(4)* %74, align 1, !tbaa !15
  %76 = zext i8 %75 to i64
  %77 = shl nuw nsw i64 %76, 24
  %78 = or i64 %73, %77
  %79 = getelementptr inbounds i8, i8 addrspace(4)* %48, i64 4
  %80 = load i8, i8 addrspace(4)* %79, align 1, !tbaa !15
  %81 = zext i8 %80 to i64
  %82 = shl nuw nsw i64 %81, 32
  %83 = or i64 %78, %82
  %84 = getelementptr inbounds i8, i8 addrspace(4)* %48, i64 5
  %85 = load i8, i8 addrspace(4)* %84, align 1, !tbaa !15
  %86 = zext i8 %85 to i64
  %87 = shl nuw nsw i64 %86, 40
  %88 = or i64 %83, %87
  %89 = getelementptr inbounds i8, i8 addrspace(4)* %48, i64 6
  %90 = load i8, i8 addrspace(4)* %89, align 1, !tbaa !15
  %91 = zext i8 %90 to i64
  %92 = shl nuw nsw i64 %91, 48
  %93 = or i64 %88, %92
  %94 = getelementptr inbounds i8, i8 addrspace(4)* %48, i64 7
  %95 = load i8, i8 addrspace(4)* %94, align 1, !tbaa !15
  %96 = zext i8 %95 to i64
  %97 = shl nuw i64 %96, 56
  %98 = or i64 %93, %97
  %99 = add nsw i32 %56, -8
  %100 = getelementptr inbounds i8, i8 addrspace(4)* %48, i64 8
  br label %114

101:                                              ; preds = %59, %101
  %102 = phi i32 [ %112, %101 ], [ 0, %59 ]
  %103 = phi i64 [ %111, %101 ], [ 0, %59 ]
  %104 = zext i32 %102 to i64
  %105 = getelementptr inbounds i8, i8 addrspace(4)* %48, i64 %104
  %106 = load i8, i8 addrspace(4)* %105, align 1, !tbaa !15
  %107 = zext i8 %106 to i64
  %108 = shl i32 %102, 3
  %109 = zext i32 %108 to i64
  %110 = shl nuw i64 %107, %109
  %111 = or i64 %110, %103
  %112 = add nuw nsw i32 %102, 1
  %113 = icmp eq i32 %112, %56
  br i1 %113, label %114, label %101, !llvm.loop !16

114:                                              ; preds = %101, %61, %59
  %115 = phi i8 addrspace(4)* [ %100, %61 ], [ %48, %59 ], [ %48, %101 ]
  %116 = phi i32 [ %99, %61 ], [ 0, %59 ], [ 0, %101 ]
  %117 = phi i64 [ %98, %61 ], [ 0, %59 ], [ %111, %101 ]
  %118 = icmp ugt i32 %116, 7
  br i1 %118, label %121, label %119

119:                                              ; preds = %114
  %120 = icmp eq i32 %116, 0
  br i1 %120, label %174, label %161

121:                                              ; preds = %114
  %122 = load i8, i8 addrspace(4)* %115, align 1, !tbaa !15
  %123 = zext i8 %122 to i64
  %124 = getelementptr inbounds i8, i8 addrspace(4)* %115, i64 1
  %125 = load i8, i8 addrspace(4)* %124, align 1, !tbaa !15
  %126 = zext i8 %125 to i64
  %127 = shl nuw nsw i64 %126, 8
  %128 = or i64 %127, %123
  %129 = getelementptr inbounds i8, i8 addrspace(4)* %115, i64 2
  %130 = load i8, i8 addrspace(4)* %129, align 1, !tbaa !15
  %131 = zext i8 %130 to i64
  %132 = shl nuw nsw i64 %131, 16
  %133 = or i64 %128, %132
  %134 = getelementptr inbounds i8, i8 addrspace(4)* %115, i64 3
  %135 = load i8, i8 addrspace(4)* %134, align 1, !tbaa !15
  %136 = zext i8 %135 to i64
  %137 = shl nuw nsw i64 %136, 24
  %138 = or i64 %133, %137
  %139 = getelementptr inbounds i8, i8 addrspace(4)* %115, i64 4
  %140 = load i8, i8 addrspace(4)* %139, align 1, !tbaa !15
  %141 = zext i8 %140 to i64
  %142 = shl nuw nsw i64 %141, 32
  %143 = or i64 %138, %142
  %144 = getelementptr inbounds i8, i8 addrspace(4)* %115, i64 5
  %145 = load i8, i8 addrspace(4)* %144, align 1, !tbaa !15
  %146 = zext i8 %145 to i64
  %147 = shl nuw nsw i64 %146, 40
  %148 = or i64 %143, %147
  %149 = getelementptr inbounds i8, i8 addrspace(4)* %115, i64 6
  %150 = load i8, i8 addrspace(4)* %149, align 1, !tbaa !15
  %151 = zext i8 %150 to i64
  %152 = shl nuw nsw i64 %151, 48
  %153 = or i64 %148, %152
  %154 = getelementptr inbounds i8, i8 addrspace(4)* %115, i64 7
  %155 = load i8, i8 addrspace(4)* %154, align 1, !tbaa !15
  %156 = zext i8 %155 to i64
  %157 = shl nuw i64 %156, 56
  %158 = or i64 %153, %157
  %159 = add nsw i32 %116, -8
  %160 = getelementptr inbounds i8, i8 addrspace(4)* %115, i64 8
  br label %174

161:                                              ; preds = %119, %161
  %162 = phi i32 [ %172, %161 ], [ 0, %119 ]
  %163 = phi i64 [ %171, %161 ], [ 0, %119 ]
  %164 = zext i32 %162 to i64
  %165 = getelementptr inbounds i8, i8 addrspace(4)* %115, i64 %164
  %166 = load i8, i8 addrspace(4)* %165, align 1, !tbaa !15
  %167 = zext i8 %166 to i64
  %168 = shl i32 %162, 3
  %169 = zext i32 %168 to i64
  %170 = shl nuw i64 %167, %169
  %171 = or i64 %170, %163
  %172 = add nuw nsw i32 %162, 1
  %173 = icmp eq i32 %172, %116
  br i1 %173, label %174, label %161

174:                                              ; preds = %161, %121, %119
  %175 = phi i8 addrspace(4)* [ %160, %121 ], [ %115, %119 ], [ %115, %161 ]
  %176 = phi i32 [ %159, %121 ], [ 0, %119 ], [ 0, %161 ]
  %177 = phi i64 [ %158, %121 ], [ 0, %119 ], [ %171, %161 ]
  %178 = icmp ugt i32 %176, 7
  br i1 %178, label %181, label %179

179:                                              ; preds = %174
  %180 = icmp eq i32 %176, 0
  br i1 %180, label %234, label %221

181:                                              ; preds = %174
  %182 = load i8, i8 addrspace(4)* %175, align 1, !tbaa !15
  %183 = zext i8 %182 to i64
  %184 = getelementptr inbounds i8, i8 addrspace(4)* %175, i64 1
  %185 = load i8, i8 addrspace(4)* %184, align 1, !tbaa !15
  %186 = zext i8 %185 to i64
  %187 = shl nuw nsw i64 %186, 8
  %188 = or i64 %187, %183
  %189 = getelementptr inbounds i8, i8 addrspace(4)* %175, i64 2
  %190 = load i8, i8 addrspace(4)* %189, align 1, !tbaa !15
  %191 = zext i8 %190 to i64
  %192 = shl nuw nsw i64 %191, 16
  %193 = or i64 %188, %192
  %194 = getelementptr inbounds i8, i8 addrspace(4)* %175, i64 3
  %195 = load i8, i8 addrspace(4)* %194, align 1, !tbaa !15
  %196 = zext i8 %195 to i64
  %197 = shl nuw nsw i64 %196, 24
  %198 = or i64 %193, %197
  %199 = getelementptr inbounds i8, i8 addrspace(4)* %175, i64 4
  %200 = load i8, i8 addrspace(4)* %199, align 1, !tbaa !15
  %201 = zext i8 %200 to i64
  %202 = shl nuw nsw i64 %201, 32
  %203 = or i64 %198, %202
  %204 = getelementptr inbounds i8, i8 addrspace(4)* %175, i64 5
  %205 = load i8, i8 addrspace(4)* %204, align 1, !tbaa !15
  %206 = zext i8 %205 to i64
  %207 = shl nuw nsw i64 %206, 40
  %208 = or i64 %203, %207
  %209 = getelementptr inbounds i8, i8 addrspace(4)* %175, i64 6
  %210 = load i8, i8 addrspace(4)* %209, align 1, !tbaa !15
  %211 = zext i8 %210 to i64
  %212 = shl nuw nsw i64 %211, 48
  %213 = or i64 %208, %212
  %214 = getelementptr inbounds i8, i8 addrspace(4)* %175, i64 7
  %215 = load i8, i8 addrspace(4)* %214, align 1, !tbaa !15
  %216 = zext i8 %215 to i64
  %217 = shl nuw i64 %216, 56
  %218 = or i64 %213, %217
  %219 = add nsw i32 %176, -8
  %220 = getelementptr inbounds i8, i8 addrspace(4)* %175, i64 8
  br label %234

221:                                              ; preds = %179, %221
  %222 = phi i32 [ %232, %221 ], [ 0, %179 ]
  %223 = phi i64 [ %231, %221 ], [ 0, %179 ]
  %224 = zext i32 %222 to i64
  %225 = getelementptr inbounds i8, i8 addrspace(4)* %175, i64 %224
  %226 = load i8, i8 addrspace(4)* %225, align 1, !tbaa !15
  %227 = zext i8 %226 to i64
  %228 = shl i32 %222, 3
  %229 = zext i32 %228 to i64
  %230 = shl nuw i64 %227, %229
  %231 = or i64 %230, %223
  %232 = add nuw nsw i32 %222, 1
  %233 = icmp eq i32 %232, %176
  br i1 %233, label %234, label %221

234:                                              ; preds = %221, %181, %179
  %235 = phi i8 addrspace(4)* [ %220, %181 ], [ %175, %179 ], [ %175, %221 ]
  %236 = phi i32 [ %219, %181 ], [ 0, %179 ], [ 0, %221 ]
  %237 = phi i64 [ %218, %181 ], [ 0, %179 ], [ %231, %221 ]
  %238 = icmp ugt i32 %236, 7
  br i1 %238, label %241, label %239

239:                                              ; preds = %234
  %240 = icmp eq i32 %236, 0
  br i1 %240, label %294, label %281

241:                                              ; preds = %234
  %242 = load i8, i8 addrspace(4)* %235, align 1, !tbaa !15
  %243 = zext i8 %242 to i64
  %244 = getelementptr inbounds i8, i8 addrspace(4)* %235, i64 1
  %245 = load i8, i8 addrspace(4)* %244, align 1, !tbaa !15
  %246 = zext i8 %245 to i64
  %247 = shl nuw nsw i64 %246, 8
  %248 = or i64 %247, %243
  %249 = getelementptr inbounds i8, i8 addrspace(4)* %235, i64 2
  %250 = load i8, i8 addrspace(4)* %249, align 1, !tbaa !15
  %251 = zext i8 %250 to i64
  %252 = shl nuw nsw i64 %251, 16
  %253 = or i64 %248, %252
  %254 = getelementptr inbounds i8, i8 addrspace(4)* %235, i64 3
  %255 = load i8, i8 addrspace(4)* %254, align 1, !tbaa !15
  %256 = zext i8 %255 to i64
  %257 = shl nuw nsw i64 %256, 24
  %258 = or i64 %253, %257
  %259 = getelementptr inbounds i8, i8 addrspace(4)* %235, i64 4
  %260 = load i8, i8 addrspace(4)* %259, align 1, !tbaa !15
  %261 = zext i8 %260 to i64
  %262 = shl nuw nsw i64 %261, 32
  %263 = or i64 %258, %262
  %264 = getelementptr inbounds i8, i8 addrspace(4)* %235, i64 5
  %265 = load i8, i8 addrspace(4)* %264, align 1, !tbaa !15
  %266 = zext i8 %265 to i64
  %267 = shl nuw nsw i64 %266, 40
  %268 = or i64 %263, %267
  %269 = getelementptr inbounds i8, i8 addrspace(4)* %235, i64 6
  %270 = load i8, i8 addrspace(4)* %269, align 1, !tbaa !15
  %271 = zext i8 %270 to i64
  %272 = shl nuw nsw i64 %271, 48
  %273 = or i64 %268, %272
  %274 = getelementptr inbounds i8, i8 addrspace(4)* %235, i64 7
  %275 = load i8, i8 addrspace(4)* %274, align 1, !tbaa !15
  %276 = zext i8 %275 to i64
  %277 = shl nuw i64 %276, 56
  %278 = or i64 %273, %277
  %279 = add nsw i32 %236, -8
  %280 = getelementptr inbounds i8, i8 addrspace(4)* %235, i64 8
  br label %294

281:                                              ; preds = %239, %281
  %282 = phi i32 [ %292, %281 ], [ 0, %239 ]
  %283 = phi i64 [ %291, %281 ], [ 0, %239 ]
  %284 = zext i32 %282 to i64
  %285 = getelementptr inbounds i8, i8 addrspace(4)* %235, i64 %284
  %286 = load i8, i8 addrspace(4)* %285, align 1, !tbaa !15
  %287 = zext i8 %286 to i64
  %288 = shl i32 %282, 3
  %289 = zext i32 %288 to i64
  %290 = shl nuw i64 %287, %289
  %291 = or i64 %290, %283
  %292 = add nuw nsw i32 %282, 1
  %293 = icmp eq i32 %292, %236
  br i1 %293, label %294, label %281

294:                                              ; preds = %281, %241, %239
  %295 = phi i8 addrspace(4)* [ %280, %241 ], [ %235, %239 ], [ %235, %281 ]
  %296 = phi i32 [ %279, %241 ], [ 0, %239 ], [ 0, %281 ]
  %297 = phi i64 [ %278, %241 ], [ 0, %239 ], [ %291, %281 ]
  %298 = icmp ugt i32 %296, 7
  br i1 %298, label %301, label %299

299:                                              ; preds = %294
  %300 = icmp eq i32 %296, 0
  br i1 %300, label %354, label %341

301:                                              ; preds = %294
  %302 = load i8, i8 addrspace(4)* %295, align 1, !tbaa !15
  %303 = zext i8 %302 to i64
  %304 = getelementptr inbounds i8, i8 addrspace(4)* %295, i64 1
  %305 = load i8, i8 addrspace(4)* %304, align 1, !tbaa !15
  %306 = zext i8 %305 to i64
  %307 = shl nuw nsw i64 %306, 8
  %308 = or i64 %307, %303
  %309 = getelementptr inbounds i8, i8 addrspace(4)* %295, i64 2
  %310 = load i8, i8 addrspace(4)* %309, align 1, !tbaa !15
  %311 = zext i8 %310 to i64
  %312 = shl nuw nsw i64 %311, 16
  %313 = or i64 %308, %312
  %314 = getelementptr inbounds i8, i8 addrspace(4)* %295, i64 3
  %315 = load i8, i8 addrspace(4)* %314, align 1, !tbaa !15
  %316 = zext i8 %315 to i64
  %317 = shl nuw nsw i64 %316, 24
  %318 = or i64 %313, %317
  %319 = getelementptr inbounds i8, i8 addrspace(4)* %295, i64 4
  %320 = load i8, i8 addrspace(4)* %319, align 1, !tbaa !15
  %321 = zext i8 %320 to i64
  %322 = shl nuw nsw i64 %321, 32
  %323 = or i64 %318, %322
  %324 = getelementptr inbounds i8, i8 addrspace(4)* %295, i64 5
  %325 = load i8, i8 addrspace(4)* %324, align 1, !tbaa !15
  %326 = zext i8 %325 to i64
  %327 = shl nuw nsw i64 %326, 40
  %328 = or i64 %323, %327
  %329 = getelementptr inbounds i8, i8 addrspace(4)* %295, i64 6
  %330 = load i8, i8 addrspace(4)* %329, align 1, !tbaa !15
  %331 = zext i8 %330 to i64
  %332 = shl nuw nsw i64 %331, 48
  %333 = or i64 %328, %332
  %334 = getelementptr inbounds i8, i8 addrspace(4)* %295, i64 7
  %335 = load i8, i8 addrspace(4)* %334, align 1, !tbaa !15
  %336 = zext i8 %335 to i64
  %337 = shl nuw i64 %336, 56
  %338 = or i64 %333, %337
  %339 = add nsw i32 %296, -8
  %340 = getelementptr inbounds i8, i8 addrspace(4)* %295, i64 8
  br label %354

341:                                              ; preds = %299, %341
  %342 = phi i32 [ %352, %341 ], [ 0, %299 ]
  %343 = phi i64 [ %351, %341 ], [ 0, %299 ]
  %344 = zext i32 %342 to i64
  %345 = getelementptr inbounds i8, i8 addrspace(4)* %295, i64 %344
  %346 = load i8, i8 addrspace(4)* %345, align 1, !tbaa !15
  %347 = zext i8 %346 to i64
  %348 = shl i32 %342, 3
  %349 = zext i32 %348 to i64
  %350 = shl nuw i64 %347, %349
  %351 = or i64 %350, %343
  %352 = add nuw nsw i32 %342, 1
  %353 = icmp eq i32 %352, %296
  br i1 %353, label %354, label %341

354:                                              ; preds = %341, %301, %299
  %355 = phi i8 addrspace(4)* [ %340, %301 ], [ %295, %299 ], [ %295, %341 ]
  %356 = phi i32 [ %339, %301 ], [ 0, %299 ], [ 0, %341 ]
  %357 = phi i64 [ %338, %301 ], [ 0, %299 ], [ %351, %341 ]
  %358 = icmp ugt i32 %356, 7
  br i1 %358, label %361, label %359

359:                                              ; preds = %354
  %360 = icmp eq i32 %356, 0
  br i1 %360, label %414, label %401

361:                                              ; preds = %354
  %362 = load i8, i8 addrspace(4)* %355, align 1, !tbaa !15
  %363 = zext i8 %362 to i64
  %364 = getelementptr inbounds i8, i8 addrspace(4)* %355, i64 1
  %365 = load i8, i8 addrspace(4)* %364, align 1, !tbaa !15
  %366 = zext i8 %365 to i64
  %367 = shl nuw nsw i64 %366, 8
  %368 = or i64 %367, %363
  %369 = getelementptr inbounds i8, i8 addrspace(4)* %355, i64 2
  %370 = load i8, i8 addrspace(4)* %369, align 1, !tbaa !15
  %371 = zext i8 %370 to i64
  %372 = shl nuw nsw i64 %371, 16
  %373 = or i64 %368, %372
  %374 = getelementptr inbounds i8, i8 addrspace(4)* %355, i64 3
  %375 = load i8, i8 addrspace(4)* %374, align 1, !tbaa !15
  %376 = zext i8 %375 to i64
  %377 = shl nuw nsw i64 %376, 24
  %378 = or i64 %373, %377
  %379 = getelementptr inbounds i8, i8 addrspace(4)* %355, i64 4
  %380 = load i8, i8 addrspace(4)* %379, align 1, !tbaa !15
  %381 = zext i8 %380 to i64
  %382 = shl nuw nsw i64 %381, 32
  %383 = or i64 %378, %382
  %384 = getelementptr inbounds i8, i8 addrspace(4)* %355, i64 5
  %385 = load i8, i8 addrspace(4)* %384, align 1, !tbaa !15
  %386 = zext i8 %385 to i64
  %387 = shl nuw nsw i64 %386, 40
  %388 = or i64 %383, %387
  %389 = getelementptr inbounds i8, i8 addrspace(4)* %355, i64 6
  %390 = load i8, i8 addrspace(4)* %389, align 1, !tbaa !15
  %391 = zext i8 %390 to i64
  %392 = shl nuw nsw i64 %391, 48
  %393 = or i64 %388, %392
  %394 = getelementptr inbounds i8, i8 addrspace(4)* %355, i64 7
  %395 = load i8, i8 addrspace(4)* %394, align 1, !tbaa !15
  %396 = zext i8 %395 to i64
  %397 = shl nuw i64 %396, 56
  %398 = or i64 %393, %397
  %399 = add nsw i32 %356, -8
  %400 = getelementptr inbounds i8, i8 addrspace(4)* %355, i64 8
  br label %414

401:                                              ; preds = %359, %401
  %402 = phi i32 [ %412, %401 ], [ 0, %359 ]
  %403 = phi i64 [ %411, %401 ], [ 0, %359 ]
  %404 = zext i32 %402 to i64
  %405 = getelementptr inbounds i8, i8 addrspace(4)* %355, i64 %404
  %406 = load i8, i8 addrspace(4)* %405, align 1, !tbaa !15
  %407 = zext i8 %406 to i64
  %408 = shl i32 %402, 3
  %409 = zext i32 %408 to i64
  %410 = shl nuw i64 %407, %409
  %411 = or i64 %410, %403
  %412 = add nuw nsw i32 %402, 1
  %413 = icmp eq i32 %412, %356
  br i1 %413, label %414, label %401

414:                                              ; preds = %401, %361, %359
  %415 = phi i8 addrspace(4)* [ %400, %361 ], [ %355, %359 ], [ %355, %401 ]
  %416 = phi i32 [ %399, %361 ], [ 0, %359 ], [ 0, %401 ]
  %417 = phi i64 [ %398, %361 ], [ 0, %359 ], [ %411, %401 ]
  %418 = icmp ugt i32 %416, 7
  br i1 %418, label %421, label %419

419:                                              ; preds = %414
  %420 = icmp eq i32 %416, 0
  br i1 %420, label %472, label %459

421:                                              ; preds = %414
  %422 = load i8, i8 addrspace(4)* %415, align 1, !tbaa !15
  %423 = zext i8 %422 to i64
  %424 = getelementptr inbounds i8, i8 addrspace(4)* %415, i64 1
  %425 = load i8, i8 addrspace(4)* %424, align 1, !tbaa !15
  %426 = zext i8 %425 to i64
  %427 = shl nuw nsw i64 %426, 8
  %428 = or i64 %427, %423
  %429 = getelementptr inbounds i8, i8 addrspace(4)* %415, i64 2
  %430 = load i8, i8 addrspace(4)* %429, align 1, !tbaa !15
  %431 = zext i8 %430 to i64
  %432 = shl nuw nsw i64 %431, 16
  %433 = or i64 %428, %432
  %434 = getelementptr inbounds i8, i8 addrspace(4)* %415, i64 3
  %435 = load i8, i8 addrspace(4)* %434, align 1, !tbaa !15
  %436 = zext i8 %435 to i64
  %437 = shl nuw nsw i64 %436, 24
  %438 = or i64 %433, %437
  %439 = getelementptr inbounds i8, i8 addrspace(4)* %415, i64 4
  %440 = load i8, i8 addrspace(4)* %439, align 1, !tbaa !15
  %441 = zext i8 %440 to i64
  %442 = shl nuw nsw i64 %441, 32
  %443 = or i64 %438, %442
  %444 = getelementptr inbounds i8, i8 addrspace(4)* %415, i64 5
  %445 = load i8, i8 addrspace(4)* %444, align 1, !tbaa !15
  %446 = zext i8 %445 to i64
  %447 = shl nuw nsw i64 %446, 40
  %448 = or i64 %443, %447
  %449 = getelementptr inbounds i8, i8 addrspace(4)* %415, i64 6
  %450 = load i8, i8 addrspace(4)* %449, align 1, !tbaa !15
  %451 = zext i8 %450 to i64
  %452 = shl nuw nsw i64 %451, 48
  %453 = or i64 %448, %452
  %454 = getelementptr inbounds i8, i8 addrspace(4)* %415, i64 7
  %455 = load i8, i8 addrspace(4)* %454, align 1, !tbaa !15
  %456 = zext i8 %455 to i64
  %457 = shl nuw i64 %456, 56
  %458 = or i64 %453, %457
  br label %472

459:                                              ; preds = %419, %459
  %460 = phi i32 [ %470, %459 ], [ 0, %419 ]
  %461 = phi i64 [ %469, %459 ], [ 0, %419 ]
  %462 = zext i32 %460 to i64
  %463 = getelementptr inbounds i8, i8 addrspace(4)* %415, i64 %462
  %464 = load i8, i8 addrspace(4)* %463, align 1, !tbaa !15
  %465 = zext i8 %464 to i64
  %466 = shl i32 %460, 3
  %467 = zext i32 %466 to i64
  %468 = shl nuw i64 %465, %467
  %469 = or i64 %468, %461
  %470 = add nuw nsw i32 %460, 1
  %471 = icmp eq i32 %470, %416
  br i1 %471, label %472, label %459

472:                                              ; preds = %459, %421, %419
  %473 = phi i64 [ %458, %421 ], [ 0, %419 ], [ %469, %459 ]
  %474 = shl nuw nsw i64 %55, 2
  %475 = add nuw nsw i64 %474, 28
  %476 = and i64 %475, 480
  %477 = and i64 %57, -225
  %478 = or i64 %477, %476
  %479 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %35, i64 noundef %478, i64 noundef %117, i64 noundef %177, i64 noundef %237, i64 noundef %297, i64 noundef %357, i64 noundef %417, i64 noundef %473) #10
  %480 = sub i64 %47, %55
  %481 = getelementptr inbounds i8, i8 addrspace(4)* %48, i64 %55
  %482 = icmp eq i64 %480, 0
  br i1 %482, label %483, label %46

483:                                              ; preds = %472, %38
  %484 = phi <2 x i64> [ %41, %38 ], [ %479, %472 ]
  %485 = extractelement <2 x i64> %484, i64 0
  %486 = and i64 %485, -225
  %487 = or i64 %486, 32
  %488 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %35, i64 noundef %487, i64 noundef %21, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %489 = extractelement <2 x i64> %488, i64 0
  %490 = zext i32 %23 to i64
  %491 = and i64 %489, -225
  %492 = or i64 %491, 32
  %493 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %35, i64 noundef %492, i64 noundef %490, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %494 = extractelement <2 x i64> %493, i64 0
  %495 = zext i32 %25 to i64
  %496 = and i64 %494, -225
  %497 = or i64 %496, 32
  %498 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %35, i64 noundef %497, i64 noundef %495, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %499 = extractelement <2 x i64> %498, i64 0
  %500 = zext i32 %29 to i64
  %501 = and i64 %499, -227
  %502 = or i64 %501, 34
  %503 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %35, i64 noundef %502, i64 noundef %500, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %504 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !7
  %505 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %27
  %506 = load i32, i32 addrspace(1)* %505, align 4, !tbaa !7
  %507 = icmp eq i32 %504, %506
  br i1 %507, label %516, label %508

508:                                              ; preds = %483
  %509 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %510 = sext i32 %504 to i64
  %511 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %510
  store i32 %509, i32 addrspace(1)* %511, align 4, !tbaa !7
  %512 = urem i32 %26, %12
  %513 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !7
  %514 = sext i32 %513 to i64
  %515 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %514
  store i32 %512, i32 addrspace(1)* %515, align 4, !tbaa !7
  br label %516

516:                                              ; preds = %508, %483
  %517 = add nsw i32 %12, -1
  %518 = freeze i32 %16
  %519 = freeze i32 %517
  %520 = udiv i32 %518, %519
  %521 = mul i32 %520, %519
  %522 = sub i32 %518, %521
  %523 = icmp eq i32 %522, 0
  br i1 %523, label %524, label %987

524:                                              ; preds = %516
  %525 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !7
  %526 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %35, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %527 = extractelement <2 x i64> %526, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([40 x i8], [40 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %528, label %532

528:                                              ; preds = %524
  %529 = and i64 %527, -225
  %530 = or i64 %529, 32
  %531 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %35, i64 noundef %530, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %973

532:                                              ; preds = %524
  %533 = and i64 %527, 2
  %534 = and i64 %527, -3
  %535 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %534, i64 0
  br label %536

536:                                              ; preds = %962, %532
  %537 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([40 x i8], [40 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([40 x i8], [40 x i8] addrspace(4)* @.str.1, i64 0, i64 39) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([40 x i8]* addrspacecast ([40 x i8] addrspace(4)* @.str.1 to [40 x i8]*) to i64)), i64 1))), %532 ], [ %970, %962 ]
  %538 = phi i8 addrspace(4)* [ getelementptr inbounds ([40 x i8], [40 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %532 ], [ %971, %962 ]
  %539 = phi <2 x i64> [ %535, %532 ], [ %969, %962 ]
  %540 = icmp ugt i64 %537, 56
  %541 = extractelement <2 x i64> %539, i64 0
  %542 = or i64 %541, %533
  %543 = insertelement <2 x i64> poison, i64 %542, i64 0
  %544 = select i1 %540, <2 x i64> %539, <2 x i64> %543
  %545 = tail call i64 @llvm.umin.i64(i64 %537, i64 56)
  %546 = trunc i64 %545 to i32
  %547 = extractelement <2 x i64> %544, i64 0
  %548 = icmp ugt i32 %546, 7
  br i1 %548, label %551, label %549

549:                                              ; preds = %536
  %550 = icmp eq i32 %546, 0
  br i1 %550, label %604, label %591

551:                                              ; preds = %536
  %552 = load i8, i8 addrspace(4)* %538, align 1, !tbaa !15
  %553 = zext i8 %552 to i64
  %554 = getelementptr inbounds i8, i8 addrspace(4)* %538, i64 1
  %555 = load i8, i8 addrspace(4)* %554, align 1, !tbaa !15
  %556 = zext i8 %555 to i64
  %557 = shl nuw nsw i64 %556, 8
  %558 = or i64 %557, %553
  %559 = getelementptr inbounds i8, i8 addrspace(4)* %538, i64 2
  %560 = load i8, i8 addrspace(4)* %559, align 1, !tbaa !15
  %561 = zext i8 %560 to i64
  %562 = shl nuw nsw i64 %561, 16
  %563 = or i64 %558, %562
  %564 = getelementptr inbounds i8, i8 addrspace(4)* %538, i64 3
  %565 = load i8, i8 addrspace(4)* %564, align 1, !tbaa !15
  %566 = zext i8 %565 to i64
  %567 = shl nuw nsw i64 %566, 24
  %568 = or i64 %563, %567
  %569 = getelementptr inbounds i8, i8 addrspace(4)* %538, i64 4
  %570 = load i8, i8 addrspace(4)* %569, align 1, !tbaa !15
  %571 = zext i8 %570 to i64
  %572 = shl nuw nsw i64 %571, 32
  %573 = or i64 %568, %572
  %574 = getelementptr inbounds i8, i8 addrspace(4)* %538, i64 5
  %575 = load i8, i8 addrspace(4)* %574, align 1, !tbaa !15
  %576 = zext i8 %575 to i64
  %577 = shl nuw nsw i64 %576, 40
  %578 = or i64 %573, %577
  %579 = getelementptr inbounds i8, i8 addrspace(4)* %538, i64 6
  %580 = load i8, i8 addrspace(4)* %579, align 1, !tbaa !15
  %581 = zext i8 %580 to i64
  %582 = shl nuw nsw i64 %581, 48
  %583 = or i64 %578, %582
  %584 = getelementptr inbounds i8, i8 addrspace(4)* %538, i64 7
  %585 = load i8, i8 addrspace(4)* %584, align 1, !tbaa !15
  %586 = zext i8 %585 to i64
  %587 = shl nuw i64 %586, 56
  %588 = or i64 %583, %587
  %589 = add nsw i32 %546, -8
  %590 = getelementptr inbounds i8, i8 addrspace(4)* %538, i64 8
  br label %604

591:                                              ; preds = %549, %591
  %592 = phi i32 [ %602, %591 ], [ 0, %549 ]
  %593 = phi i64 [ %601, %591 ], [ 0, %549 ]
  %594 = zext i32 %592 to i64
  %595 = getelementptr inbounds i8, i8 addrspace(4)* %538, i64 %594
  %596 = load i8, i8 addrspace(4)* %595, align 1, !tbaa !15
  %597 = zext i8 %596 to i64
  %598 = shl i32 %592, 3
  %599 = zext i32 %598 to i64
  %600 = shl nuw i64 %597, %599
  %601 = or i64 %600, %593
  %602 = add nuw nsw i32 %592, 1
  %603 = icmp eq i32 %602, %546
  br i1 %603, label %604, label %591, !llvm.loop !16

604:                                              ; preds = %591, %551, %549
  %605 = phi i8 addrspace(4)* [ %590, %551 ], [ %538, %549 ], [ %538, %591 ]
  %606 = phi i32 [ %589, %551 ], [ 0, %549 ], [ 0, %591 ]
  %607 = phi i64 [ %588, %551 ], [ 0, %549 ], [ %601, %591 ]
  %608 = icmp ugt i32 %606, 7
  br i1 %608, label %611, label %609

609:                                              ; preds = %604
  %610 = icmp eq i32 %606, 0
  br i1 %610, label %664, label %651

611:                                              ; preds = %604
  %612 = load i8, i8 addrspace(4)* %605, align 1, !tbaa !15
  %613 = zext i8 %612 to i64
  %614 = getelementptr inbounds i8, i8 addrspace(4)* %605, i64 1
  %615 = load i8, i8 addrspace(4)* %614, align 1, !tbaa !15
  %616 = zext i8 %615 to i64
  %617 = shl nuw nsw i64 %616, 8
  %618 = or i64 %617, %613
  %619 = getelementptr inbounds i8, i8 addrspace(4)* %605, i64 2
  %620 = load i8, i8 addrspace(4)* %619, align 1, !tbaa !15
  %621 = zext i8 %620 to i64
  %622 = shl nuw nsw i64 %621, 16
  %623 = or i64 %618, %622
  %624 = getelementptr inbounds i8, i8 addrspace(4)* %605, i64 3
  %625 = load i8, i8 addrspace(4)* %624, align 1, !tbaa !15
  %626 = zext i8 %625 to i64
  %627 = shl nuw nsw i64 %626, 24
  %628 = or i64 %623, %627
  %629 = getelementptr inbounds i8, i8 addrspace(4)* %605, i64 4
  %630 = load i8, i8 addrspace(4)* %629, align 1, !tbaa !15
  %631 = zext i8 %630 to i64
  %632 = shl nuw nsw i64 %631, 32
  %633 = or i64 %628, %632
  %634 = getelementptr inbounds i8, i8 addrspace(4)* %605, i64 5
  %635 = load i8, i8 addrspace(4)* %634, align 1, !tbaa !15
  %636 = zext i8 %635 to i64
  %637 = shl nuw nsw i64 %636, 40
  %638 = or i64 %633, %637
  %639 = getelementptr inbounds i8, i8 addrspace(4)* %605, i64 6
  %640 = load i8, i8 addrspace(4)* %639, align 1, !tbaa !15
  %641 = zext i8 %640 to i64
  %642 = shl nuw nsw i64 %641, 48
  %643 = or i64 %638, %642
  %644 = getelementptr inbounds i8, i8 addrspace(4)* %605, i64 7
  %645 = load i8, i8 addrspace(4)* %644, align 1, !tbaa !15
  %646 = zext i8 %645 to i64
  %647 = shl nuw i64 %646, 56
  %648 = or i64 %643, %647
  %649 = add nsw i32 %606, -8
  %650 = getelementptr inbounds i8, i8 addrspace(4)* %605, i64 8
  br label %664

651:                                              ; preds = %609, %651
  %652 = phi i32 [ %662, %651 ], [ 0, %609 ]
  %653 = phi i64 [ %661, %651 ], [ 0, %609 ]
  %654 = zext i32 %652 to i64
  %655 = getelementptr inbounds i8, i8 addrspace(4)* %605, i64 %654
  %656 = load i8, i8 addrspace(4)* %655, align 1, !tbaa !15
  %657 = zext i8 %656 to i64
  %658 = shl i32 %652, 3
  %659 = zext i32 %658 to i64
  %660 = shl nuw i64 %657, %659
  %661 = or i64 %660, %653
  %662 = add nuw nsw i32 %652, 1
  %663 = icmp eq i32 %662, %606
  br i1 %663, label %664, label %651

664:                                              ; preds = %651, %611, %609
  %665 = phi i8 addrspace(4)* [ %650, %611 ], [ %605, %609 ], [ %605, %651 ]
  %666 = phi i32 [ %649, %611 ], [ 0, %609 ], [ 0, %651 ]
  %667 = phi i64 [ %648, %611 ], [ 0, %609 ], [ %661, %651 ]
  %668 = icmp ugt i32 %666, 7
  br i1 %668, label %671, label %669

669:                                              ; preds = %664
  %670 = icmp eq i32 %666, 0
  br i1 %670, label %724, label %711

671:                                              ; preds = %664
  %672 = load i8, i8 addrspace(4)* %665, align 1, !tbaa !15
  %673 = zext i8 %672 to i64
  %674 = getelementptr inbounds i8, i8 addrspace(4)* %665, i64 1
  %675 = load i8, i8 addrspace(4)* %674, align 1, !tbaa !15
  %676 = zext i8 %675 to i64
  %677 = shl nuw nsw i64 %676, 8
  %678 = or i64 %677, %673
  %679 = getelementptr inbounds i8, i8 addrspace(4)* %665, i64 2
  %680 = load i8, i8 addrspace(4)* %679, align 1, !tbaa !15
  %681 = zext i8 %680 to i64
  %682 = shl nuw nsw i64 %681, 16
  %683 = or i64 %678, %682
  %684 = getelementptr inbounds i8, i8 addrspace(4)* %665, i64 3
  %685 = load i8, i8 addrspace(4)* %684, align 1, !tbaa !15
  %686 = zext i8 %685 to i64
  %687 = shl nuw nsw i64 %686, 24
  %688 = or i64 %683, %687
  %689 = getelementptr inbounds i8, i8 addrspace(4)* %665, i64 4
  %690 = load i8, i8 addrspace(4)* %689, align 1, !tbaa !15
  %691 = zext i8 %690 to i64
  %692 = shl nuw nsw i64 %691, 32
  %693 = or i64 %688, %692
  %694 = getelementptr inbounds i8, i8 addrspace(4)* %665, i64 5
  %695 = load i8, i8 addrspace(4)* %694, align 1, !tbaa !15
  %696 = zext i8 %695 to i64
  %697 = shl nuw nsw i64 %696, 40
  %698 = or i64 %693, %697
  %699 = getelementptr inbounds i8, i8 addrspace(4)* %665, i64 6
  %700 = load i8, i8 addrspace(4)* %699, align 1, !tbaa !15
  %701 = zext i8 %700 to i64
  %702 = shl nuw nsw i64 %701, 48
  %703 = or i64 %698, %702
  %704 = getelementptr inbounds i8, i8 addrspace(4)* %665, i64 7
  %705 = load i8, i8 addrspace(4)* %704, align 1, !tbaa !15
  %706 = zext i8 %705 to i64
  %707 = shl nuw i64 %706, 56
  %708 = or i64 %703, %707
  %709 = add nsw i32 %666, -8
  %710 = getelementptr inbounds i8, i8 addrspace(4)* %665, i64 8
  br label %724

711:                                              ; preds = %669, %711
  %712 = phi i32 [ %722, %711 ], [ 0, %669 ]
  %713 = phi i64 [ %721, %711 ], [ 0, %669 ]
  %714 = zext i32 %712 to i64
  %715 = getelementptr inbounds i8, i8 addrspace(4)* %665, i64 %714
  %716 = load i8, i8 addrspace(4)* %715, align 1, !tbaa !15
  %717 = zext i8 %716 to i64
  %718 = shl i32 %712, 3
  %719 = zext i32 %718 to i64
  %720 = shl nuw i64 %717, %719
  %721 = or i64 %720, %713
  %722 = add nuw nsw i32 %712, 1
  %723 = icmp eq i32 %722, %666
  br i1 %723, label %724, label %711

724:                                              ; preds = %711, %671, %669
  %725 = phi i8 addrspace(4)* [ %710, %671 ], [ %665, %669 ], [ %665, %711 ]
  %726 = phi i32 [ %709, %671 ], [ 0, %669 ], [ 0, %711 ]
  %727 = phi i64 [ %708, %671 ], [ 0, %669 ], [ %721, %711 ]
  %728 = icmp ugt i32 %726, 7
  br i1 %728, label %731, label %729

729:                                              ; preds = %724
  %730 = icmp eq i32 %726, 0
  br i1 %730, label %784, label %771

731:                                              ; preds = %724
  %732 = load i8, i8 addrspace(4)* %725, align 1, !tbaa !15
  %733 = zext i8 %732 to i64
  %734 = getelementptr inbounds i8, i8 addrspace(4)* %725, i64 1
  %735 = load i8, i8 addrspace(4)* %734, align 1, !tbaa !15
  %736 = zext i8 %735 to i64
  %737 = shl nuw nsw i64 %736, 8
  %738 = or i64 %737, %733
  %739 = getelementptr inbounds i8, i8 addrspace(4)* %725, i64 2
  %740 = load i8, i8 addrspace(4)* %739, align 1, !tbaa !15
  %741 = zext i8 %740 to i64
  %742 = shl nuw nsw i64 %741, 16
  %743 = or i64 %738, %742
  %744 = getelementptr inbounds i8, i8 addrspace(4)* %725, i64 3
  %745 = load i8, i8 addrspace(4)* %744, align 1, !tbaa !15
  %746 = zext i8 %745 to i64
  %747 = shl nuw nsw i64 %746, 24
  %748 = or i64 %743, %747
  %749 = getelementptr inbounds i8, i8 addrspace(4)* %725, i64 4
  %750 = load i8, i8 addrspace(4)* %749, align 1, !tbaa !15
  %751 = zext i8 %750 to i64
  %752 = shl nuw nsw i64 %751, 32
  %753 = or i64 %748, %752
  %754 = getelementptr inbounds i8, i8 addrspace(4)* %725, i64 5
  %755 = load i8, i8 addrspace(4)* %754, align 1, !tbaa !15
  %756 = zext i8 %755 to i64
  %757 = shl nuw nsw i64 %756, 40
  %758 = or i64 %753, %757
  %759 = getelementptr inbounds i8, i8 addrspace(4)* %725, i64 6
  %760 = load i8, i8 addrspace(4)* %759, align 1, !tbaa !15
  %761 = zext i8 %760 to i64
  %762 = shl nuw nsw i64 %761, 48
  %763 = or i64 %758, %762
  %764 = getelementptr inbounds i8, i8 addrspace(4)* %725, i64 7
  %765 = load i8, i8 addrspace(4)* %764, align 1, !tbaa !15
  %766 = zext i8 %765 to i64
  %767 = shl nuw i64 %766, 56
  %768 = or i64 %763, %767
  %769 = add nsw i32 %726, -8
  %770 = getelementptr inbounds i8, i8 addrspace(4)* %725, i64 8
  br label %784

771:                                              ; preds = %729, %771
  %772 = phi i32 [ %782, %771 ], [ 0, %729 ]
  %773 = phi i64 [ %781, %771 ], [ 0, %729 ]
  %774 = zext i32 %772 to i64
  %775 = getelementptr inbounds i8, i8 addrspace(4)* %725, i64 %774
  %776 = load i8, i8 addrspace(4)* %775, align 1, !tbaa !15
  %777 = zext i8 %776 to i64
  %778 = shl i32 %772, 3
  %779 = zext i32 %778 to i64
  %780 = shl nuw i64 %777, %779
  %781 = or i64 %780, %773
  %782 = add nuw nsw i32 %772, 1
  %783 = icmp eq i32 %782, %726
  br i1 %783, label %784, label %771

784:                                              ; preds = %771, %731, %729
  %785 = phi i8 addrspace(4)* [ %770, %731 ], [ %725, %729 ], [ %725, %771 ]
  %786 = phi i32 [ %769, %731 ], [ 0, %729 ], [ 0, %771 ]
  %787 = phi i64 [ %768, %731 ], [ 0, %729 ], [ %781, %771 ]
  %788 = icmp ugt i32 %786, 7
  br i1 %788, label %791, label %789

789:                                              ; preds = %784
  %790 = icmp eq i32 %786, 0
  br i1 %790, label %844, label %831

791:                                              ; preds = %784
  %792 = load i8, i8 addrspace(4)* %785, align 1, !tbaa !15
  %793 = zext i8 %792 to i64
  %794 = getelementptr inbounds i8, i8 addrspace(4)* %785, i64 1
  %795 = load i8, i8 addrspace(4)* %794, align 1, !tbaa !15
  %796 = zext i8 %795 to i64
  %797 = shl nuw nsw i64 %796, 8
  %798 = or i64 %797, %793
  %799 = getelementptr inbounds i8, i8 addrspace(4)* %785, i64 2
  %800 = load i8, i8 addrspace(4)* %799, align 1, !tbaa !15
  %801 = zext i8 %800 to i64
  %802 = shl nuw nsw i64 %801, 16
  %803 = or i64 %798, %802
  %804 = getelementptr inbounds i8, i8 addrspace(4)* %785, i64 3
  %805 = load i8, i8 addrspace(4)* %804, align 1, !tbaa !15
  %806 = zext i8 %805 to i64
  %807 = shl nuw nsw i64 %806, 24
  %808 = or i64 %803, %807
  %809 = getelementptr inbounds i8, i8 addrspace(4)* %785, i64 4
  %810 = load i8, i8 addrspace(4)* %809, align 1, !tbaa !15
  %811 = zext i8 %810 to i64
  %812 = shl nuw nsw i64 %811, 32
  %813 = or i64 %808, %812
  %814 = getelementptr inbounds i8, i8 addrspace(4)* %785, i64 5
  %815 = load i8, i8 addrspace(4)* %814, align 1, !tbaa !15
  %816 = zext i8 %815 to i64
  %817 = shl nuw nsw i64 %816, 40
  %818 = or i64 %813, %817
  %819 = getelementptr inbounds i8, i8 addrspace(4)* %785, i64 6
  %820 = load i8, i8 addrspace(4)* %819, align 1, !tbaa !15
  %821 = zext i8 %820 to i64
  %822 = shl nuw nsw i64 %821, 48
  %823 = or i64 %818, %822
  %824 = getelementptr inbounds i8, i8 addrspace(4)* %785, i64 7
  %825 = load i8, i8 addrspace(4)* %824, align 1, !tbaa !15
  %826 = zext i8 %825 to i64
  %827 = shl nuw i64 %826, 56
  %828 = or i64 %823, %827
  %829 = add nsw i32 %786, -8
  %830 = getelementptr inbounds i8, i8 addrspace(4)* %785, i64 8
  br label %844

831:                                              ; preds = %789, %831
  %832 = phi i32 [ %842, %831 ], [ 0, %789 ]
  %833 = phi i64 [ %841, %831 ], [ 0, %789 ]
  %834 = zext i32 %832 to i64
  %835 = getelementptr inbounds i8, i8 addrspace(4)* %785, i64 %834
  %836 = load i8, i8 addrspace(4)* %835, align 1, !tbaa !15
  %837 = zext i8 %836 to i64
  %838 = shl i32 %832, 3
  %839 = zext i32 %838 to i64
  %840 = shl nuw i64 %837, %839
  %841 = or i64 %840, %833
  %842 = add nuw nsw i32 %832, 1
  %843 = icmp eq i32 %842, %786
  br i1 %843, label %844, label %831

844:                                              ; preds = %831, %791, %789
  %845 = phi i8 addrspace(4)* [ %830, %791 ], [ %785, %789 ], [ %785, %831 ]
  %846 = phi i32 [ %829, %791 ], [ 0, %789 ], [ 0, %831 ]
  %847 = phi i64 [ %828, %791 ], [ 0, %789 ], [ %841, %831 ]
  %848 = icmp ugt i32 %846, 7
  br i1 %848, label %851, label %849

849:                                              ; preds = %844
  %850 = icmp eq i32 %846, 0
  br i1 %850, label %904, label %891

851:                                              ; preds = %844
  %852 = load i8, i8 addrspace(4)* %845, align 1, !tbaa !15
  %853 = zext i8 %852 to i64
  %854 = getelementptr inbounds i8, i8 addrspace(4)* %845, i64 1
  %855 = load i8, i8 addrspace(4)* %854, align 1, !tbaa !15
  %856 = zext i8 %855 to i64
  %857 = shl nuw nsw i64 %856, 8
  %858 = or i64 %857, %853
  %859 = getelementptr inbounds i8, i8 addrspace(4)* %845, i64 2
  %860 = load i8, i8 addrspace(4)* %859, align 1, !tbaa !15
  %861 = zext i8 %860 to i64
  %862 = shl nuw nsw i64 %861, 16
  %863 = or i64 %858, %862
  %864 = getelementptr inbounds i8, i8 addrspace(4)* %845, i64 3
  %865 = load i8, i8 addrspace(4)* %864, align 1, !tbaa !15
  %866 = zext i8 %865 to i64
  %867 = shl nuw nsw i64 %866, 24
  %868 = or i64 %863, %867
  %869 = getelementptr inbounds i8, i8 addrspace(4)* %845, i64 4
  %870 = load i8, i8 addrspace(4)* %869, align 1, !tbaa !15
  %871 = zext i8 %870 to i64
  %872 = shl nuw nsw i64 %871, 32
  %873 = or i64 %868, %872
  %874 = getelementptr inbounds i8, i8 addrspace(4)* %845, i64 5
  %875 = load i8, i8 addrspace(4)* %874, align 1, !tbaa !15
  %876 = zext i8 %875 to i64
  %877 = shl nuw nsw i64 %876, 40
  %878 = or i64 %873, %877
  %879 = getelementptr inbounds i8, i8 addrspace(4)* %845, i64 6
  %880 = load i8, i8 addrspace(4)* %879, align 1, !tbaa !15
  %881 = zext i8 %880 to i64
  %882 = shl nuw nsw i64 %881, 48
  %883 = or i64 %878, %882
  %884 = getelementptr inbounds i8, i8 addrspace(4)* %845, i64 7
  %885 = load i8, i8 addrspace(4)* %884, align 1, !tbaa !15
  %886 = zext i8 %885 to i64
  %887 = shl nuw i64 %886, 56
  %888 = or i64 %883, %887
  %889 = add nsw i32 %846, -8
  %890 = getelementptr inbounds i8, i8 addrspace(4)* %845, i64 8
  br label %904

891:                                              ; preds = %849, %891
  %892 = phi i32 [ %902, %891 ], [ 0, %849 ]
  %893 = phi i64 [ %901, %891 ], [ 0, %849 ]
  %894 = zext i32 %892 to i64
  %895 = getelementptr inbounds i8, i8 addrspace(4)* %845, i64 %894
  %896 = load i8, i8 addrspace(4)* %895, align 1, !tbaa !15
  %897 = zext i8 %896 to i64
  %898 = shl i32 %892, 3
  %899 = zext i32 %898 to i64
  %900 = shl nuw i64 %897, %899
  %901 = or i64 %900, %893
  %902 = add nuw nsw i32 %892, 1
  %903 = icmp eq i32 %902, %846
  br i1 %903, label %904, label %891

904:                                              ; preds = %891, %851, %849
  %905 = phi i8 addrspace(4)* [ %890, %851 ], [ %845, %849 ], [ %845, %891 ]
  %906 = phi i32 [ %889, %851 ], [ 0, %849 ], [ 0, %891 ]
  %907 = phi i64 [ %888, %851 ], [ 0, %849 ], [ %901, %891 ]
  %908 = icmp ugt i32 %906, 7
  br i1 %908, label %911, label %909

909:                                              ; preds = %904
  %910 = icmp eq i32 %906, 0
  br i1 %910, label %962, label %949

911:                                              ; preds = %904
  %912 = load i8, i8 addrspace(4)* %905, align 1, !tbaa !15
  %913 = zext i8 %912 to i64
  %914 = getelementptr inbounds i8, i8 addrspace(4)* %905, i64 1
  %915 = load i8, i8 addrspace(4)* %914, align 1, !tbaa !15
  %916 = zext i8 %915 to i64
  %917 = shl nuw nsw i64 %916, 8
  %918 = or i64 %917, %913
  %919 = getelementptr inbounds i8, i8 addrspace(4)* %905, i64 2
  %920 = load i8, i8 addrspace(4)* %919, align 1, !tbaa !15
  %921 = zext i8 %920 to i64
  %922 = shl nuw nsw i64 %921, 16
  %923 = or i64 %918, %922
  %924 = getelementptr inbounds i8, i8 addrspace(4)* %905, i64 3
  %925 = load i8, i8 addrspace(4)* %924, align 1, !tbaa !15
  %926 = zext i8 %925 to i64
  %927 = shl nuw nsw i64 %926, 24
  %928 = or i64 %923, %927
  %929 = getelementptr inbounds i8, i8 addrspace(4)* %905, i64 4
  %930 = load i8, i8 addrspace(4)* %929, align 1, !tbaa !15
  %931 = zext i8 %930 to i64
  %932 = shl nuw nsw i64 %931, 32
  %933 = or i64 %928, %932
  %934 = getelementptr inbounds i8, i8 addrspace(4)* %905, i64 5
  %935 = load i8, i8 addrspace(4)* %934, align 1, !tbaa !15
  %936 = zext i8 %935 to i64
  %937 = shl nuw nsw i64 %936, 40
  %938 = or i64 %933, %937
  %939 = getelementptr inbounds i8, i8 addrspace(4)* %905, i64 6
  %940 = load i8, i8 addrspace(4)* %939, align 1, !tbaa !15
  %941 = zext i8 %940 to i64
  %942 = shl nuw nsw i64 %941, 48
  %943 = or i64 %938, %942
  %944 = getelementptr inbounds i8, i8 addrspace(4)* %905, i64 7
  %945 = load i8, i8 addrspace(4)* %944, align 1, !tbaa !15
  %946 = zext i8 %945 to i64
  %947 = shl nuw i64 %946, 56
  %948 = or i64 %943, %947
  br label %962

949:                                              ; preds = %909, %949
  %950 = phi i32 [ %960, %949 ], [ 0, %909 ]
  %951 = phi i64 [ %959, %949 ], [ 0, %909 ]
  %952 = zext i32 %950 to i64
  %953 = getelementptr inbounds i8, i8 addrspace(4)* %905, i64 %952
  %954 = load i8, i8 addrspace(4)* %953, align 1, !tbaa !15
  %955 = zext i8 %954 to i64
  %956 = shl i32 %950, 3
  %957 = zext i32 %956 to i64
  %958 = shl nuw i64 %955, %957
  %959 = or i64 %958, %951
  %960 = add nuw nsw i32 %950, 1
  %961 = icmp eq i32 %960, %906
  br i1 %961, label %962, label %949

962:                                              ; preds = %949, %911, %909
  %963 = phi i64 [ %948, %911 ], [ 0, %909 ], [ %959, %949 ]
  %964 = shl nuw nsw i64 %545, 2
  %965 = add nuw nsw i64 %964, 28
  %966 = and i64 %965, 480
  %967 = and i64 %547, -225
  %968 = or i64 %967, %966
  %969 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %35, i64 noundef %968, i64 noundef %607, i64 noundef %667, i64 noundef %727, i64 noundef %787, i64 noundef %847, i64 noundef %907, i64 noundef %963) #10
  %970 = sub i64 %537, %545
  %971 = getelementptr inbounds i8, i8 addrspace(4)* %538, i64 %545
  %972 = icmp eq i64 %970, 0
  br i1 %972, label %973, label %536

973:                                              ; preds = %962, %528
  %974 = phi <2 x i64> [ %531, %528 ], [ %969, %962 ]
  %975 = extractelement <2 x i64> %974, i64 0
  %976 = and i64 %975, -225
  %977 = or i64 %976, 32
  %978 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %35, i64 noundef %977, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %979 = extractelement <2 x i64> %978, i64 0
  %980 = zext i32 %525 to i64
  %981 = and i64 %979, -227
  %982 = or i64 %981, 34
  %983 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %35, i64 noundef %982, i64 noundef %980, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %984 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !7
  %985 = zext i32 %520 to i64
  %986 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %985
  store i32 %984, i32 addrspace(1)* %986, align 4, !tbaa !7
  br label %987

987:                                              ; preds = %516, %973, %7
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
!8 = !{!"int", !9, i64 0}
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
