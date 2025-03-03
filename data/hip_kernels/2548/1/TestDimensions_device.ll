; ModuleID = '../data/hip_kernels/2548/1/main.cu'
source_filename = "../data/hip_kernels/2548/1/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [39 x i8] c"gridDim   = x: %6d / y: %6d / z: %6d\0D\0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [39 x i8] c"blockDim  = x: %6d / y: %6d / z: %6d\0D\0A\00", align 1
@.str.2 = private unnamed_addr addrspace(4) constant [29 x i8] c"num_threads_per_block: %6d\0D\0A\00", align 1
@.str.3 = private unnamed_addr addrspace(4) constant [29 x i8] c"num_blocks           : %6d\0D\0A\00", align 1
@.str.4 = private unnamed_addr addrspace(4) constant [29 x i8] c"threads_stride       : %6d\0D\0A\00", align 1
@.str.5 = private unnamed_addr addrspace(4) constant [120 x i8] c"tidx | %6d | %6d | %6d | bidx | %6d | %6d | %6d | gdim | %6d | %6d | %6d | bdim | %6d | %6d | %6d | thread_id | %6d |\0D\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z14TestDimensionsv() local_unnamed_addr #1 {
  %1 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %2 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %3 = getelementptr i8, i8 addrspace(4)* %1, i64 4
  %4 = bitcast i8 addrspace(4)* %3 to i16 addrspace(4)*
  %5 = load i16, i16 addrspace(4)* %4, align 4, !range !4, !invariant.load !5
  %6 = zext i16 %5 to i32
  %7 = getelementptr inbounds i8, i8 addrspace(4)* %1, i64 12
  %8 = bitcast i8 addrspace(4)* %7 to i32 addrspace(4)*
  %9 = load i32, i32 addrspace(4)* %8, align 4, !tbaa !6
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = getelementptr i8, i8 addrspace(4)* %1, i64 6
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 2, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %1, i64 16
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 8, !tbaa !15
  %18 = mul nuw nsw i32 %14, %6
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %20 = getelementptr i8, i8 addrspace(4)* %1, i64 8
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %1, i64 20
  %25 = bitcast i8 addrspace(4)* %24 to i32 addrspace(4)*
  %26 = load i32, i32 addrspace(4)* %25, align 4, !tbaa !16
  %27 = mul nuw nsw i32 %18, %23
  %28 = udiv i32 %9, %6
  %29 = mul i32 %28, %6
  %30 = icmp ugt i32 %9, %29
  %31 = zext i1 %30 to i32
  %32 = add i32 %28, %31
  %33 = udiv i32 %17, %14
  %34 = mul i32 %33, %14
  %35 = icmp ugt i32 %17, %34
  %36 = zext i1 %35 to i32
  %37 = add i32 %33, %36
  %38 = mul i32 %37, %32
  %39 = udiv i32 %26, %23
  %40 = mul i32 %39, %23
  %41 = icmp ugt i32 %26, %40
  %42 = zext i1 %41 to i32
  %43 = add i32 %39, %42
  %44 = mul i32 %38, %43
  %45 = mul nsw i32 %44, %27
  %46 = mul i32 %37, %19
  %47 = add i32 %46, %10
  %48 = mul i32 %47, %32
  %49 = add i32 %48, %2
  %50 = mul i32 %49, %27
  %51 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !17
  %52 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !17
  %53 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !17
  %54 = mul nuw nsw i32 %53, %14
  %55 = add nuw nsw i32 %54, %52
  %56 = mul nuw nsw i32 %55, %6
  %57 = add nuw nsw i32 %56, %51
  %58 = add i32 %57, %50
  %59 = icmp eq i32 %58, 0
  %60 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  br i1 %59, label %61, label %2357

61:                                               ; preds = %0
  %62 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 24
  %63 = bitcast i8 addrspace(4)* %62 to i64 addrspace(4)*
  %64 = load i64, i64 addrspace(4)* %63, align 8, !tbaa !18
  %65 = inttoptr i64 %64 to i8 addrspace(1)*
  %66 = addrspacecast i8 addrspace(1)* %65 to i8*
  %67 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %68 = extractelement <2 x i64> %67, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([39 x i8], [39 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %69, label %73

69:                                               ; preds = %61
  %70 = and i64 %68, -225
  %71 = or i64 %70, 32
  %72 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef %71, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %514

73:                                               ; preds = %61
  %74 = and i64 %68, 2
  %75 = and i64 %68, -3
  %76 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %75, i64 0
  br label %77

77:                                               ; preds = %503, %73
  %78 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([39 x i8], [39 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([39 x i8], [39 x i8] addrspace(4)* @.str, i64 0, i64 38) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([39 x i8]* addrspacecast ([39 x i8] addrspace(4)* @.str to [39 x i8]*) to i64)), i64 1))), %73 ], [ %511, %503 ]
  %79 = phi i8 addrspace(4)* [ getelementptr inbounds ([39 x i8], [39 x i8] addrspace(4)* @.str, i64 0, i64 0), %73 ], [ %512, %503 ]
  %80 = phi <2 x i64> [ %76, %73 ], [ %510, %503 ]
  %81 = icmp ugt i64 %78, 56
  %82 = extractelement <2 x i64> %80, i64 0
  %83 = or i64 %82, %74
  %84 = insertelement <2 x i64> poison, i64 %83, i64 0
  %85 = select i1 %81, <2 x i64> %80, <2 x i64> %84
  %86 = tail call i64 @llvm.umin.i64(i64 %78, i64 56)
  %87 = trunc i64 %86 to i32
  %88 = extractelement <2 x i64> %85, i64 0
  %89 = icmp ugt i32 %87, 7
  br i1 %89, label %92, label %90

90:                                               ; preds = %77
  %91 = icmp eq i32 %87, 0
  br i1 %91, label %145, label %132

92:                                               ; preds = %77
  %93 = load i8, i8 addrspace(4)* %79, align 1, !tbaa !19
  %94 = zext i8 %93 to i64
  %95 = getelementptr inbounds i8, i8 addrspace(4)* %79, i64 1
  %96 = load i8, i8 addrspace(4)* %95, align 1, !tbaa !19
  %97 = zext i8 %96 to i64
  %98 = shl nuw nsw i64 %97, 8
  %99 = or i64 %98, %94
  %100 = getelementptr inbounds i8, i8 addrspace(4)* %79, i64 2
  %101 = load i8, i8 addrspace(4)* %100, align 1, !tbaa !19
  %102 = zext i8 %101 to i64
  %103 = shl nuw nsw i64 %102, 16
  %104 = or i64 %99, %103
  %105 = getelementptr inbounds i8, i8 addrspace(4)* %79, i64 3
  %106 = load i8, i8 addrspace(4)* %105, align 1, !tbaa !19
  %107 = zext i8 %106 to i64
  %108 = shl nuw nsw i64 %107, 24
  %109 = or i64 %104, %108
  %110 = getelementptr inbounds i8, i8 addrspace(4)* %79, i64 4
  %111 = load i8, i8 addrspace(4)* %110, align 1, !tbaa !19
  %112 = zext i8 %111 to i64
  %113 = shl nuw nsw i64 %112, 32
  %114 = or i64 %109, %113
  %115 = getelementptr inbounds i8, i8 addrspace(4)* %79, i64 5
  %116 = load i8, i8 addrspace(4)* %115, align 1, !tbaa !19
  %117 = zext i8 %116 to i64
  %118 = shl nuw nsw i64 %117, 40
  %119 = or i64 %114, %118
  %120 = getelementptr inbounds i8, i8 addrspace(4)* %79, i64 6
  %121 = load i8, i8 addrspace(4)* %120, align 1, !tbaa !19
  %122 = zext i8 %121 to i64
  %123 = shl nuw nsw i64 %122, 48
  %124 = or i64 %119, %123
  %125 = getelementptr inbounds i8, i8 addrspace(4)* %79, i64 7
  %126 = load i8, i8 addrspace(4)* %125, align 1, !tbaa !19
  %127 = zext i8 %126 to i64
  %128 = shl nuw i64 %127, 56
  %129 = or i64 %124, %128
  %130 = add nsw i32 %87, -8
  %131 = getelementptr inbounds i8, i8 addrspace(4)* %79, i64 8
  br label %145

132:                                              ; preds = %90, %132
  %133 = phi i32 [ %143, %132 ], [ 0, %90 ]
  %134 = phi i64 [ %142, %132 ], [ 0, %90 ]
  %135 = zext i32 %133 to i64
  %136 = getelementptr inbounds i8, i8 addrspace(4)* %79, i64 %135
  %137 = load i8, i8 addrspace(4)* %136, align 1, !tbaa !19
  %138 = zext i8 %137 to i64
  %139 = shl i32 %133, 3
  %140 = zext i32 %139 to i64
  %141 = shl nuw i64 %138, %140
  %142 = or i64 %141, %134
  %143 = add nuw nsw i32 %133, 1
  %144 = icmp eq i32 %143, %87
  br i1 %144, label %145, label %132, !llvm.loop !20

145:                                              ; preds = %132, %92, %90
  %146 = phi i8 addrspace(4)* [ %131, %92 ], [ %79, %90 ], [ %79, %132 ]
  %147 = phi i32 [ %130, %92 ], [ 0, %90 ], [ 0, %132 ]
  %148 = phi i64 [ %129, %92 ], [ 0, %90 ], [ %142, %132 ]
  %149 = icmp ugt i32 %147, 7
  br i1 %149, label %152, label %150

150:                                              ; preds = %145
  %151 = icmp eq i32 %147, 0
  br i1 %151, label %205, label %192

152:                                              ; preds = %145
  %153 = load i8, i8 addrspace(4)* %146, align 1, !tbaa !19
  %154 = zext i8 %153 to i64
  %155 = getelementptr inbounds i8, i8 addrspace(4)* %146, i64 1
  %156 = load i8, i8 addrspace(4)* %155, align 1, !tbaa !19
  %157 = zext i8 %156 to i64
  %158 = shl nuw nsw i64 %157, 8
  %159 = or i64 %158, %154
  %160 = getelementptr inbounds i8, i8 addrspace(4)* %146, i64 2
  %161 = load i8, i8 addrspace(4)* %160, align 1, !tbaa !19
  %162 = zext i8 %161 to i64
  %163 = shl nuw nsw i64 %162, 16
  %164 = or i64 %159, %163
  %165 = getelementptr inbounds i8, i8 addrspace(4)* %146, i64 3
  %166 = load i8, i8 addrspace(4)* %165, align 1, !tbaa !19
  %167 = zext i8 %166 to i64
  %168 = shl nuw nsw i64 %167, 24
  %169 = or i64 %164, %168
  %170 = getelementptr inbounds i8, i8 addrspace(4)* %146, i64 4
  %171 = load i8, i8 addrspace(4)* %170, align 1, !tbaa !19
  %172 = zext i8 %171 to i64
  %173 = shl nuw nsw i64 %172, 32
  %174 = or i64 %169, %173
  %175 = getelementptr inbounds i8, i8 addrspace(4)* %146, i64 5
  %176 = load i8, i8 addrspace(4)* %175, align 1, !tbaa !19
  %177 = zext i8 %176 to i64
  %178 = shl nuw nsw i64 %177, 40
  %179 = or i64 %174, %178
  %180 = getelementptr inbounds i8, i8 addrspace(4)* %146, i64 6
  %181 = load i8, i8 addrspace(4)* %180, align 1, !tbaa !19
  %182 = zext i8 %181 to i64
  %183 = shl nuw nsw i64 %182, 48
  %184 = or i64 %179, %183
  %185 = getelementptr inbounds i8, i8 addrspace(4)* %146, i64 7
  %186 = load i8, i8 addrspace(4)* %185, align 1, !tbaa !19
  %187 = zext i8 %186 to i64
  %188 = shl nuw i64 %187, 56
  %189 = or i64 %184, %188
  %190 = add nsw i32 %147, -8
  %191 = getelementptr inbounds i8, i8 addrspace(4)* %146, i64 8
  br label %205

192:                                              ; preds = %150, %192
  %193 = phi i32 [ %203, %192 ], [ 0, %150 ]
  %194 = phi i64 [ %202, %192 ], [ 0, %150 ]
  %195 = zext i32 %193 to i64
  %196 = getelementptr inbounds i8, i8 addrspace(4)* %146, i64 %195
  %197 = load i8, i8 addrspace(4)* %196, align 1, !tbaa !19
  %198 = zext i8 %197 to i64
  %199 = shl i32 %193, 3
  %200 = zext i32 %199 to i64
  %201 = shl nuw i64 %198, %200
  %202 = or i64 %201, %194
  %203 = add nuw nsw i32 %193, 1
  %204 = icmp eq i32 %203, %147
  br i1 %204, label %205, label %192

205:                                              ; preds = %192, %152, %150
  %206 = phi i8 addrspace(4)* [ %191, %152 ], [ %146, %150 ], [ %146, %192 ]
  %207 = phi i32 [ %190, %152 ], [ 0, %150 ], [ 0, %192 ]
  %208 = phi i64 [ %189, %152 ], [ 0, %150 ], [ %202, %192 ]
  %209 = icmp ugt i32 %207, 7
  br i1 %209, label %212, label %210

210:                                              ; preds = %205
  %211 = icmp eq i32 %207, 0
  br i1 %211, label %265, label %252

212:                                              ; preds = %205
  %213 = load i8, i8 addrspace(4)* %206, align 1, !tbaa !19
  %214 = zext i8 %213 to i64
  %215 = getelementptr inbounds i8, i8 addrspace(4)* %206, i64 1
  %216 = load i8, i8 addrspace(4)* %215, align 1, !tbaa !19
  %217 = zext i8 %216 to i64
  %218 = shl nuw nsw i64 %217, 8
  %219 = or i64 %218, %214
  %220 = getelementptr inbounds i8, i8 addrspace(4)* %206, i64 2
  %221 = load i8, i8 addrspace(4)* %220, align 1, !tbaa !19
  %222 = zext i8 %221 to i64
  %223 = shl nuw nsw i64 %222, 16
  %224 = or i64 %219, %223
  %225 = getelementptr inbounds i8, i8 addrspace(4)* %206, i64 3
  %226 = load i8, i8 addrspace(4)* %225, align 1, !tbaa !19
  %227 = zext i8 %226 to i64
  %228 = shl nuw nsw i64 %227, 24
  %229 = or i64 %224, %228
  %230 = getelementptr inbounds i8, i8 addrspace(4)* %206, i64 4
  %231 = load i8, i8 addrspace(4)* %230, align 1, !tbaa !19
  %232 = zext i8 %231 to i64
  %233 = shl nuw nsw i64 %232, 32
  %234 = or i64 %229, %233
  %235 = getelementptr inbounds i8, i8 addrspace(4)* %206, i64 5
  %236 = load i8, i8 addrspace(4)* %235, align 1, !tbaa !19
  %237 = zext i8 %236 to i64
  %238 = shl nuw nsw i64 %237, 40
  %239 = or i64 %234, %238
  %240 = getelementptr inbounds i8, i8 addrspace(4)* %206, i64 6
  %241 = load i8, i8 addrspace(4)* %240, align 1, !tbaa !19
  %242 = zext i8 %241 to i64
  %243 = shl nuw nsw i64 %242, 48
  %244 = or i64 %239, %243
  %245 = getelementptr inbounds i8, i8 addrspace(4)* %206, i64 7
  %246 = load i8, i8 addrspace(4)* %245, align 1, !tbaa !19
  %247 = zext i8 %246 to i64
  %248 = shl nuw i64 %247, 56
  %249 = or i64 %244, %248
  %250 = add nsw i32 %207, -8
  %251 = getelementptr inbounds i8, i8 addrspace(4)* %206, i64 8
  br label %265

252:                                              ; preds = %210, %252
  %253 = phi i32 [ %263, %252 ], [ 0, %210 ]
  %254 = phi i64 [ %262, %252 ], [ 0, %210 ]
  %255 = zext i32 %253 to i64
  %256 = getelementptr inbounds i8, i8 addrspace(4)* %206, i64 %255
  %257 = load i8, i8 addrspace(4)* %256, align 1, !tbaa !19
  %258 = zext i8 %257 to i64
  %259 = shl i32 %253, 3
  %260 = zext i32 %259 to i64
  %261 = shl nuw i64 %258, %260
  %262 = or i64 %261, %254
  %263 = add nuw nsw i32 %253, 1
  %264 = icmp eq i32 %263, %207
  br i1 %264, label %265, label %252

265:                                              ; preds = %252, %212, %210
  %266 = phi i8 addrspace(4)* [ %251, %212 ], [ %206, %210 ], [ %206, %252 ]
  %267 = phi i32 [ %250, %212 ], [ 0, %210 ], [ 0, %252 ]
  %268 = phi i64 [ %249, %212 ], [ 0, %210 ], [ %262, %252 ]
  %269 = icmp ugt i32 %267, 7
  br i1 %269, label %272, label %270

270:                                              ; preds = %265
  %271 = icmp eq i32 %267, 0
  br i1 %271, label %325, label %312

272:                                              ; preds = %265
  %273 = load i8, i8 addrspace(4)* %266, align 1, !tbaa !19
  %274 = zext i8 %273 to i64
  %275 = getelementptr inbounds i8, i8 addrspace(4)* %266, i64 1
  %276 = load i8, i8 addrspace(4)* %275, align 1, !tbaa !19
  %277 = zext i8 %276 to i64
  %278 = shl nuw nsw i64 %277, 8
  %279 = or i64 %278, %274
  %280 = getelementptr inbounds i8, i8 addrspace(4)* %266, i64 2
  %281 = load i8, i8 addrspace(4)* %280, align 1, !tbaa !19
  %282 = zext i8 %281 to i64
  %283 = shl nuw nsw i64 %282, 16
  %284 = or i64 %279, %283
  %285 = getelementptr inbounds i8, i8 addrspace(4)* %266, i64 3
  %286 = load i8, i8 addrspace(4)* %285, align 1, !tbaa !19
  %287 = zext i8 %286 to i64
  %288 = shl nuw nsw i64 %287, 24
  %289 = or i64 %284, %288
  %290 = getelementptr inbounds i8, i8 addrspace(4)* %266, i64 4
  %291 = load i8, i8 addrspace(4)* %290, align 1, !tbaa !19
  %292 = zext i8 %291 to i64
  %293 = shl nuw nsw i64 %292, 32
  %294 = or i64 %289, %293
  %295 = getelementptr inbounds i8, i8 addrspace(4)* %266, i64 5
  %296 = load i8, i8 addrspace(4)* %295, align 1, !tbaa !19
  %297 = zext i8 %296 to i64
  %298 = shl nuw nsw i64 %297, 40
  %299 = or i64 %294, %298
  %300 = getelementptr inbounds i8, i8 addrspace(4)* %266, i64 6
  %301 = load i8, i8 addrspace(4)* %300, align 1, !tbaa !19
  %302 = zext i8 %301 to i64
  %303 = shl nuw nsw i64 %302, 48
  %304 = or i64 %299, %303
  %305 = getelementptr inbounds i8, i8 addrspace(4)* %266, i64 7
  %306 = load i8, i8 addrspace(4)* %305, align 1, !tbaa !19
  %307 = zext i8 %306 to i64
  %308 = shl nuw i64 %307, 56
  %309 = or i64 %304, %308
  %310 = add nsw i32 %267, -8
  %311 = getelementptr inbounds i8, i8 addrspace(4)* %266, i64 8
  br label %325

312:                                              ; preds = %270, %312
  %313 = phi i32 [ %323, %312 ], [ 0, %270 ]
  %314 = phi i64 [ %322, %312 ], [ 0, %270 ]
  %315 = zext i32 %313 to i64
  %316 = getelementptr inbounds i8, i8 addrspace(4)* %266, i64 %315
  %317 = load i8, i8 addrspace(4)* %316, align 1, !tbaa !19
  %318 = zext i8 %317 to i64
  %319 = shl i32 %313, 3
  %320 = zext i32 %319 to i64
  %321 = shl nuw i64 %318, %320
  %322 = or i64 %321, %314
  %323 = add nuw nsw i32 %313, 1
  %324 = icmp eq i32 %323, %267
  br i1 %324, label %325, label %312

325:                                              ; preds = %312, %272, %270
  %326 = phi i8 addrspace(4)* [ %311, %272 ], [ %266, %270 ], [ %266, %312 ]
  %327 = phi i32 [ %310, %272 ], [ 0, %270 ], [ 0, %312 ]
  %328 = phi i64 [ %309, %272 ], [ 0, %270 ], [ %322, %312 ]
  %329 = icmp ugt i32 %327, 7
  br i1 %329, label %332, label %330

330:                                              ; preds = %325
  %331 = icmp eq i32 %327, 0
  br i1 %331, label %385, label %372

332:                                              ; preds = %325
  %333 = load i8, i8 addrspace(4)* %326, align 1, !tbaa !19
  %334 = zext i8 %333 to i64
  %335 = getelementptr inbounds i8, i8 addrspace(4)* %326, i64 1
  %336 = load i8, i8 addrspace(4)* %335, align 1, !tbaa !19
  %337 = zext i8 %336 to i64
  %338 = shl nuw nsw i64 %337, 8
  %339 = or i64 %338, %334
  %340 = getelementptr inbounds i8, i8 addrspace(4)* %326, i64 2
  %341 = load i8, i8 addrspace(4)* %340, align 1, !tbaa !19
  %342 = zext i8 %341 to i64
  %343 = shl nuw nsw i64 %342, 16
  %344 = or i64 %339, %343
  %345 = getelementptr inbounds i8, i8 addrspace(4)* %326, i64 3
  %346 = load i8, i8 addrspace(4)* %345, align 1, !tbaa !19
  %347 = zext i8 %346 to i64
  %348 = shl nuw nsw i64 %347, 24
  %349 = or i64 %344, %348
  %350 = getelementptr inbounds i8, i8 addrspace(4)* %326, i64 4
  %351 = load i8, i8 addrspace(4)* %350, align 1, !tbaa !19
  %352 = zext i8 %351 to i64
  %353 = shl nuw nsw i64 %352, 32
  %354 = or i64 %349, %353
  %355 = getelementptr inbounds i8, i8 addrspace(4)* %326, i64 5
  %356 = load i8, i8 addrspace(4)* %355, align 1, !tbaa !19
  %357 = zext i8 %356 to i64
  %358 = shl nuw nsw i64 %357, 40
  %359 = or i64 %354, %358
  %360 = getelementptr inbounds i8, i8 addrspace(4)* %326, i64 6
  %361 = load i8, i8 addrspace(4)* %360, align 1, !tbaa !19
  %362 = zext i8 %361 to i64
  %363 = shl nuw nsw i64 %362, 48
  %364 = or i64 %359, %363
  %365 = getelementptr inbounds i8, i8 addrspace(4)* %326, i64 7
  %366 = load i8, i8 addrspace(4)* %365, align 1, !tbaa !19
  %367 = zext i8 %366 to i64
  %368 = shl nuw i64 %367, 56
  %369 = or i64 %364, %368
  %370 = add nsw i32 %327, -8
  %371 = getelementptr inbounds i8, i8 addrspace(4)* %326, i64 8
  br label %385

372:                                              ; preds = %330, %372
  %373 = phi i32 [ %383, %372 ], [ 0, %330 ]
  %374 = phi i64 [ %382, %372 ], [ 0, %330 ]
  %375 = zext i32 %373 to i64
  %376 = getelementptr inbounds i8, i8 addrspace(4)* %326, i64 %375
  %377 = load i8, i8 addrspace(4)* %376, align 1, !tbaa !19
  %378 = zext i8 %377 to i64
  %379 = shl i32 %373, 3
  %380 = zext i32 %379 to i64
  %381 = shl nuw i64 %378, %380
  %382 = or i64 %381, %374
  %383 = add nuw nsw i32 %373, 1
  %384 = icmp eq i32 %383, %327
  br i1 %384, label %385, label %372

385:                                              ; preds = %372, %332, %330
  %386 = phi i8 addrspace(4)* [ %371, %332 ], [ %326, %330 ], [ %326, %372 ]
  %387 = phi i32 [ %370, %332 ], [ 0, %330 ], [ 0, %372 ]
  %388 = phi i64 [ %369, %332 ], [ 0, %330 ], [ %382, %372 ]
  %389 = icmp ugt i32 %387, 7
  br i1 %389, label %392, label %390

390:                                              ; preds = %385
  %391 = icmp eq i32 %387, 0
  br i1 %391, label %445, label %432

392:                                              ; preds = %385
  %393 = load i8, i8 addrspace(4)* %386, align 1, !tbaa !19
  %394 = zext i8 %393 to i64
  %395 = getelementptr inbounds i8, i8 addrspace(4)* %386, i64 1
  %396 = load i8, i8 addrspace(4)* %395, align 1, !tbaa !19
  %397 = zext i8 %396 to i64
  %398 = shl nuw nsw i64 %397, 8
  %399 = or i64 %398, %394
  %400 = getelementptr inbounds i8, i8 addrspace(4)* %386, i64 2
  %401 = load i8, i8 addrspace(4)* %400, align 1, !tbaa !19
  %402 = zext i8 %401 to i64
  %403 = shl nuw nsw i64 %402, 16
  %404 = or i64 %399, %403
  %405 = getelementptr inbounds i8, i8 addrspace(4)* %386, i64 3
  %406 = load i8, i8 addrspace(4)* %405, align 1, !tbaa !19
  %407 = zext i8 %406 to i64
  %408 = shl nuw nsw i64 %407, 24
  %409 = or i64 %404, %408
  %410 = getelementptr inbounds i8, i8 addrspace(4)* %386, i64 4
  %411 = load i8, i8 addrspace(4)* %410, align 1, !tbaa !19
  %412 = zext i8 %411 to i64
  %413 = shl nuw nsw i64 %412, 32
  %414 = or i64 %409, %413
  %415 = getelementptr inbounds i8, i8 addrspace(4)* %386, i64 5
  %416 = load i8, i8 addrspace(4)* %415, align 1, !tbaa !19
  %417 = zext i8 %416 to i64
  %418 = shl nuw nsw i64 %417, 40
  %419 = or i64 %414, %418
  %420 = getelementptr inbounds i8, i8 addrspace(4)* %386, i64 6
  %421 = load i8, i8 addrspace(4)* %420, align 1, !tbaa !19
  %422 = zext i8 %421 to i64
  %423 = shl nuw nsw i64 %422, 48
  %424 = or i64 %419, %423
  %425 = getelementptr inbounds i8, i8 addrspace(4)* %386, i64 7
  %426 = load i8, i8 addrspace(4)* %425, align 1, !tbaa !19
  %427 = zext i8 %426 to i64
  %428 = shl nuw i64 %427, 56
  %429 = or i64 %424, %428
  %430 = add nsw i32 %387, -8
  %431 = getelementptr inbounds i8, i8 addrspace(4)* %386, i64 8
  br label %445

432:                                              ; preds = %390, %432
  %433 = phi i32 [ %443, %432 ], [ 0, %390 ]
  %434 = phi i64 [ %442, %432 ], [ 0, %390 ]
  %435 = zext i32 %433 to i64
  %436 = getelementptr inbounds i8, i8 addrspace(4)* %386, i64 %435
  %437 = load i8, i8 addrspace(4)* %436, align 1, !tbaa !19
  %438 = zext i8 %437 to i64
  %439 = shl i32 %433, 3
  %440 = zext i32 %439 to i64
  %441 = shl nuw i64 %438, %440
  %442 = or i64 %441, %434
  %443 = add nuw nsw i32 %433, 1
  %444 = icmp eq i32 %443, %387
  br i1 %444, label %445, label %432

445:                                              ; preds = %432, %392, %390
  %446 = phi i8 addrspace(4)* [ %431, %392 ], [ %386, %390 ], [ %386, %432 ]
  %447 = phi i32 [ %430, %392 ], [ 0, %390 ], [ 0, %432 ]
  %448 = phi i64 [ %429, %392 ], [ 0, %390 ], [ %442, %432 ]
  %449 = icmp ugt i32 %447, 7
  br i1 %449, label %452, label %450

450:                                              ; preds = %445
  %451 = icmp eq i32 %447, 0
  br i1 %451, label %503, label %490

452:                                              ; preds = %445
  %453 = load i8, i8 addrspace(4)* %446, align 1, !tbaa !19
  %454 = zext i8 %453 to i64
  %455 = getelementptr inbounds i8, i8 addrspace(4)* %446, i64 1
  %456 = load i8, i8 addrspace(4)* %455, align 1, !tbaa !19
  %457 = zext i8 %456 to i64
  %458 = shl nuw nsw i64 %457, 8
  %459 = or i64 %458, %454
  %460 = getelementptr inbounds i8, i8 addrspace(4)* %446, i64 2
  %461 = load i8, i8 addrspace(4)* %460, align 1, !tbaa !19
  %462 = zext i8 %461 to i64
  %463 = shl nuw nsw i64 %462, 16
  %464 = or i64 %459, %463
  %465 = getelementptr inbounds i8, i8 addrspace(4)* %446, i64 3
  %466 = load i8, i8 addrspace(4)* %465, align 1, !tbaa !19
  %467 = zext i8 %466 to i64
  %468 = shl nuw nsw i64 %467, 24
  %469 = or i64 %464, %468
  %470 = getelementptr inbounds i8, i8 addrspace(4)* %446, i64 4
  %471 = load i8, i8 addrspace(4)* %470, align 1, !tbaa !19
  %472 = zext i8 %471 to i64
  %473 = shl nuw nsw i64 %472, 32
  %474 = or i64 %469, %473
  %475 = getelementptr inbounds i8, i8 addrspace(4)* %446, i64 5
  %476 = load i8, i8 addrspace(4)* %475, align 1, !tbaa !19
  %477 = zext i8 %476 to i64
  %478 = shl nuw nsw i64 %477, 40
  %479 = or i64 %474, %478
  %480 = getelementptr inbounds i8, i8 addrspace(4)* %446, i64 6
  %481 = load i8, i8 addrspace(4)* %480, align 1, !tbaa !19
  %482 = zext i8 %481 to i64
  %483 = shl nuw nsw i64 %482, 48
  %484 = or i64 %479, %483
  %485 = getelementptr inbounds i8, i8 addrspace(4)* %446, i64 7
  %486 = load i8, i8 addrspace(4)* %485, align 1, !tbaa !19
  %487 = zext i8 %486 to i64
  %488 = shl nuw i64 %487, 56
  %489 = or i64 %484, %488
  br label %503

490:                                              ; preds = %450, %490
  %491 = phi i32 [ %501, %490 ], [ 0, %450 ]
  %492 = phi i64 [ %500, %490 ], [ 0, %450 ]
  %493 = zext i32 %491 to i64
  %494 = getelementptr inbounds i8, i8 addrspace(4)* %446, i64 %493
  %495 = load i8, i8 addrspace(4)* %494, align 1, !tbaa !19
  %496 = zext i8 %495 to i64
  %497 = shl i32 %491, 3
  %498 = zext i32 %497 to i64
  %499 = shl nuw i64 %496, %498
  %500 = or i64 %499, %492
  %501 = add nuw nsw i32 %491, 1
  %502 = icmp eq i32 %501, %447
  br i1 %502, label %503, label %490

503:                                              ; preds = %490, %452, %450
  %504 = phi i64 [ %489, %452 ], [ 0, %450 ], [ %500, %490 ]
  %505 = shl nuw nsw i64 %86, 2
  %506 = add nuw nsw i64 %505, 28
  %507 = and i64 %506, 480
  %508 = and i64 %88, -225
  %509 = or i64 %508, %507
  %510 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef %509, i64 noundef %148, i64 noundef %208, i64 noundef %268, i64 noundef %328, i64 noundef %388, i64 noundef %448, i64 noundef %504) #10
  %511 = sub i64 %78, %86
  %512 = getelementptr inbounds i8, i8 addrspace(4)* %79, i64 %86
  %513 = icmp eq i64 %511, 0
  br i1 %513, label %514, label %77

514:                                              ; preds = %503, %69
  %515 = phi <2 x i64> [ %72, %69 ], [ %510, %503 ]
  %516 = extractelement <2 x i64> %515, i64 0
  %517 = zext i32 %32 to i64
  %518 = and i64 %516, -225
  %519 = or i64 %518, 32
  %520 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef %519, i64 noundef %517, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %521 = extractelement <2 x i64> %520, i64 0
  %522 = zext i32 %37 to i64
  %523 = and i64 %521, -225
  %524 = or i64 %523, 32
  %525 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef %524, i64 noundef %522, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %526 = extractelement <2 x i64> %525, i64 0
  %527 = zext i32 %43 to i64
  %528 = and i64 %526, -227
  %529 = or i64 %528, 34
  %530 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef %529, i64 noundef %527, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %531 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %532 = extractelement <2 x i64> %531, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([39 x i8], [39 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %533, label %537

533:                                              ; preds = %514
  %534 = and i64 %532, -225
  %535 = or i64 %534, 32
  %536 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef %535, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %978

537:                                              ; preds = %514
  %538 = and i64 %532, 2
  %539 = and i64 %532, -3
  %540 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %539, i64 0
  br label %541

541:                                              ; preds = %967, %537
  %542 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([39 x i8], [39 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([39 x i8], [39 x i8] addrspace(4)* @.str.1, i64 0, i64 38) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([39 x i8]* addrspacecast ([39 x i8] addrspace(4)* @.str.1 to [39 x i8]*) to i64)), i64 1))), %537 ], [ %975, %967 ]
  %543 = phi i8 addrspace(4)* [ getelementptr inbounds ([39 x i8], [39 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %537 ], [ %976, %967 ]
  %544 = phi <2 x i64> [ %540, %537 ], [ %974, %967 ]
  %545 = icmp ugt i64 %542, 56
  %546 = extractelement <2 x i64> %544, i64 0
  %547 = or i64 %546, %538
  %548 = insertelement <2 x i64> poison, i64 %547, i64 0
  %549 = select i1 %545, <2 x i64> %544, <2 x i64> %548
  %550 = tail call i64 @llvm.umin.i64(i64 %542, i64 56)
  %551 = trunc i64 %550 to i32
  %552 = extractelement <2 x i64> %549, i64 0
  %553 = icmp ugt i32 %551, 7
  br i1 %553, label %556, label %554

554:                                              ; preds = %541
  %555 = icmp eq i32 %551, 0
  br i1 %555, label %609, label %596

556:                                              ; preds = %541
  %557 = load i8, i8 addrspace(4)* %543, align 1, !tbaa !19
  %558 = zext i8 %557 to i64
  %559 = getelementptr inbounds i8, i8 addrspace(4)* %543, i64 1
  %560 = load i8, i8 addrspace(4)* %559, align 1, !tbaa !19
  %561 = zext i8 %560 to i64
  %562 = shl nuw nsw i64 %561, 8
  %563 = or i64 %562, %558
  %564 = getelementptr inbounds i8, i8 addrspace(4)* %543, i64 2
  %565 = load i8, i8 addrspace(4)* %564, align 1, !tbaa !19
  %566 = zext i8 %565 to i64
  %567 = shl nuw nsw i64 %566, 16
  %568 = or i64 %563, %567
  %569 = getelementptr inbounds i8, i8 addrspace(4)* %543, i64 3
  %570 = load i8, i8 addrspace(4)* %569, align 1, !tbaa !19
  %571 = zext i8 %570 to i64
  %572 = shl nuw nsw i64 %571, 24
  %573 = or i64 %568, %572
  %574 = getelementptr inbounds i8, i8 addrspace(4)* %543, i64 4
  %575 = load i8, i8 addrspace(4)* %574, align 1, !tbaa !19
  %576 = zext i8 %575 to i64
  %577 = shl nuw nsw i64 %576, 32
  %578 = or i64 %573, %577
  %579 = getelementptr inbounds i8, i8 addrspace(4)* %543, i64 5
  %580 = load i8, i8 addrspace(4)* %579, align 1, !tbaa !19
  %581 = zext i8 %580 to i64
  %582 = shl nuw nsw i64 %581, 40
  %583 = or i64 %578, %582
  %584 = getelementptr inbounds i8, i8 addrspace(4)* %543, i64 6
  %585 = load i8, i8 addrspace(4)* %584, align 1, !tbaa !19
  %586 = zext i8 %585 to i64
  %587 = shl nuw nsw i64 %586, 48
  %588 = or i64 %583, %587
  %589 = getelementptr inbounds i8, i8 addrspace(4)* %543, i64 7
  %590 = load i8, i8 addrspace(4)* %589, align 1, !tbaa !19
  %591 = zext i8 %590 to i64
  %592 = shl nuw i64 %591, 56
  %593 = or i64 %588, %592
  %594 = add nsw i32 %551, -8
  %595 = getelementptr inbounds i8, i8 addrspace(4)* %543, i64 8
  br label %609

596:                                              ; preds = %554, %596
  %597 = phi i32 [ %607, %596 ], [ 0, %554 ]
  %598 = phi i64 [ %606, %596 ], [ 0, %554 ]
  %599 = zext i32 %597 to i64
  %600 = getelementptr inbounds i8, i8 addrspace(4)* %543, i64 %599
  %601 = load i8, i8 addrspace(4)* %600, align 1, !tbaa !19
  %602 = zext i8 %601 to i64
  %603 = shl i32 %597, 3
  %604 = zext i32 %603 to i64
  %605 = shl nuw i64 %602, %604
  %606 = or i64 %605, %598
  %607 = add nuw nsw i32 %597, 1
  %608 = icmp eq i32 %607, %551
  br i1 %608, label %609, label %596, !llvm.loop !20

609:                                              ; preds = %596, %556, %554
  %610 = phi i8 addrspace(4)* [ %595, %556 ], [ %543, %554 ], [ %543, %596 ]
  %611 = phi i32 [ %594, %556 ], [ 0, %554 ], [ 0, %596 ]
  %612 = phi i64 [ %593, %556 ], [ 0, %554 ], [ %606, %596 ]
  %613 = icmp ugt i32 %611, 7
  br i1 %613, label %616, label %614

614:                                              ; preds = %609
  %615 = icmp eq i32 %611, 0
  br i1 %615, label %669, label %656

616:                                              ; preds = %609
  %617 = load i8, i8 addrspace(4)* %610, align 1, !tbaa !19
  %618 = zext i8 %617 to i64
  %619 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 1
  %620 = load i8, i8 addrspace(4)* %619, align 1, !tbaa !19
  %621 = zext i8 %620 to i64
  %622 = shl nuw nsw i64 %621, 8
  %623 = or i64 %622, %618
  %624 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 2
  %625 = load i8, i8 addrspace(4)* %624, align 1, !tbaa !19
  %626 = zext i8 %625 to i64
  %627 = shl nuw nsw i64 %626, 16
  %628 = or i64 %623, %627
  %629 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 3
  %630 = load i8, i8 addrspace(4)* %629, align 1, !tbaa !19
  %631 = zext i8 %630 to i64
  %632 = shl nuw nsw i64 %631, 24
  %633 = or i64 %628, %632
  %634 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 4
  %635 = load i8, i8 addrspace(4)* %634, align 1, !tbaa !19
  %636 = zext i8 %635 to i64
  %637 = shl nuw nsw i64 %636, 32
  %638 = or i64 %633, %637
  %639 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 5
  %640 = load i8, i8 addrspace(4)* %639, align 1, !tbaa !19
  %641 = zext i8 %640 to i64
  %642 = shl nuw nsw i64 %641, 40
  %643 = or i64 %638, %642
  %644 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 6
  %645 = load i8, i8 addrspace(4)* %644, align 1, !tbaa !19
  %646 = zext i8 %645 to i64
  %647 = shl nuw nsw i64 %646, 48
  %648 = or i64 %643, %647
  %649 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 7
  %650 = load i8, i8 addrspace(4)* %649, align 1, !tbaa !19
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
  %661 = load i8, i8 addrspace(4)* %660, align 1, !tbaa !19
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
  %677 = load i8, i8 addrspace(4)* %670, align 1, !tbaa !19
  %678 = zext i8 %677 to i64
  %679 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 1
  %680 = load i8, i8 addrspace(4)* %679, align 1, !tbaa !19
  %681 = zext i8 %680 to i64
  %682 = shl nuw nsw i64 %681, 8
  %683 = or i64 %682, %678
  %684 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 2
  %685 = load i8, i8 addrspace(4)* %684, align 1, !tbaa !19
  %686 = zext i8 %685 to i64
  %687 = shl nuw nsw i64 %686, 16
  %688 = or i64 %683, %687
  %689 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 3
  %690 = load i8, i8 addrspace(4)* %689, align 1, !tbaa !19
  %691 = zext i8 %690 to i64
  %692 = shl nuw nsw i64 %691, 24
  %693 = or i64 %688, %692
  %694 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 4
  %695 = load i8, i8 addrspace(4)* %694, align 1, !tbaa !19
  %696 = zext i8 %695 to i64
  %697 = shl nuw nsw i64 %696, 32
  %698 = or i64 %693, %697
  %699 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 5
  %700 = load i8, i8 addrspace(4)* %699, align 1, !tbaa !19
  %701 = zext i8 %700 to i64
  %702 = shl nuw nsw i64 %701, 40
  %703 = or i64 %698, %702
  %704 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 6
  %705 = load i8, i8 addrspace(4)* %704, align 1, !tbaa !19
  %706 = zext i8 %705 to i64
  %707 = shl nuw nsw i64 %706, 48
  %708 = or i64 %703, %707
  %709 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 7
  %710 = load i8, i8 addrspace(4)* %709, align 1, !tbaa !19
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
  %721 = load i8, i8 addrspace(4)* %720, align 1, !tbaa !19
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
  %737 = load i8, i8 addrspace(4)* %730, align 1, !tbaa !19
  %738 = zext i8 %737 to i64
  %739 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 1
  %740 = load i8, i8 addrspace(4)* %739, align 1, !tbaa !19
  %741 = zext i8 %740 to i64
  %742 = shl nuw nsw i64 %741, 8
  %743 = or i64 %742, %738
  %744 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 2
  %745 = load i8, i8 addrspace(4)* %744, align 1, !tbaa !19
  %746 = zext i8 %745 to i64
  %747 = shl nuw nsw i64 %746, 16
  %748 = or i64 %743, %747
  %749 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 3
  %750 = load i8, i8 addrspace(4)* %749, align 1, !tbaa !19
  %751 = zext i8 %750 to i64
  %752 = shl nuw nsw i64 %751, 24
  %753 = or i64 %748, %752
  %754 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 4
  %755 = load i8, i8 addrspace(4)* %754, align 1, !tbaa !19
  %756 = zext i8 %755 to i64
  %757 = shl nuw nsw i64 %756, 32
  %758 = or i64 %753, %757
  %759 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 5
  %760 = load i8, i8 addrspace(4)* %759, align 1, !tbaa !19
  %761 = zext i8 %760 to i64
  %762 = shl nuw nsw i64 %761, 40
  %763 = or i64 %758, %762
  %764 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 6
  %765 = load i8, i8 addrspace(4)* %764, align 1, !tbaa !19
  %766 = zext i8 %765 to i64
  %767 = shl nuw nsw i64 %766, 48
  %768 = or i64 %763, %767
  %769 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 7
  %770 = load i8, i8 addrspace(4)* %769, align 1, !tbaa !19
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
  %781 = load i8, i8 addrspace(4)* %780, align 1, !tbaa !19
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
  %797 = load i8, i8 addrspace(4)* %790, align 1, !tbaa !19
  %798 = zext i8 %797 to i64
  %799 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 1
  %800 = load i8, i8 addrspace(4)* %799, align 1, !tbaa !19
  %801 = zext i8 %800 to i64
  %802 = shl nuw nsw i64 %801, 8
  %803 = or i64 %802, %798
  %804 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 2
  %805 = load i8, i8 addrspace(4)* %804, align 1, !tbaa !19
  %806 = zext i8 %805 to i64
  %807 = shl nuw nsw i64 %806, 16
  %808 = or i64 %803, %807
  %809 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 3
  %810 = load i8, i8 addrspace(4)* %809, align 1, !tbaa !19
  %811 = zext i8 %810 to i64
  %812 = shl nuw nsw i64 %811, 24
  %813 = or i64 %808, %812
  %814 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 4
  %815 = load i8, i8 addrspace(4)* %814, align 1, !tbaa !19
  %816 = zext i8 %815 to i64
  %817 = shl nuw nsw i64 %816, 32
  %818 = or i64 %813, %817
  %819 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 5
  %820 = load i8, i8 addrspace(4)* %819, align 1, !tbaa !19
  %821 = zext i8 %820 to i64
  %822 = shl nuw nsw i64 %821, 40
  %823 = or i64 %818, %822
  %824 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 6
  %825 = load i8, i8 addrspace(4)* %824, align 1, !tbaa !19
  %826 = zext i8 %825 to i64
  %827 = shl nuw nsw i64 %826, 48
  %828 = or i64 %823, %827
  %829 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 7
  %830 = load i8, i8 addrspace(4)* %829, align 1, !tbaa !19
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
  %841 = load i8, i8 addrspace(4)* %840, align 1, !tbaa !19
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
  br i1 %855, label %909, label %896

856:                                              ; preds = %849
  %857 = load i8, i8 addrspace(4)* %850, align 1, !tbaa !19
  %858 = zext i8 %857 to i64
  %859 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 1
  %860 = load i8, i8 addrspace(4)* %859, align 1, !tbaa !19
  %861 = zext i8 %860 to i64
  %862 = shl nuw nsw i64 %861, 8
  %863 = or i64 %862, %858
  %864 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 2
  %865 = load i8, i8 addrspace(4)* %864, align 1, !tbaa !19
  %866 = zext i8 %865 to i64
  %867 = shl nuw nsw i64 %866, 16
  %868 = or i64 %863, %867
  %869 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 3
  %870 = load i8, i8 addrspace(4)* %869, align 1, !tbaa !19
  %871 = zext i8 %870 to i64
  %872 = shl nuw nsw i64 %871, 24
  %873 = or i64 %868, %872
  %874 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 4
  %875 = load i8, i8 addrspace(4)* %874, align 1, !tbaa !19
  %876 = zext i8 %875 to i64
  %877 = shl nuw nsw i64 %876, 32
  %878 = or i64 %873, %877
  %879 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 5
  %880 = load i8, i8 addrspace(4)* %879, align 1, !tbaa !19
  %881 = zext i8 %880 to i64
  %882 = shl nuw nsw i64 %881, 40
  %883 = or i64 %878, %882
  %884 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 6
  %885 = load i8, i8 addrspace(4)* %884, align 1, !tbaa !19
  %886 = zext i8 %885 to i64
  %887 = shl nuw nsw i64 %886, 48
  %888 = or i64 %883, %887
  %889 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 7
  %890 = load i8, i8 addrspace(4)* %889, align 1, !tbaa !19
  %891 = zext i8 %890 to i64
  %892 = shl nuw i64 %891, 56
  %893 = or i64 %888, %892
  %894 = add nsw i32 %851, -8
  %895 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 8
  br label %909

896:                                              ; preds = %854, %896
  %897 = phi i32 [ %907, %896 ], [ 0, %854 ]
  %898 = phi i64 [ %906, %896 ], [ 0, %854 ]
  %899 = zext i32 %897 to i64
  %900 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 %899
  %901 = load i8, i8 addrspace(4)* %900, align 1, !tbaa !19
  %902 = zext i8 %901 to i64
  %903 = shl i32 %897, 3
  %904 = zext i32 %903 to i64
  %905 = shl nuw i64 %902, %904
  %906 = or i64 %905, %898
  %907 = add nuw nsw i32 %897, 1
  %908 = icmp eq i32 %907, %851
  br i1 %908, label %909, label %896

909:                                              ; preds = %896, %856, %854
  %910 = phi i8 addrspace(4)* [ %895, %856 ], [ %850, %854 ], [ %850, %896 ]
  %911 = phi i32 [ %894, %856 ], [ 0, %854 ], [ 0, %896 ]
  %912 = phi i64 [ %893, %856 ], [ 0, %854 ], [ %906, %896 ]
  %913 = icmp ugt i32 %911, 7
  br i1 %913, label %916, label %914

914:                                              ; preds = %909
  %915 = icmp eq i32 %911, 0
  br i1 %915, label %967, label %954

916:                                              ; preds = %909
  %917 = load i8, i8 addrspace(4)* %910, align 1, !tbaa !19
  %918 = zext i8 %917 to i64
  %919 = getelementptr inbounds i8, i8 addrspace(4)* %910, i64 1
  %920 = load i8, i8 addrspace(4)* %919, align 1, !tbaa !19
  %921 = zext i8 %920 to i64
  %922 = shl nuw nsw i64 %921, 8
  %923 = or i64 %922, %918
  %924 = getelementptr inbounds i8, i8 addrspace(4)* %910, i64 2
  %925 = load i8, i8 addrspace(4)* %924, align 1, !tbaa !19
  %926 = zext i8 %925 to i64
  %927 = shl nuw nsw i64 %926, 16
  %928 = or i64 %923, %927
  %929 = getelementptr inbounds i8, i8 addrspace(4)* %910, i64 3
  %930 = load i8, i8 addrspace(4)* %929, align 1, !tbaa !19
  %931 = zext i8 %930 to i64
  %932 = shl nuw nsw i64 %931, 24
  %933 = or i64 %928, %932
  %934 = getelementptr inbounds i8, i8 addrspace(4)* %910, i64 4
  %935 = load i8, i8 addrspace(4)* %934, align 1, !tbaa !19
  %936 = zext i8 %935 to i64
  %937 = shl nuw nsw i64 %936, 32
  %938 = or i64 %933, %937
  %939 = getelementptr inbounds i8, i8 addrspace(4)* %910, i64 5
  %940 = load i8, i8 addrspace(4)* %939, align 1, !tbaa !19
  %941 = zext i8 %940 to i64
  %942 = shl nuw nsw i64 %941, 40
  %943 = or i64 %938, %942
  %944 = getelementptr inbounds i8, i8 addrspace(4)* %910, i64 6
  %945 = load i8, i8 addrspace(4)* %944, align 1, !tbaa !19
  %946 = zext i8 %945 to i64
  %947 = shl nuw nsw i64 %946, 48
  %948 = or i64 %943, %947
  %949 = getelementptr inbounds i8, i8 addrspace(4)* %910, i64 7
  %950 = load i8, i8 addrspace(4)* %949, align 1, !tbaa !19
  %951 = zext i8 %950 to i64
  %952 = shl nuw i64 %951, 56
  %953 = or i64 %948, %952
  br label %967

954:                                              ; preds = %914, %954
  %955 = phi i32 [ %965, %954 ], [ 0, %914 ]
  %956 = phi i64 [ %964, %954 ], [ 0, %914 ]
  %957 = zext i32 %955 to i64
  %958 = getelementptr inbounds i8, i8 addrspace(4)* %910, i64 %957
  %959 = load i8, i8 addrspace(4)* %958, align 1, !tbaa !19
  %960 = zext i8 %959 to i64
  %961 = shl i32 %955, 3
  %962 = zext i32 %961 to i64
  %963 = shl nuw i64 %960, %962
  %964 = or i64 %963, %956
  %965 = add nuw nsw i32 %955, 1
  %966 = icmp eq i32 %965, %911
  br i1 %966, label %967, label %954

967:                                              ; preds = %954, %916, %914
  %968 = phi i64 [ %953, %916 ], [ 0, %914 ], [ %964, %954 ]
  %969 = shl nuw nsw i64 %550, 2
  %970 = add nuw nsw i64 %969, 28
  %971 = and i64 %970, 480
  %972 = and i64 %552, -225
  %973 = or i64 %972, %971
  %974 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef %973, i64 noundef %612, i64 noundef %672, i64 noundef %732, i64 noundef %792, i64 noundef %852, i64 noundef %912, i64 noundef %968) #10
  %975 = sub i64 %542, %550
  %976 = getelementptr inbounds i8, i8 addrspace(4)* %543, i64 %550
  %977 = icmp eq i64 %975, 0
  br i1 %977, label %978, label %541

978:                                              ; preds = %967, %533
  %979 = phi <2 x i64> [ %536, %533 ], [ %974, %967 ]
  %980 = extractelement <2 x i64> %979, i64 0
  %981 = zext i16 %5 to i64
  %982 = and i64 %980, -225
  %983 = or i64 %982, 32
  %984 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef %983, i64 noundef %981, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %985 = extractelement <2 x i64> %984, i64 0
  %986 = zext i16 %13 to i64
  %987 = and i64 %985, -225
  %988 = or i64 %987, 32
  %989 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef %988, i64 noundef %986, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %990 = extractelement <2 x i64> %989, i64 0
  %991 = zext i16 %22 to i64
  %992 = and i64 %990, -227
  %993 = or i64 %992, 34
  %994 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef %993, i64 noundef %991, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %995 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %996 = extractelement <2 x i64> %995, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), label %997, label %1001

997:                                              ; preds = %978
  %998 = and i64 %996, -225
  %999 = or i64 %998, 32
  %1000 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef %999, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %1442

1001:                                             ; preds = %978
  %1002 = and i64 %996, 2
  %1003 = and i64 %996, -3
  %1004 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1003, i64 0
  br label %1005

1005:                                             ; preds = %1431, %1001
  %1006 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str.2, i64 0, i64 28) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([29 x i8]* addrspacecast ([29 x i8] addrspace(4)* @.str.2 to [29 x i8]*) to i64)), i64 1))), %1001 ], [ %1439, %1431 ]
  %1007 = phi i8 addrspace(4)* [ getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str.2, i64 0, i64 0), %1001 ], [ %1440, %1431 ]
  %1008 = phi <2 x i64> [ %1004, %1001 ], [ %1438, %1431 ]
  %1009 = icmp ugt i64 %1006, 56
  %1010 = extractelement <2 x i64> %1008, i64 0
  %1011 = or i64 %1010, %1002
  %1012 = insertelement <2 x i64> poison, i64 %1011, i64 0
  %1013 = select i1 %1009, <2 x i64> %1008, <2 x i64> %1012
  %1014 = tail call i64 @llvm.umin.i64(i64 %1006, i64 56)
  %1015 = trunc i64 %1014 to i32
  %1016 = extractelement <2 x i64> %1013, i64 0
  %1017 = icmp ugt i32 %1015, 7
  br i1 %1017, label %1020, label %1018

1018:                                             ; preds = %1005
  %1019 = icmp eq i32 %1015, 0
  br i1 %1019, label %1073, label %1060

1020:                                             ; preds = %1005
  %1021 = load i8, i8 addrspace(4)* %1007, align 1, !tbaa !19
  %1022 = zext i8 %1021 to i64
  %1023 = getelementptr inbounds i8, i8 addrspace(4)* %1007, i64 1
  %1024 = load i8, i8 addrspace(4)* %1023, align 1, !tbaa !19
  %1025 = zext i8 %1024 to i64
  %1026 = shl nuw nsw i64 %1025, 8
  %1027 = or i64 %1026, %1022
  %1028 = getelementptr inbounds i8, i8 addrspace(4)* %1007, i64 2
  %1029 = load i8, i8 addrspace(4)* %1028, align 1, !tbaa !19
  %1030 = zext i8 %1029 to i64
  %1031 = shl nuw nsw i64 %1030, 16
  %1032 = or i64 %1027, %1031
  %1033 = getelementptr inbounds i8, i8 addrspace(4)* %1007, i64 3
  %1034 = load i8, i8 addrspace(4)* %1033, align 1, !tbaa !19
  %1035 = zext i8 %1034 to i64
  %1036 = shl nuw nsw i64 %1035, 24
  %1037 = or i64 %1032, %1036
  %1038 = getelementptr inbounds i8, i8 addrspace(4)* %1007, i64 4
  %1039 = load i8, i8 addrspace(4)* %1038, align 1, !tbaa !19
  %1040 = zext i8 %1039 to i64
  %1041 = shl nuw nsw i64 %1040, 32
  %1042 = or i64 %1037, %1041
  %1043 = getelementptr inbounds i8, i8 addrspace(4)* %1007, i64 5
  %1044 = load i8, i8 addrspace(4)* %1043, align 1, !tbaa !19
  %1045 = zext i8 %1044 to i64
  %1046 = shl nuw nsw i64 %1045, 40
  %1047 = or i64 %1042, %1046
  %1048 = getelementptr inbounds i8, i8 addrspace(4)* %1007, i64 6
  %1049 = load i8, i8 addrspace(4)* %1048, align 1, !tbaa !19
  %1050 = zext i8 %1049 to i64
  %1051 = shl nuw nsw i64 %1050, 48
  %1052 = or i64 %1047, %1051
  %1053 = getelementptr inbounds i8, i8 addrspace(4)* %1007, i64 7
  %1054 = load i8, i8 addrspace(4)* %1053, align 1, !tbaa !19
  %1055 = zext i8 %1054 to i64
  %1056 = shl nuw i64 %1055, 56
  %1057 = or i64 %1052, %1056
  %1058 = add nsw i32 %1015, -8
  %1059 = getelementptr inbounds i8, i8 addrspace(4)* %1007, i64 8
  br label %1073

1060:                                             ; preds = %1018, %1060
  %1061 = phi i32 [ %1071, %1060 ], [ 0, %1018 ]
  %1062 = phi i64 [ %1070, %1060 ], [ 0, %1018 ]
  %1063 = zext i32 %1061 to i64
  %1064 = getelementptr inbounds i8, i8 addrspace(4)* %1007, i64 %1063
  %1065 = load i8, i8 addrspace(4)* %1064, align 1, !tbaa !19
  %1066 = zext i8 %1065 to i64
  %1067 = shl i32 %1061, 3
  %1068 = zext i32 %1067 to i64
  %1069 = shl nuw i64 %1066, %1068
  %1070 = or i64 %1069, %1062
  %1071 = add nuw nsw i32 %1061, 1
  %1072 = icmp eq i32 %1071, %1015
  br i1 %1072, label %1073, label %1060, !llvm.loop !20

1073:                                             ; preds = %1060, %1020, %1018
  %1074 = phi i8 addrspace(4)* [ %1059, %1020 ], [ %1007, %1018 ], [ %1007, %1060 ]
  %1075 = phi i32 [ %1058, %1020 ], [ 0, %1018 ], [ 0, %1060 ]
  %1076 = phi i64 [ %1057, %1020 ], [ 0, %1018 ], [ %1070, %1060 ]
  %1077 = icmp ugt i32 %1075, 7
  br i1 %1077, label %1080, label %1078

1078:                                             ; preds = %1073
  %1079 = icmp eq i32 %1075, 0
  br i1 %1079, label %1133, label %1120

1080:                                             ; preds = %1073
  %1081 = load i8, i8 addrspace(4)* %1074, align 1, !tbaa !19
  %1082 = zext i8 %1081 to i64
  %1083 = getelementptr inbounds i8, i8 addrspace(4)* %1074, i64 1
  %1084 = load i8, i8 addrspace(4)* %1083, align 1, !tbaa !19
  %1085 = zext i8 %1084 to i64
  %1086 = shl nuw nsw i64 %1085, 8
  %1087 = or i64 %1086, %1082
  %1088 = getelementptr inbounds i8, i8 addrspace(4)* %1074, i64 2
  %1089 = load i8, i8 addrspace(4)* %1088, align 1, !tbaa !19
  %1090 = zext i8 %1089 to i64
  %1091 = shl nuw nsw i64 %1090, 16
  %1092 = or i64 %1087, %1091
  %1093 = getelementptr inbounds i8, i8 addrspace(4)* %1074, i64 3
  %1094 = load i8, i8 addrspace(4)* %1093, align 1, !tbaa !19
  %1095 = zext i8 %1094 to i64
  %1096 = shl nuw nsw i64 %1095, 24
  %1097 = or i64 %1092, %1096
  %1098 = getelementptr inbounds i8, i8 addrspace(4)* %1074, i64 4
  %1099 = load i8, i8 addrspace(4)* %1098, align 1, !tbaa !19
  %1100 = zext i8 %1099 to i64
  %1101 = shl nuw nsw i64 %1100, 32
  %1102 = or i64 %1097, %1101
  %1103 = getelementptr inbounds i8, i8 addrspace(4)* %1074, i64 5
  %1104 = load i8, i8 addrspace(4)* %1103, align 1, !tbaa !19
  %1105 = zext i8 %1104 to i64
  %1106 = shl nuw nsw i64 %1105, 40
  %1107 = or i64 %1102, %1106
  %1108 = getelementptr inbounds i8, i8 addrspace(4)* %1074, i64 6
  %1109 = load i8, i8 addrspace(4)* %1108, align 1, !tbaa !19
  %1110 = zext i8 %1109 to i64
  %1111 = shl nuw nsw i64 %1110, 48
  %1112 = or i64 %1107, %1111
  %1113 = getelementptr inbounds i8, i8 addrspace(4)* %1074, i64 7
  %1114 = load i8, i8 addrspace(4)* %1113, align 1, !tbaa !19
  %1115 = zext i8 %1114 to i64
  %1116 = shl nuw i64 %1115, 56
  %1117 = or i64 %1112, %1116
  %1118 = add nsw i32 %1075, -8
  %1119 = getelementptr inbounds i8, i8 addrspace(4)* %1074, i64 8
  br label %1133

1120:                                             ; preds = %1078, %1120
  %1121 = phi i32 [ %1131, %1120 ], [ 0, %1078 ]
  %1122 = phi i64 [ %1130, %1120 ], [ 0, %1078 ]
  %1123 = zext i32 %1121 to i64
  %1124 = getelementptr inbounds i8, i8 addrspace(4)* %1074, i64 %1123
  %1125 = load i8, i8 addrspace(4)* %1124, align 1, !tbaa !19
  %1126 = zext i8 %1125 to i64
  %1127 = shl i32 %1121, 3
  %1128 = zext i32 %1127 to i64
  %1129 = shl nuw i64 %1126, %1128
  %1130 = or i64 %1129, %1122
  %1131 = add nuw nsw i32 %1121, 1
  %1132 = icmp eq i32 %1131, %1075
  br i1 %1132, label %1133, label %1120

1133:                                             ; preds = %1120, %1080, %1078
  %1134 = phi i8 addrspace(4)* [ %1119, %1080 ], [ %1074, %1078 ], [ %1074, %1120 ]
  %1135 = phi i32 [ %1118, %1080 ], [ 0, %1078 ], [ 0, %1120 ]
  %1136 = phi i64 [ %1117, %1080 ], [ 0, %1078 ], [ %1130, %1120 ]
  %1137 = icmp ugt i32 %1135, 7
  br i1 %1137, label %1140, label %1138

1138:                                             ; preds = %1133
  %1139 = icmp eq i32 %1135, 0
  br i1 %1139, label %1193, label %1180

1140:                                             ; preds = %1133
  %1141 = load i8, i8 addrspace(4)* %1134, align 1, !tbaa !19
  %1142 = zext i8 %1141 to i64
  %1143 = getelementptr inbounds i8, i8 addrspace(4)* %1134, i64 1
  %1144 = load i8, i8 addrspace(4)* %1143, align 1, !tbaa !19
  %1145 = zext i8 %1144 to i64
  %1146 = shl nuw nsw i64 %1145, 8
  %1147 = or i64 %1146, %1142
  %1148 = getelementptr inbounds i8, i8 addrspace(4)* %1134, i64 2
  %1149 = load i8, i8 addrspace(4)* %1148, align 1, !tbaa !19
  %1150 = zext i8 %1149 to i64
  %1151 = shl nuw nsw i64 %1150, 16
  %1152 = or i64 %1147, %1151
  %1153 = getelementptr inbounds i8, i8 addrspace(4)* %1134, i64 3
  %1154 = load i8, i8 addrspace(4)* %1153, align 1, !tbaa !19
  %1155 = zext i8 %1154 to i64
  %1156 = shl nuw nsw i64 %1155, 24
  %1157 = or i64 %1152, %1156
  %1158 = getelementptr inbounds i8, i8 addrspace(4)* %1134, i64 4
  %1159 = load i8, i8 addrspace(4)* %1158, align 1, !tbaa !19
  %1160 = zext i8 %1159 to i64
  %1161 = shl nuw nsw i64 %1160, 32
  %1162 = or i64 %1157, %1161
  %1163 = getelementptr inbounds i8, i8 addrspace(4)* %1134, i64 5
  %1164 = load i8, i8 addrspace(4)* %1163, align 1, !tbaa !19
  %1165 = zext i8 %1164 to i64
  %1166 = shl nuw nsw i64 %1165, 40
  %1167 = or i64 %1162, %1166
  %1168 = getelementptr inbounds i8, i8 addrspace(4)* %1134, i64 6
  %1169 = load i8, i8 addrspace(4)* %1168, align 1, !tbaa !19
  %1170 = zext i8 %1169 to i64
  %1171 = shl nuw nsw i64 %1170, 48
  %1172 = or i64 %1167, %1171
  %1173 = getelementptr inbounds i8, i8 addrspace(4)* %1134, i64 7
  %1174 = load i8, i8 addrspace(4)* %1173, align 1, !tbaa !19
  %1175 = zext i8 %1174 to i64
  %1176 = shl nuw i64 %1175, 56
  %1177 = or i64 %1172, %1176
  %1178 = add nsw i32 %1135, -8
  %1179 = getelementptr inbounds i8, i8 addrspace(4)* %1134, i64 8
  br label %1193

1180:                                             ; preds = %1138, %1180
  %1181 = phi i32 [ %1191, %1180 ], [ 0, %1138 ]
  %1182 = phi i64 [ %1190, %1180 ], [ 0, %1138 ]
  %1183 = zext i32 %1181 to i64
  %1184 = getelementptr inbounds i8, i8 addrspace(4)* %1134, i64 %1183
  %1185 = load i8, i8 addrspace(4)* %1184, align 1, !tbaa !19
  %1186 = zext i8 %1185 to i64
  %1187 = shl i32 %1181, 3
  %1188 = zext i32 %1187 to i64
  %1189 = shl nuw i64 %1186, %1188
  %1190 = or i64 %1189, %1182
  %1191 = add nuw nsw i32 %1181, 1
  %1192 = icmp eq i32 %1191, %1135
  br i1 %1192, label %1193, label %1180

1193:                                             ; preds = %1180, %1140, %1138
  %1194 = phi i8 addrspace(4)* [ %1179, %1140 ], [ %1134, %1138 ], [ %1134, %1180 ]
  %1195 = phi i32 [ %1178, %1140 ], [ 0, %1138 ], [ 0, %1180 ]
  %1196 = phi i64 [ %1177, %1140 ], [ 0, %1138 ], [ %1190, %1180 ]
  %1197 = icmp ugt i32 %1195, 7
  br i1 %1197, label %1200, label %1198

1198:                                             ; preds = %1193
  %1199 = icmp eq i32 %1195, 0
  br i1 %1199, label %1253, label %1240

1200:                                             ; preds = %1193
  %1201 = load i8, i8 addrspace(4)* %1194, align 1, !tbaa !19
  %1202 = zext i8 %1201 to i64
  %1203 = getelementptr inbounds i8, i8 addrspace(4)* %1194, i64 1
  %1204 = load i8, i8 addrspace(4)* %1203, align 1, !tbaa !19
  %1205 = zext i8 %1204 to i64
  %1206 = shl nuw nsw i64 %1205, 8
  %1207 = or i64 %1206, %1202
  %1208 = getelementptr inbounds i8, i8 addrspace(4)* %1194, i64 2
  %1209 = load i8, i8 addrspace(4)* %1208, align 1, !tbaa !19
  %1210 = zext i8 %1209 to i64
  %1211 = shl nuw nsw i64 %1210, 16
  %1212 = or i64 %1207, %1211
  %1213 = getelementptr inbounds i8, i8 addrspace(4)* %1194, i64 3
  %1214 = load i8, i8 addrspace(4)* %1213, align 1, !tbaa !19
  %1215 = zext i8 %1214 to i64
  %1216 = shl nuw nsw i64 %1215, 24
  %1217 = or i64 %1212, %1216
  %1218 = getelementptr inbounds i8, i8 addrspace(4)* %1194, i64 4
  %1219 = load i8, i8 addrspace(4)* %1218, align 1, !tbaa !19
  %1220 = zext i8 %1219 to i64
  %1221 = shl nuw nsw i64 %1220, 32
  %1222 = or i64 %1217, %1221
  %1223 = getelementptr inbounds i8, i8 addrspace(4)* %1194, i64 5
  %1224 = load i8, i8 addrspace(4)* %1223, align 1, !tbaa !19
  %1225 = zext i8 %1224 to i64
  %1226 = shl nuw nsw i64 %1225, 40
  %1227 = or i64 %1222, %1226
  %1228 = getelementptr inbounds i8, i8 addrspace(4)* %1194, i64 6
  %1229 = load i8, i8 addrspace(4)* %1228, align 1, !tbaa !19
  %1230 = zext i8 %1229 to i64
  %1231 = shl nuw nsw i64 %1230, 48
  %1232 = or i64 %1227, %1231
  %1233 = getelementptr inbounds i8, i8 addrspace(4)* %1194, i64 7
  %1234 = load i8, i8 addrspace(4)* %1233, align 1, !tbaa !19
  %1235 = zext i8 %1234 to i64
  %1236 = shl nuw i64 %1235, 56
  %1237 = or i64 %1232, %1236
  %1238 = add nsw i32 %1195, -8
  %1239 = getelementptr inbounds i8, i8 addrspace(4)* %1194, i64 8
  br label %1253

1240:                                             ; preds = %1198, %1240
  %1241 = phi i32 [ %1251, %1240 ], [ 0, %1198 ]
  %1242 = phi i64 [ %1250, %1240 ], [ 0, %1198 ]
  %1243 = zext i32 %1241 to i64
  %1244 = getelementptr inbounds i8, i8 addrspace(4)* %1194, i64 %1243
  %1245 = load i8, i8 addrspace(4)* %1244, align 1, !tbaa !19
  %1246 = zext i8 %1245 to i64
  %1247 = shl i32 %1241, 3
  %1248 = zext i32 %1247 to i64
  %1249 = shl nuw i64 %1246, %1248
  %1250 = or i64 %1249, %1242
  %1251 = add nuw nsw i32 %1241, 1
  %1252 = icmp eq i32 %1251, %1195
  br i1 %1252, label %1253, label %1240

1253:                                             ; preds = %1240, %1200, %1198
  %1254 = phi i8 addrspace(4)* [ %1239, %1200 ], [ %1194, %1198 ], [ %1194, %1240 ]
  %1255 = phi i32 [ %1238, %1200 ], [ 0, %1198 ], [ 0, %1240 ]
  %1256 = phi i64 [ %1237, %1200 ], [ 0, %1198 ], [ %1250, %1240 ]
  %1257 = icmp ugt i32 %1255, 7
  br i1 %1257, label %1260, label %1258

1258:                                             ; preds = %1253
  %1259 = icmp eq i32 %1255, 0
  br i1 %1259, label %1313, label %1300

1260:                                             ; preds = %1253
  %1261 = load i8, i8 addrspace(4)* %1254, align 1, !tbaa !19
  %1262 = zext i8 %1261 to i64
  %1263 = getelementptr inbounds i8, i8 addrspace(4)* %1254, i64 1
  %1264 = load i8, i8 addrspace(4)* %1263, align 1, !tbaa !19
  %1265 = zext i8 %1264 to i64
  %1266 = shl nuw nsw i64 %1265, 8
  %1267 = or i64 %1266, %1262
  %1268 = getelementptr inbounds i8, i8 addrspace(4)* %1254, i64 2
  %1269 = load i8, i8 addrspace(4)* %1268, align 1, !tbaa !19
  %1270 = zext i8 %1269 to i64
  %1271 = shl nuw nsw i64 %1270, 16
  %1272 = or i64 %1267, %1271
  %1273 = getelementptr inbounds i8, i8 addrspace(4)* %1254, i64 3
  %1274 = load i8, i8 addrspace(4)* %1273, align 1, !tbaa !19
  %1275 = zext i8 %1274 to i64
  %1276 = shl nuw nsw i64 %1275, 24
  %1277 = or i64 %1272, %1276
  %1278 = getelementptr inbounds i8, i8 addrspace(4)* %1254, i64 4
  %1279 = load i8, i8 addrspace(4)* %1278, align 1, !tbaa !19
  %1280 = zext i8 %1279 to i64
  %1281 = shl nuw nsw i64 %1280, 32
  %1282 = or i64 %1277, %1281
  %1283 = getelementptr inbounds i8, i8 addrspace(4)* %1254, i64 5
  %1284 = load i8, i8 addrspace(4)* %1283, align 1, !tbaa !19
  %1285 = zext i8 %1284 to i64
  %1286 = shl nuw nsw i64 %1285, 40
  %1287 = or i64 %1282, %1286
  %1288 = getelementptr inbounds i8, i8 addrspace(4)* %1254, i64 6
  %1289 = load i8, i8 addrspace(4)* %1288, align 1, !tbaa !19
  %1290 = zext i8 %1289 to i64
  %1291 = shl nuw nsw i64 %1290, 48
  %1292 = or i64 %1287, %1291
  %1293 = getelementptr inbounds i8, i8 addrspace(4)* %1254, i64 7
  %1294 = load i8, i8 addrspace(4)* %1293, align 1, !tbaa !19
  %1295 = zext i8 %1294 to i64
  %1296 = shl nuw i64 %1295, 56
  %1297 = or i64 %1292, %1296
  %1298 = add nsw i32 %1255, -8
  %1299 = getelementptr inbounds i8, i8 addrspace(4)* %1254, i64 8
  br label %1313

1300:                                             ; preds = %1258, %1300
  %1301 = phi i32 [ %1311, %1300 ], [ 0, %1258 ]
  %1302 = phi i64 [ %1310, %1300 ], [ 0, %1258 ]
  %1303 = zext i32 %1301 to i64
  %1304 = getelementptr inbounds i8, i8 addrspace(4)* %1254, i64 %1303
  %1305 = load i8, i8 addrspace(4)* %1304, align 1, !tbaa !19
  %1306 = zext i8 %1305 to i64
  %1307 = shl i32 %1301, 3
  %1308 = zext i32 %1307 to i64
  %1309 = shl nuw i64 %1306, %1308
  %1310 = or i64 %1309, %1302
  %1311 = add nuw nsw i32 %1301, 1
  %1312 = icmp eq i32 %1311, %1255
  br i1 %1312, label %1313, label %1300

1313:                                             ; preds = %1300, %1260, %1258
  %1314 = phi i8 addrspace(4)* [ %1299, %1260 ], [ %1254, %1258 ], [ %1254, %1300 ]
  %1315 = phi i32 [ %1298, %1260 ], [ 0, %1258 ], [ 0, %1300 ]
  %1316 = phi i64 [ %1297, %1260 ], [ 0, %1258 ], [ %1310, %1300 ]
  %1317 = icmp ugt i32 %1315, 7
  br i1 %1317, label %1320, label %1318

1318:                                             ; preds = %1313
  %1319 = icmp eq i32 %1315, 0
  br i1 %1319, label %1373, label %1360

1320:                                             ; preds = %1313
  %1321 = load i8, i8 addrspace(4)* %1314, align 1, !tbaa !19
  %1322 = zext i8 %1321 to i64
  %1323 = getelementptr inbounds i8, i8 addrspace(4)* %1314, i64 1
  %1324 = load i8, i8 addrspace(4)* %1323, align 1, !tbaa !19
  %1325 = zext i8 %1324 to i64
  %1326 = shl nuw nsw i64 %1325, 8
  %1327 = or i64 %1326, %1322
  %1328 = getelementptr inbounds i8, i8 addrspace(4)* %1314, i64 2
  %1329 = load i8, i8 addrspace(4)* %1328, align 1, !tbaa !19
  %1330 = zext i8 %1329 to i64
  %1331 = shl nuw nsw i64 %1330, 16
  %1332 = or i64 %1327, %1331
  %1333 = getelementptr inbounds i8, i8 addrspace(4)* %1314, i64 3
  %1334 = load i8, i8 addrspace(4)* %1333, align 1, !tbaa !19
  %1335 = zext i8 %1334 to i64
  %1336 = shl nuw nsw i64 %1335, 24
  %1337 = or i64 %1332, %1336
  %1338 = getelementptr inbounds i8, i8 addrspace(4)* %1314, i64 4
  %1339 = load i8, i8 addrspace(4)* %1338, align 1, !tbaa !19
  %1340 = zext i8 %1339 to i64
  %1341 = shl nuw nsw i64 %1340, 32
  %1342 = or i64 %1337, %1341
  %1343 = getelementptr inbounds i8, i8 addrspace(4)* %1314, i64 5
  %1344 = load i8, i8 addrspace(4)* %1343, align 1, !tbaa !19
  %1345 = zext i8 %1344 to i64
  %1346 = shl nuw nsw i64 %1345, 40
  %1347 = or i64 %1342, %1346
  %1348 = getelementptr inbounds i8, i8 addrspace(4)* %1314, i64 6
  %1349 = load i8, i8 addrspace(4)* %1348, align 1, !tbaa !19
  %1350 = zext i8 %1349 to i64
  %1351 = shl nuw nsw i64 %1350, 48
  %1352 = or i64 %1347, %1351
  %1353 = getelementptr inbounds i8, i8 addrspace(4)* %1314, i64 7
  %1354 = load i8, i8 addrspace(4)* %1353, align 1, !tbaa !19
  %1355 = zext i8 %1354 to i64
  %1356 = shl nuw i64 %1355, 56
  %1357 = or i64 %1352, %1356
  %1358 = add nsw i32 %1315, -8
  %1359 = getelementptr inbounds i8, i8 addrspace(4)* %1314, i64 8
  br label %1373

1360:                                             ; preds = %1318, %1360
  %1361 = phi i32 [ %1371, %1360 ], [ 0, %1318 ]
  %1362 = phi i64 [ %1370, %1360 ], [ 0, %1318 ]
  %1363 = zext i32 %1361 to i64
  %1364 = getelementptr inbounds i8, i8 addrspace(4)* %1314, i64 %1363
  %1365 = load i8, i8 addrspace(4)* %1364, align 1, !tbaa !19
  %1366 = zext i8 %1365 to i64
  %1367 = shl i32 %1361, 3
  %1368 = zext i32 %1367 to i64
  %1369 = shl nuw i64 %1366, %1368
  %1370 = or i64 %1369, %1362
  %1371 = add nuw nsw i32 %1361, 1
  %1372 = icmp eq i32 %1371, %1315
  br i1 %1372, label %1373, label %1360

1373:                                             ; preds = %1360, %1320, %1318
  %1374 = phi i8 addrspace(4)* [ %1359, %1320 ], [ %1314, %1318 ], [ %1314, %1360 ]
  %1375 = phi i32 [ %1358, %1320 ], [ 0, %1318 ], [ 0, %1360 ]
  %1376 = phi i64 [ %1357, %1320 ], [ 0, %1318 ], [ %1370, %1360 ]
  %1377 = icmp ugt i32 %1375, 7
  br i1 %1377, label %1380, label %1378

1378:                                             ; preds = %1373
  %1379 = icmp eq i32 %1375, 0
  br i1 %1379, label %1431, label %1418

1380:                                             ; preds = %1373
  %1381 = load i8, i8 addrspace(4)* %1374, align 1, !tbaa !19
  %1382 = zext i8 %1381 to i64
  %1383 = getelementptr inbounds i8, i8 addrspace(4)* %1374, i64 1
  %1384 = load i8, i8 addrspace(4)* %1383, align 1, !tbaa !19
  %1385 = zext i8 %1384 to i64
  %1386 = shl nuw nsw i64 %1385, 8
  %1387 = or i64 %1386, %1382
  %1388 = getelementptr inbounds i8, i8 addrspace(4)* %1374, i64 2
  %1389 = load i8, i8 addrspace(4)* %1388, align 1, !tbaa !19
  %1390 = zext i8 %1389 to i64
  %1391 = shl nuw nsw i64 %1390, 16
  %1392 = or i64 %1387, %1391
  %1393 = getelementptr inbounds i8, i8 addrspace(4)* %1374, i64 3
  %1394 = load i8, i8 addrspace(4)* %1393, align 1, !tbaa !19
  %1395 = zext i8 %1394 to i64
  %1396 = shl nuw nsw i64 %1395, 24
  %1397 = or i64 %1392, %1396
  %1398 = getelementptr inbounds i8, i8 addrspace(4)* %1374, i64 4
  %1399 = load i8, i8 addrspace(4)* %1398, align 1, !tbaa !19
  %1400 = zext i8 %1399 to i64
  %1401 = shl nuw nsw i64 %1400, 32
  %1402 = or i64 %1397, %1401
  %1403 = getelementptr inbounds i8, i8 addrspace(4)* %1374, i64 5
  %1404 = load i8, i8 addrspace(4)* %1403, align 1, !tbaa !19
  %1405 = zext i8 %1404 to i64
  %1406 = shl nuw nsw i64 %1405, 40
  %1407 = or i64 %1402, %1406
  %1408 = getelementptr inbounds i8, i8 addrspace(4)* %1374, i64 6
  %1409 = load i8, i8 addrspace(4)* %1408, align 1, !tbaa !19
  %1410 = zext i8 %1409 to i64
  %1411 = shl nuw nsw i64 %1410, 48
  %1412 = or i64 %1407, %1411
  %1413 = getelementptr inbounds i8, i8 addrspace(4)* %1374, i64 7
  %1414 = load i8, i8 addrspace(4)* %1413, align 1, !tbaa !19
  %1415 = zext i8 %1414 to i64
  %1416 = shl nuw i64 %1415, 56
  %1417 = or i64 %1412, %1416
  br label %1431

1418:                                             ; preds = %1378, %1418
  %1419 = phi i32 [ %1429, %1418 ], [ 0, %1378 ]
  %1420 = phi i64 [ %1428, %1418 ], [ 0, %1378 ]
  %1421 = zext i32 %1419 to i64
  %1422 = getelementptr inbounds i8, i8 addrspace(4)* %1374, i64 %1421
  %1423 = load i8, i8 addrspace(4)* %1422, align 1, !tbaa !19
  %1424 = zext i8 %1423 to i64
  %1425 = shl i32 %1419, 3
  %1426 = zext i32 %1425 to i64
  %1427 = shl nuw i64 %1424, %1426
  %1428 = or i64 %1427, %1420
  %1429 = add nuw nsw i32 %1419, 1
  %1430 = icmp eq i32 %1429, %1375
  br i1 %1430, label %1431, label %1418

1431:                                             ; preds = %1418, %1380, %1378
  %1432 = phi i64 [ %1417, %1380 ], [ 0, %1378 ], [ %1428, %1418 ]
  %1433 = shl nuw nsw i64 %1014, 2
  %1434 = add nuw nsw i64 %1433, 28
  %1435 = and i64 %1434, 480
  %1436 = and i64 %1016, -225
  %1437 = or i64 %1436, %1435
  %1438 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef %1437, i64 noundef %1076, i64 noundef %1136, i64 noundef %1196, i64 noundef %1256, i64 noundef %1316, i64 noundef %1376, i64 noundef %1432) #10
  %1439 = sub i64 %1006, %1014
  %1440 = getelementptr inbounds i8, i8 addrspace(4)* %1007, i64 %1014
  %1441 = icmp eq i64 %1439, 0
  br i1 %1441, label %1442, label %1005

1442:                                             ; preds = %1431, %997
  %1443 = phi <2 x i64> [ %1000, %997 ], [ %1438, %1431 ]
  %1444 = extractelement <2 x i64> %1443, i64 0
  %1445 = zext i32 %27 to i64
  %1446 = and i64 %1444, -227
  %1447 = or i64 %1446, 34
  %1448 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef %1447, i64 noundef %1445, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %1449 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %1450 = extractelement <2 x i64> %1449, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), label %1451, label %1455

1451:                                             ; preds = %1442
  %1452 = and i64 %1450, -225
  %1453 = or i64 %1452, 32
  %1454 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef %1453, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %1896

1455:                                             ; preds = %1442
  %1456 = and i64 %1450, 2
  %1457 = and i64 %1450, -3
  %1458 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1457, i64 0
  br label %1459

1459:                                             ; preds = %1885, %1455
  %1460 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str.3, i64 0, i64 28) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([29 x i8]* addrspacecast ([29 x i8] addrspace(4)* @.str.3 to [29 x i8]*) to i64)), i64 1))), %1455 ], [ %1893, %1885 ]
  %1461 = phi i8 addrspace(4)* [ getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str.3, i64 0, i64 0), %1455 ], [ %1894, %1885 ]
  %1462 = phi <2 x i64> [ %1458, %1455 ], [ %1892, %1885 ]
  %1463 = icmp ugt i64 %1460, 56
  %1464 = extractelement <2 x i64> %1462, i64 0
  %1465 = or i64 %1464, %1456
  %1466 = insertelement <2 x i64> poison, i64 %1465, i64 0
  %1467 = select i1 %1463, <2 x i64> %1462, <2 x i64> %1466
  %1468 = tail call i64 @llvm.umin.i64(i64 %1460, i64 56)
  %1469 = trunc i64 %1468 to i32
  %1470 = extractelement <2 x i64> %1467, i64 0
  %1471 = icmp ugt i32 %1469, 7
  br i1 %1471, label %1474, label %1472

1472:                                             ; preds = %1459
  %1473 = icmp eq i32 %1469, 0
  br i1 %1473, label %1527, label %1514

1474:                                             ; preds = %1459
  %1475 = load i8, i8 addrspace(4)* %1461, align 1, !tbaa !19
  %1476 = zext i8 %1475 to i64
  %1477 = getelementptr inbounds i8, i8 addrspace(4)* %1461, i64 1
  %1478 = load i8, i8 addrspace(4)* %1477, align 1, !tbaa !19
  %1479 = zext i8 %1478 to i64
  %1480 = shl nuw nsw i64 %1479, 8
  %1481 = or i64 %1480, %1476
  %1482 = getelementptr inbounds i8, i8 addrspace(4)* %1461, i64 2
  %1483 = load i8, i8 addrspace(4)* %1482, align 1, !tbaa !19
  %1484 = zext i8 %1483 to i64
  %1485 = shl nuw nsw i64 %1484, 16
  %1486 = or i64 %1481, %1485
  %1487 = getelementptr inbounds i8, i8 addrspace(4)* %1461, i64 3
  %1488 = load i8, i8 addrspace(4)* %1487, align 1, !tbaa !19
  %1489 = zext i8 %1488 to i64
  %1490 = shl nuw nsw i64 %1489, 24
  %1491 = or i64 %1486, %1490
  %1492 = getelementptr inbounds i8, i8 addrspace(4)* %1461, i64 4
  %1493 = load i8, i8 addrspace(4)* %1492, align 1, !tbaa !19
  %1494 = zext i8 %1493 to i64
  %1495 = shl nuw nsw i64 %1494, 32
  %1496 = or i64 %1491, %1495
  %1497 = getelementptr inbounds i8, i8 addrspace(4)* %1461, i64 5
  %1498 = load i8, i8 addrspace(4)* %1497, align 1, !tbaa !19
  %1499 = zext i8 %1498 to i64
  %1500 = shl nuw nsw i64 %1499, 40
  %1501 = or i64 %1496, %1500
  %1502 = getelementptr inbounds i8, i8 addrspace(4)* %1461, i64 6
  %1503 = load i8, i8 addrspace(4)* %1502, align 1, !tbaa !19
  %1504 = zext i8 %1503 to i64
  %1505 = shl nuw nsw i64 %1504, 48
  %1506 = or i64 %1501, %1505
  %1507 = getelementptr inbounds i8, i8 addrspace(4)* %1461, i64 7
  %1508 = load i8, i8 addrspace(4)* %1507, align 1, !tbaa !19
  %1509 = zext i8 %1508 to i64
  %1510 = shl nuw i64 %1509, 56
  %1511 = or i64 %1506, %1510
  %1512 = add nsw i32 %1469, -8
  %1513 = getelementptr inbounds i8, i8 addrspace(4)* %1461, i64 8
  br label %1527

1514:                                             ; preds = %1472, %1514
  %1515 = phi i32 [ %1525, %1514 ], [ 0, %1472 ]
  %1516 = phi i64 [ %1524, %1514 ], [ 0, %1472 ]
  %1517 = zext i32 %1515 to i64
  %1518 = getelementptr inbounds i8, i8 addrspace(4)* %1461, i64 %1517
  %1519 = load i8, i8 addrspace(4)* %1518, align 1, !tbaa !19
  %1520 = zext i8 %1519 to i64
  %1521 = shl i32 %1515, 3
  %1522 = zext i32 %1521 to i64
  %1523 = shl nuw i64 %1520, %1522
  %1524 = or i64 %1523, %1516
  %1525 = add nuw nsw i32 %1515, 1
  %1526 = icmp eq i32 %1525, %1469
  br i1 %1526, label %1527, label %1514, !llvm.loop !20

1527:                                             ; preds = %1514, %1474, %1472
  %1528 = phi i8 addrspace(4)* [ %1513, %1474 ], [ %1461, %1472 ], [ %1461, %1514 ]
  %1529 = phi i32 [ %1512, %1474 ], [ 0, %1472 ], [ 0, %1514 ]
  %1530 = phi i64 [ %1511, %1474 ], [ 0, %1472 ], [ %1524, %1514 ]
  %1531 = icmp ugt i32 %1529, 7
  br i1 %1531, label %1534, label %1532

1532:                                             ; preds = %1527
  %1533 = icmp eq i32 %1529, 0
  br i1 %1533, label %1587, label %1574

1534:                                             ; preds = %1527
  %1535 = load i8, i8 addrspace(4)* %1528, align 1, !tbaa !19
  %1536 = zext i8 %1535 to i64
  %1537 = getelementptr inbounds i8, i8 addrspace(4)* %1528, i64 1
  %1538 = load i8, i8 addrspace(4)* %1537, align 1, !tbaa !19
  %1539 = zext i8 %1538 to i64
  %1540 = shl nuw nsw i64 %1539, 8
  %1541 = or i64 %1540, %1536
  %1542 = getelementptr inbounds i8, i8 addrspace(4)* %1528, i64 2
  %1543 = load i8, i8 addrspace(4)* %1542, align 1, !tbaa !19
  %1544 = zext i8 %1543 to i64
  %1545 = shl nuw nsw i64 %1544, 16
  %1546 = or i64 %1541, %1545
  %1547 = getelementptr inbounds i8, i8 addrspace(4)* %1528, i64 3
  %1548 = load i8, i8 addrspace(4)* %1547, align 1, !tbaa !19
  %1549 = zext i8 %1548 to i64
  %1550 = shl nuw nsw i64 %1549, 24
  %1551 = or i64 %1546, %1550
  %1552 = getelementptr inbounds i8, i8 addrspace(4)* %1528, i64 4
  %1553 = load i8, i8 addrspace(4)* %1552, align 1, !tbaa !19
  %1554 = zext i8 %1553 to i64
  %1555 = shl nuw nsw i64 %1554, 32
  %1556 = or i64 %1551, %1555
  %1557 = getelementptr inbounds i8, i8 addrspace(4)* %1528, i64 5
  %1558 = load i8, i8 addrspace(4)* %1557, align 1, !tbaa !19
  %1559 = zext i8 %1558 to i64
  %1560 = shl nuw nsw i64 %1559, 40
  %1561 = or i64 %1556, %1560
  %1562 = getelementptr inbounds i8, i8 addrspace(4)* %1528, i64 6
  %1563 = load i8, i8 addrspace(4)* %1562, align 1, !tbaa !19
  %1564 = zext i8 %1563 to i64
  %1565 = shl nuw nsw i64 %1564, 48
  %1566 = or i64 %1561, %1565
  %1567 = getelementptr inbounds i8, i8 addrspace(4)* %1528, i64 7
  %1568 = load i8, i8 addrspace(4)* %1567, align 1, !tbaa !19
  %1569 = zext i8 %1568 to i64
  %1570 = shl nuw i64 %1569, 56
  %1571 = or i64 %1566, %1570
  %1572 = add nsw i32 %1529, -8
  %1573 = getelementptr inbounds i8, i8 addrspace(4)* %1528, i64 8
  br label %1587

1574:                                             ; preds = %1532, %1574
  %1575 = phi i32 [ %1585, %1574 ], [ 0, %1532 ]
  %1576 = phi i64 [ %1584, %1574 ], [ 0, %1532 ]
  %1577 = zext i32 %1575 to i64
  %1578 = getelementptr inbounds i8, i8 addrspace(4)* %1528, i64 %1577
  %1579 = load i8, i8 addrspace(4)* %1578, align 1, !tbaa !19
  %1580 = zext i8 %1579 to i64
  %1581 = shl i32 %1575, 3
  %1582 = zext i32 %1581 to i64
  %1583 = shl nuw i64 %1580, %1582
  %1584 = or i64 %1583, %1576
  %1585 = add nuw nsw i32 %1575, 1
  %1586 = icmp eq i32 %1585, %1529
  br i1 %1586, label %1587, label %1574

1587:                                             ; preds = %1574, %1534, %1532
  %1588 = phi i8 addrspace(4)* [ %1573, %1534 ], [ %1528, %1532 ], [ %1528, %1574 ]
  %1589 = phi i32 [ %1572, %1534 ], [ 0, %1532 ], [ 0, %1574 ]
  %1590 = phi i64 [ %1571, %1534 ], [ 0, %1532 ], [ %1584, %1574 ]
  %1591 = icmp ugt i32 %1589, 7
  br i1 %1591, label %1594, label %1592

1592:                                             ; preds = %1587
  %1593 = icmp eq i32 %1589, 0
  br i1 %1593, label %1647, label %1634

1594:                                             ; preds = %1587
  %1595 = load i8, i8 addrspace(4)* %1588, align 1, !tbaa !19
  %1596 = zext i8 %1595 to i64
  %1597 = getelementptr inbounds i8, i8 addrspace(4)* %1588, i64 1
  %1598 = load i8, i8 addrspace(4)* %1597, align 1, !tbaa !19
  %1599 = zext i8 %1598 to i64
  %1600 = shl nuw nsw i64 %1599, 8
  %1601 = or i64 %1600, %1596
  %1602 = getelementptr inbounds i8, i8 addrspace(4)* %1588, i64 2
  %1603 = load i8, i8 addrspace(4)* %1602, align 1, !tbaa !19
  %1604 = zext i8 %1603 to i64
  %1605 = shl nuw nsw i64 %1604, 16
  %1606 = or i64 %1601, %1605
  %1607 = getelementptr inbounds i8, i8 addrspace(4)* %1588, i64 3
  %1608 = load i8, i8 addrspace(4)* %1607, align 1, !tbaa !19
  %1609 = zext i8 %1608 to i64
  %1610 = shl nuw nsw i64 %1609, 24
  %1611 = or i64 %1606, %1610
  %1612 = getelementptr inbounds i8, i8 addrspace(4)* %1588, i64 4
  %1613 = load i8, i8 addrspace(4)* %1612, align 1, !tbaa !19
  %1614 = zext i8 %1613 to i64
  %1615 = shl nuw nsw i64 %1614, 32
  %1616 = or i64 %1611, %1615
  %1617 = getelementptr inbounds i8, i8 addrspace(4)* %1588, i64 5
  %1618 = load i8, i8 addrspace(4)* %1617, align 1, !tbaa !19
  %1619 = zext i8 %1618 to i64
  %1620 = shl nuw nsw i64 %1619, 40
  %1621 = or i64 %1616, %1620
  %1622 = getelementptr inbounds i8, i8 addrspace(4)* %1588, i64 6
  %1623 = load i8, i8 addrspace(4)* %1622, align 1, !tbaa !19
  %1624 = zext i8 %1623 to i64
  %1625 = shl nuw nsw i64 %1624, 48
  %1626 = or i64 %1621, %1625
  %1627 = getelementptr inbounds i8, i8 addrspace(4)* %1588, i64 7
  %1628 = load i8, i8 addrspace(4)* %1627, align 1, !tbaa !19
  %1629 = zext i8 %1628 to i64
  %1630 = shl nuw i64 %1629, 56
  %1631 = or i64 %1626, %1630
  %1632 = add nsw i32 %1589, -8
  %1633 = getelementptr inbounds i8, i8 addrspace(4)* %1588, i64 8
  br label %1647

1634:                                             ; preds = %1592, %1634
  %1635 = phi i32 [ %1645, %1634 ], [ 0, %1592 ]
  %1636 = phi i64 [ %1644, %1634 ], [ 0, %1592 ]
  %1637 = zext i32 %1635 to i64
  %1638 = getelementptr inbounds i8, i8 addrspace(4)* %1588, i64 %1637
  %1639 = load i8, i8 addrspace(4)* %1638, align 1, !tbaa !19
  %1640 = zext i8 %1639 to i64
  %1641 = shl i32 %1635, 3
  %1642 = zext i32 %1641 to i64
  %1643 = shl nuw i64 %1640, %1642
  %1644 = or i64 %1643, %1636
  %1645 = add nuw nsw i32 %1635, 1
  %1646 = icmp eq i32 %1645, %1589
  br i1 %1646, label %1647, label %1634

1647:                                             ; preds = %1634, %1594, %1592
  %1648 = phi i8 addrspace(4)* [ %1633, %1594 ], [ %1588, %1592 ], [ %1588, %1634 ]
  %1649 = phi i32 [ %1632, %1594 ], [ 0, %1592 ], [ 0, %1634 ]
  %1650 = phi i64 [ %1631, %1594 ], [ 0, %1592 ], [ %1644, %1634 ]
  %1651 = icmp ugt i32 %1649, 7
  br i1 %1651, label %1654, label %1652

1652:                                             ; preds = %1647
  %1653 = icmp eq i32 %1649, 0
  br i1 %1653, label %1707, label %1694

1654:                                             ; preds = %1647
  %1655 = load i8, i8 addrspace(4)* %1648, align 1, !tbaa !19
  %1656 = zext i8 %1655 to i64
  %1657 = getelementptr inbounds i8, i8 addrspace(4)* %1648, i64 1
  %1658 = load i8, i8 addrspace(4)* %1657, align 1, !tbaa !19
  %1659 = zext i8 %1658 to i64
  %1660 = shl nuw nsw i64 %1659, 8
  %1661 = or i64 %1660, %1656
  %1662 = getelementptr inbounds i8, i8 addrspace(4)* %1648, i64 2
  %1663 = load i8, i8 addrspace(4)* %1662, align 1, !tbaa !19
  %1664 = zext i8 %1663 to i64
  %1665 = shl nuw nsw i64 %1664, 16
  %1666 = or i64 %1661, %1665
  %1667 = getelementptr inbounds i8, i8 addrspace(4)* %1648, i64 3
  %1668 = load i8, i8 addrspace(4)* %1667, align 1, !tbaa !19
  %1669 = zext i8 %1668 to i64
  %1670 = shl nuw nsw i64 %1669, 24
  %1671 = or i64 %1666, %1670
  %1672 = getelementptr inbounds i8, i8 addrspace(4)* %1648, i64 4
  %1673 = load i8, i8 addrspace(4)* %1672, align 1, !tbaa !19
  %1674 = zext i8 %1673 to i64
  %1675 = shl nuw nsw i64 %1674, 32
  %1676 = or i64 %1671, %1675
  %1677 = getelementptr inbounds i8, i8 addrspace(4)* %1648, i64 5
  %1678 = load i8, i8 addrspace(4)* %1677, align 1, !tbaa !19
  %1679 = zext i8 %1678 to i64
  %1680 = shl nuw nsw i64 %1679, 40
  %1681 = or i64 %1676, %1680
  %1682 = getelementptr inbounds i8, i8 addrspace(4)* %1648, i64 6
  %1683 = load i8, i8 addrspace(4)* %1682, align 1, !tbaa !19
  %1684 = zext i8 %1683 to i64
  %1685 = shl nuw nsw i64 %1684, 48
  %1686 = or i64 %1681, %1685
  %1687 = getelementptr inbounds i8, i8 addrspace(4)* %1648, i64 7
  %1688 = load i8, i8 addrspace(4)* %1687, align 1, !tbaa !19
  %1689 = zext i8 %1688 to i64
  %1690 = shl nuw i64 %1689, 56
  %1691 = or i64 %1686, %1690
  %1692 = add nsw i32 %1649, -8
  %1693 = getelementptr inbounds i8, i8 addrspace(4)* %1648, i64 8
  br label %1707

1694:                                             ; preds = %1652, %1694
  %1695 = phi i32 [ %1705, %1694 ], [ 0, %1652 ]
  %1696 = phi i64 [ %1704, %1694 ], [ 0, %1652 ]
  %1697 = zext i32 %1695 to i64
  %1698 = getelementptr inbounds i8, i8 addrspace(4)* %1648, i64 %1697
  %1699 = load i8, i8 addrspace(4)* %1698, align 1, !tbaa !19
  %1700 = zext i8 %1699 to i64
  %1701 = shl i32 %1695, 3
  %1702 = zext i32 %1701 to i64
  %1703 = shl nuw i64 %1700, %1702
  %1704 = or i64 %1703, %1696
  %1705 = add nuw nsw i32 %1695, 1
  %1706 = icmp eq i32 %1705, %1649
  br i1 %1706, label %1707, label %1694

1707:                                             ; preds = %1694, %1654, %1652
  %1708 = phi i8 addrspace(4)* [ %1693, %1654 ], [ %1648, %1652 ], [ %1648, %1694 ]
  %1709 = phi i32 [ %1692, %1654 ], [ 0, %1652 ], [ 0, %1694 ]
  %1710 = phi i64 [ %1691, %1654 ], [ 0, %1652 ], [ %1704, %1694 ]
  %1711 = icmp ugt i32 %1709, 7
  br i1 %1711, label %1714, label %1712

1712:                                             ; preds = %1707
  %1713 = icmp eq i32 %1709, 0
  br i1 %1713, label %1767, label %1754

1714:                                             ; preds = %1707
  %1715 = load i8, i8 addrspace(4)* %1708, align 1, !tbaa !19
  %1716 = zext i8 %1715 to i64
  %1717 = getelementptr inbounds i8, i8 addrspace(4)* %1708, i64 1
  %1718 = load i8, i8 addrspace(4)* %1717, align 1, !tbaa !19
  %1719 = zext i8 %1718 to i64
  %1720 = shl nuw nsw i64 %1719, 8
  %1721 = or i64 %1720, %1716
  %1722 = getelementptr inbounds i8, i8 addrspace(4)* %1708, i64 2
  %1723 = load i8, i8 addrspace(4)* %1722, align 1, !tbaa !19
  %1724 = zext i8 %1723 to i64
  %1725 = shl nuw nsw i64 %1724, 16
  %1726 = or i64 %1721, %1725
  %1727 = getelementptr inbounds i8, i8 addrspace(4)* %1708, i64 3
  %1728 = load i8, i8 addrspace(4)* %1727, align 1, !tbaa !19
  %1729 = zext i8 %1728 to i64
  %1730 = shl nuw nsw i64 %1729, 24
  %1731 = or i64 %1726, %1730
  %1732 = getelementptr inbounds i8, i8 addrspace(4)* %1708, i64 4
  %1733 = load i8, i8 addrspace(4)* %1732, align 1, !tbaa !19
  %1734 = zext i8 %1733 to i64
  %1735 = shl nuw nsw i64 %1734, 32
  %1736 = or i64 %1731, %1735
  %1737 = getelementptr inbounds i8, i8 addrspace(4)* %1708, i64 5
  %1738 = load i8, i8 addrspace(4)* %1737, align 1, !tbaa !19
  %1739 = zext i8 %1738 to i64
  %1740 = shl nuw nsw i64 %1739, 40
  %1741 = or i64 %1736, %1740
  %1742 = getelementptr inbounds i8, i8 addrspace(4)* %1708, i64 6
  %1743 = load i8, i8 addrspace(4)* %1742, align 1, !tbaa !19
  %1744 = zext i8 %1743 to i64
  %1745 = shl nuw nsw i64 %1744, 48
  %1746 = or i64 %1741, %1745
  %1747 = getelementptr inbounds i8, i8 addrspace(4)* %1708, i64 7
  %1748 = load i8, i8 addrspace(4)* %1747, align 1, !tbaa !19
  %1749 = zext i8 %1748 to i64
  %1750 = shl nuw i64 %1749, 56
  %1751 = or i64 %1746, %1750
  %1752 = add nsw i32 %1709, -8
  %1753 = getelementptr inbounds i8, i8 addrspace(4)* %1708, i64 8
  br label %1767

1754:                                             ; preds = %1712, %1754
  %1755 = phi i32 [ %1765, %1754 ], [ 0, %1712 ]
  %1756 = phi i64 [ %1764, %1754 ], [ 0, %1712 ]
  %1757 = zext i32 %1755 to i64
  %1758 = getelementptr inbounds i8, i8 addrspace(4)* %1708, i64 %1757
  %1759 = load i8, i8 addrspace(4)* %1758, align 1, !tbaa !19
  %1760 = zext i8 %1759 to i64
  %1761 = shl i32 %1755, 3
  %1762 = zext i32 %1761 to i64
  %1763 = shl nuw i64 %1760, %1762
  %1764 = or i64 %1763, %1756
  %1765 = add nuw nsw i32 %1755, 1
  %1766 = icmp eq i32 %1765, %1709
  br i1 %1766, label %1767, label %1754

1767:                                             ; preds = %1754, %1714, %1712
  %1768 = phi i8 addrspace(4)* [ %1753, %1714 ], [ %1708, %1712 ], [ %1708, %1754 ]
  %1769 = phi i32 [ %1752, %1714 ], [ 0, %1712 ], [ 0, %1754 ]
  %1770 = phi i64 [ %1751, %1714 ], [ 0, %1712 ], [ %1764, %1754 ]
  %1771 = icmp ugt i32 %1769, 7
  br i1 %1771, label %1774, label %1772

1772:                                             ; preds = %1767
  %1773 = icmp eq i32 %1769, 0
  br i1 %1773, label %1827, label %1814

1774:                                             ; preds = %1767
  %1775 = load i8, i8 addrspace(4)* %1768, align 1, !tbaa !19
  %1776 = zext i8 %1775 to i64
  %1777 = getelementptr inbounds i8, i8 addrspace(4)* %1768, i64 1
  %1778 = load i8, i8 addrspace(4)* %1777, align 1, !tbaa !19
  %1779 = zext i8 %1778 to i64
  %1780 = shl nuw nsw i64 %1779, 8
  %1781 = or i64 %1780, %1776
  %1782 = getelementptr inbounds i8, i8 addrspace(4)* %1768, i64 2
  %1783 = load i8, i8 addrspace(4)* %1782, align 1, !tbaa !19
  %1784 = zext i8 %1783 to i64
  %1785 = shl nuw nsw i64 %1784, 16
  %1786 = or i64 %1781, %1785
  %1787 = getelementptr inbounds i8, i8 addrspace(4)* %1768, i64 3
  %1788 = load i8, i8 addrspace(4)* %1787, align 1, !tbaa !19
  %1789 = zext i8 %1788 to i64
  %1790 = shl nuw nsw i64 %1789, 24
  %1791 = or i64 %1786, %1790
  %1792 = getelementptr inbounds i8, i8 addrspace(4)* %1768, i64 4
  %1793 = load i8, i8 addrspace(4)* %1792, align 1, !tbaa !19
  %1794 = zext i8 %1793 to i64
  %1795 = shl nuw nsw i64 %1794, 32
  %1796 = or i64 %1791, %1795
  %1797 = getelementptr inbounds i8, i8 addrspace(4)* %1768, i64 5
  %1798 = load i8, i8 addrspace(4)* %1797, align 1, !tbaa !19
  %1799 = zext i8 %1798 to i64
  %1800 = shl nuw nsw i64 %1799, 40
  %1801 = or i64 %1796, %1800
  %1802 = getelementptr inbounds i8, i8 addrspace(4)* %1768, i64 6
  %1803 = load i8, i8 addrspace(4)* %1802, align 1, !tbaa !19
  %1804 = zext i8 %1803 to i64
  %1805 = shl nuw nsw i64 %1804, 48
  %1806 = or i64 %1801, %1805
  %1807 = getelementptr inbounds i8, i8 addrspace(4)* %1768, i64 7
  %1808 = load i8, i8 addrspace(4)* %1807, align 1, !tbaa !19
  %1809 = zext i8 %1808 to i64
  %1810 = shl nuw i64 %1809, 56
  %1811 = or i64 %1806, %1810
  %1812 = add nsw i32 %1769, -8
  %1813 = getelementptr inbounds i8, i8 addrspace(4)* %1768, i64 8
  br label %1827

1814:                                             ; preds = %1772, %1814
  %1815 = phi i32 [ %1825, %1814 ], [ 0, %1772 ]
  %1816 = phi i64 [ %1824, %1814 ], [ 0, %1772 ]
  %1817 = zext i32 %1815 to i64
  %1818 = getelementptr inbounds i8, i8 addrspace(4)* %1768, i64 %1817
  %1819 = load i8, i8 addrspace(4)* %1818, align 1, !tbaa !19
  %1820 = zext i8 %1819 to i64
  %1821 = shl i32 %1815, 3
  %1822 = zext i32 %1821 to i64
  %1823 = shl nuw i64 %1820, %1822
  %1824 = or i64 %1823, %1816
  %1825 = add nuw nsw i32 %1815, 1
  %1826 = icmp eq i32 %1825, %1769
  br i1 %1826, label %1827, label %1814

1827:                                             ; preds = %1814, %1774, %1772
  %1828 = phi i8 addrspace(4)* [ %1813, %1774 ], [ %1768, %1772 ], [ %1768, %1814 ]
  %1829 = phi i32 [ %1812, %1774 ], [ 0, %1772 ], [ 0, %1814 ]
  %1830 = phi i64 [ %1811, %1774 ], [ 0, %1772 ], [ %1824, %1814 ]
  %1831 = icmp ugt i32 %1829, 7
  br i1 %1831, label %1834, label %1832

1832:                                             ; preds = %1827
  %1833 = icmp eq i32 %1829, 0
  br i1 %1833, label %1885, label %1872

1834:                                             ; preds = %1827
  %1835 = load i8, i8 addrspace(4)* %1828, align 1, !tbaa !19
  %1836 = zext i8 %1835 to i64
  %1837 = getelementptr inbounds i8, i8 addrspace(4)* %1828, i64 1
  %1838 = load i8, i8 addrspace(4)* %1837, align 1, !tbaa !19
  %1839 = zext i8 %1838 to i64
  %1840 = shl nuw nsw i64 %1839, 8
  %1841 = or i64 %1840, %1836
  %1842 = getelementptr inbounds i8, i8 addrspace(4)* %1828, i64 2
  %1843 = load i8, i8 addrspace(4)* %1842, align 1, !tbaa !19
  %1844 = zext i8 %1843 to i64
  %1845 = shl nuw nsw i64 %1844, 16
  %1846 = or i64 %1841, %1845
  %1847 = getelementptr inbounds i8, i8 addrspace(4)* %1828, i64 3
  %1848 = load i8, i8 addrspace(4)* %1847, align 1, !tbaa !19
  %1849 = zext i8 %1848 to i64
  %1850 = shl nuw nsw i64 %1849, 24
  %1851 = or i64 %1846, %1850
  %1852 = getelementptr inbounds i8, i8 addrspace(4)* %1828, i64 4
  %1853 = load i8, i8 addrspace(4)* %1852, align 1, !tbaa !19
  %1854 = zext i8 %1853 to i64
  %1855 = shl nuw nsw i64 %1854, 32
  %1856 = or i64 %1851, %1855
  %1857 = getelementptr inbounds i8, i8 addrspace(4)* %1828, i64 5
  %1858 = load i8, i8 addrspace(4)* %1857, align 1, !tbaa !19
  %1859 = zext i8 %1858 to i64
  %1860 = shl nuw nsw i64 %1859, 40
  %1861 = or i64 %1856, %1860
  %1862 = getelementptr inbounds i8, i8 addrspace(4)* %1828, i64 6
  %1863 = load i8, i8 addrspace(4)* %1862, align 1, !tbaa !19
  %1864 = zext i8 %1863 to i64
  %1865 = shl nuw nsw i64 %1864, 48
  %1866 = or i64 %1861, %1865
  %1867 = getelementptr inbounds i8, i8 addrspace(4)* %1828, i64 7
  %1868 = load i8, i8 addrspace(4)* %1867, align 1, !tbaa !19
  %1869 = zext i8 %1868 to i64
  %1870 = shl nuw i64 %1869, 56
  %1871 = or i64 %1866, %1870
  br label %1885

1872:                                             ; preds = %1832, %1872
  %1873 = phi i32 [ %1883, %1872 ], [ 0, %1832 ]
  %1874 = phi i64 [ %1882, %1872 ], [ 0, %1832 ]
  %1875 = zext i32 %1873 to i64
  %1876 = getelementptr inbounds i8, i8 addrspace(4)* %1828, i64 %1875
  %1877 = load i8, i8 addrspace(4)* %1876, align 1, !tbaa !19
  %1878 = zext i8 %1877 to i64
  %1879 = shl i32 %1873, 3
  %1880 = zext i32 %1879 to i64
  %1881 = shl nuw i64 %1878, %1880
  %1882 = or i64 %1881, %1874
  %1883 = add nuw nsw i32 %1873, 1
  %1884 = icmp eq i32 %1883, %1829
  br i1 %1884, label %1885, label %1872

1885:                                             ; preds = %1872, %1834, %1832
  %1886 = phi i64 [ %1871, %1834 ], [ 0, %1832 ], [ %1882, %1872 ]
  %1887 = shl nuw nsw i64 %1468, 2
  %1888 = add nuw nsw i64 %1887, 28
  %1889 = and i64 %1888, 480
  %1890 = and i64 %1470, -225
  %1891 = or i64 %1890, %1889
  %1892 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef %1891, i64 noundef %1530, i64 noundef %1590, i64 noundef %1650, i64 noundef %1710, i64 noundef %1770, i64 noundef %1830, i64 noundef %1886) #10
  %1893 = sub i64 %1460, %1468
  %1894 = getelementptr inbounds i8, i8 addrspace(4)* %1461, i64 %1468
  %1895 = icmp eq i64 %1893, 0
  br i1 %1895, label %1896, label %1459

1896:                                             ; preds = %1885, %1451
  %1897 = phi <2 x i64> [ %1454, %1451 ], [ %1892, %1885 ]
  %1898 = extractelement <2 x i64> %1897, i64 0
  %1899 = zext i32 %44 to i64
  %1900 = and i64 %1898, -227
  %1901 = or i64 %1900, 34
  %1902 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef %1901, i64 noundef %1899, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %1903 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %1904 = extractelement <2 x i64> %1903, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str.4, i64 0, i64 0) to i8*), i8* null), label %1905, label %1909

1905:                                             ; preds = %1896
  %1906 = and i64 %1904, -225
  %1907 = or i64 %1906, 32
  %1908 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef %1907, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %2350

1909:                                             ; preds = %1896
  %1910 = and i64 %1904, 2
  %1911 = and i64 %1904, -3
  %1912 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1911, i64 0
  br label %1913

1913:                                             ; preds = %2339, %1909
  %1914 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str.4, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str.4, i64 0, i64 28) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([29 x i8]* addrspacecast ([29 x i8] addrspace(4)* @.str.4 to [29 x i8]*) to i64)), i64 1))), %1909 ], [ %2347, %2339 ]
  %1915 = phi i8 addrspace(4)* [ getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str.4, i64 0, i64 0), %1909 ], [ %2348, %2339 ]
  %1916 = phi <2 x i64> [ %1912, %1909 ], [ %2346, %2339 ]
  %1917 = icmp ugt i64 %1914, 56
  %1918 = extractelement <2 x i64> %1916, i64 0
  %1919 = or i64 %1918, %1910
  %1920 = insertelement <2 x i64> poison, i64 %1919, i64 0
  %1921 = select i1 %1917, <2 x i64> %1916, <2 x i64> %1920
  %1922 = tail call i64 @llvm.umin.i64(i64 %1914, i64 56)
  %1923 = trunc i64 %1922 to i32
  %1924 = extractelement <2 x i64> %1921, i64 0
  %1925 = icmp ugt i32 %1923, 7
  br i1 %1925, label %1928, label %1926

1926:                                             ; preds = %1913
  %1927 = icmp eq i32 %1923, 0
  br i1 %1927, label %1981, label %1968

1928:                                             ; preds = %1913
  %1929 = load i8, i8 addrspace(4)* %1915, align 1, !tbaa !19
  %1930 = zext i8 %1929 to i64
  %1931 = getelementptr inbounds i8, i8 addrspace(4)* %1915, i64 1
  %1932 = load i8, i8 addrspace(4)* %1931, align 1, !tbaa !19
  %1933 = zext i8 %1932 to i64
  %1934 = shl nuw nsw i64 %1933, 8
  %1935 = or i64 %1934, %1930
  %1936 = getelementptr inbounds i8, i8 addrspace(4)* %1915, i64 2
  %1937 = load i8, i8 addrspace(4)* %1936, align 1, !tbaa !19
  %1938 = zext i8 %1937 to i64
  %1939 = shl nuw nsw i64 %1938, 16
  %1940 = or i64 %1935, %1939
  %1941 = getelementptr inbounds i8, i8 addrspace(4)* %1915, i64 3
  %1942 = load i8, i8 addrspace(4)* %1941, align 1, !tbaa !19
  %1943 = zext i8 %1942 to i64
  %1944 = shl nuw nsw i64 %1943, 24
  %1945 = or i64 %1940, %1944
  %1946 = getelementptr inbounds i8, i8 addrspace(4)* %1915, i64 4
  %1947 = load i8, i8 addrspace(4)* %1946, align 1, !tbaa !19
  %1948 = zext i8 %1947 to i64
  %1949 = shl nuw nsw i64 %1948, 32
  %1950 = or i64 %1945, %1949
  %1951 = getelementptr inbounds i8, i8 addrspace(4)* %1915, i64 5
  %1952 = load i8, i8 addrspace(4)* %1951, align 1, !tbaa !19
  %1953 = zext i8 %1952 to i64
  %1954 = shl nuw nsw i64 %1953, 40
  %1955 = or i64 %1950, %1954
  %1956 = getelementptr inbounds i8, i8 addrspace(4)* %1915, i64 6
  %1957 = load i8, i8 addrspace(4)* %1956, align 1, !tbaa !19
  %1958 = zext i8 %1957 to i64
  %1959 = shl nuw nsw i64 %1958, 48
  %1960 = or i64 %1955, %1959
  %1961 = getelementptr inbounds i8, i8 addrspace(4)* %1915, i64 7
  %1962 = load i8, i8 addrspace(4)* %1961, align 1, !tbaa !19
  %1963 = zext i8 %1962 to i64
  %1964 = shl nuw i64 %1963, 56
  %1965 = or i64 %1960, %1964
  %1966 = add nsw i32 %1923, -8
  %1967 = getelementptr inbounds i8, i8 addrspace(4)* %1915, i64 8
  br label %1981

1968:                                             ; preds = %1926, %1968
  %1969 = phi i32 [ %1979, %1968 ], [ 0, %1926 ]
  %1970 = phi i64 [ %1978, %1968 ], [ 0, %1926 ]
  %1971 = zext i32 %1969 to i64
  %1972 = getelementptr inbounds i8, i8 addrspace(4)* %1915, i64 %1971
  %1973 = load i8, i8 addrspace(4)* %1972, align 1, !tbaa !19
  %1974 = zext i8 %1973 to i64
  %1975 = shl i32 %1969, 3
  %1976 = zext i32 %1975 to i64
  %1977 = shl nuw i64 %1974, %1976
  %1978 = or i64 %1977, %1970
  %1979 = add nuw nsw i32 %1969, 1
  %1980 = icmp eq i32 %1979, %1923
  br i1 %1980, label %1981, label %1968, !llvm.loop !20

1981:                                             ; preds = %1968, %1928, %1926
  %1982 = phi i8 addrspace(4)* [ %1967, %1928 ], [ %1915, %1926 ], [ %1915, %1968 ]
  %1983 = phi i32 [ %1966, %1928 ], [ 0, %1926 ], [ 0, %1968 ]
  %1984 = phi i64 [ %1965, %1928 ], [ 0, %1926 ], [ %1978, %1968 ]
  %1985 = icmp ugt i32 %1983, 7
  br i1 %1985, label %1988, label %1986

1986:                                             ; preds = %1981
  %1987 = icmp eq i32 %1983, 0
  br i1 %1987, label %2041, label %2028

1988:                                             ; preds = %1981
  %1989 = load i8, i8 addrspace(4)* %1982, align 1, !tbaa !19
  %1990 = zext i8 %1989 to i64
  %1991 = getelementptr inbounds i8, i8 addrspace(4)* %1982, i64 1
  %1992 = load i8, i8 addrspace(4)* %1991, align 1, !tbaa !19
  %1993 = zext i8 %1992 to i64
  %1994 = shl nuw nsw i64 %1993, 8
  %1995 = or i64 %1994, %1990
  %1996 = getelementptr inbounds i8, i8 addrspace(4)* %1982, i64 2
  %1997 = load i8, i8 addrspace(4)* %1996, align 1, !tbaa !19
  %1998 = zext i8 %1997 to i64
  %1999 = shl nuw nsw i64 %1998, 16
  %2000 = or i64 %1995, %1999
  %2001 = getelementptr inbounds i8, i8 addrspace(4)* %1982, i64 3
  %2002 = load i8, i8 addrspace(4)* %2001, align 1, !tbaa !19
  %2003 = zext i8 %2002 to i64
  %2004 = shl nuw nsw i64 %2003, 24
  %2005 = or i64 %2000, %2004
  %2006 = getelementptr inbounds i8, i8 addrspace(4)* %1982, i64 4
  %2007 = load i8, i8 addrspace(4)* %2006, align 1, !tbaa !19
  %2008 = zext i8 %2007 to i64
  %2009 = shl nuw nsw i64 %2008, 32
  %2010 = or i64 %2005, %2009
  %2011 = getelementptr inbounds i8, i8 addrspace(4)* %1982, i64 5
  %2012 = load i8, i8 addrspace(4)* %2011, align 1, !tbaa !19
  %2013 = zext i8 %2012 to i64
  %2014 = shl nuw nsw i64 %2013, 40
  %2015 = or i64 %2010, %2014
  %2016 = getelementptr inbounds i8, i8 addrspace(4)* %1982, i64 6
  %2017 = load i8, i8 addrspace(4)* %2016, align 1, !tbaa !19
  %2018 = zext i8 %2017 to i64
  %2019 = shl nuw nsw i64 %2018, 48
  %2020 = or i64 %2015, %2019
  %2021 = getelementptr inbounds i8, i8 addrspace(4)* %1982, i64 7
  %2022 = load i8, i8 addrspace(4)* %2021, align 1, !tbaa !19
  %2023 = zext i8 %2022 to i64
  %2024 = shl nuw i64 %2023, 56
  %2025 = or i64 %2020, %2024
  %2026 = add nsw i32 %1983, -8
  %2027 = getelementptr inbounds i8, i8 addrspace(4)* %1982, i64 8
  br label %2041

2028:                                             ; preds = %1986, %2028
  %2029 = phi i32 [ %2039, %2028 ], [ 0, %1986 ]
  %2030 = phi i64 [ %2038, %2028 ], [ 0, %1986 ]
  %2031 = zext i32 %2029 to i64
  %2032 = getelementptr inbounds i8, i8 addrspace(4)* %1982, i64 %2031
  %2033 = load i8, i8 addrspace(4)* %2032, align 1, !tbaa !19
  %2034 = zext i8 %2033 to i64
  %2035 = shl i32 %2029, 3
  %2036 = zext i32 %2035 to i64
  %2037 = shl nuw i64 %2034, %2036
  %2038 = or i64 %2037, %2030
  %2039 = add nuw nsw i32 %2029, 1
  %2040 = icmp eq i32 %2039, %1983
  br i1 %2040, label %2041, label %2028

2041:                                             ; preds = %2028, %1988, %1986
  %2042 = phi i8 addrspace(4)* [ %2027, %1988 ], [ %1982, %1986 ], [ %1982, %2028 ]
  %2043 = phi i32 [ %2026, %1988 ], [ 0, %1986 ], [ 0, %2028 ]
  %2044 = phi i64 [ %2025, %1988 ], [ 0, %1986 ], [ %2038, %2028 ]
  %2045 = icmp ugt i32 %2043, 7
  br i1 %2045, label %2048, label %2046

2046:                                             ; preds = %2041
  %2047 = icmp eq i32 %2043, 0
  br i1 %2047, label %2101, label %2088

2048:                                             ; preds = %2041
  %2049 = load i8, i8 addrspace(4)* %2042, align 1, !tbaa !19
  %2050 = zext i8 %2049 to i64
  %2051 = getelementptr inbounds i8, i8 addrspace(4)* %2042, i64 1
  %2052 = load i8, i8 addrspace(4)* %2051, align 1, !tbaa !19
  %2053 = zext i8 %2052 to i64
  %2054 = shl nuw nsw i64 %2053, 8
  %2055 = or i64 %2054, %2050
  %2056 = getelementptr inbounds i8, i8 addrspace(4)* %2042, i64 2
  %2057 = load i8, i8 addrspace(4)* %2056, align 1, !tbaa !19
  %2058 = zext i8 %2057 to i64
  %2059 = shl nuw nsw i64 %2058, 16
  %2060 = or i64 %2055, %2059
  %2061 = getelementptr inbounds i8, i8 addrspace(4)* %2042, i64 3
  %2062 = load i8, i8 addrspace(4)* %2061, align 1, !tbaa !19
  %2063 = zext i8 %2062 to i64
  %2064 = shl nuw nsw i64 %2063, 24
  %2065 = or i64 %2060, %2064
  %2066 = getelementptr inbounds i8, i8 addrspace(4)* %2042, i64 4
  %2067 = load i8, i8 addrspace(4)* %2066, align 1, !tbaa !19
  %2068 = zext i8 %2067 to i64
  %2069 = shl nuw nsw i64 %2068, 32
  %2070 = or i64 %2065, %2069
  %2071 = getelementptr inbounds i8, i8 addrspace(4)* %2042, i64 5
  %2072 = load i8, i8 addrspace(4)* %2071, align 1, !tbaa !19
  %2073 = zext i8 %2072 to i64
  %2074 = shl nuw nsw i64 %2073, 40
  %2075 = or i64 %2070, %2074
  %2076 = getelementptr inbounds i8, i8 addrspace(4)* %2042, i64 6
  %2077 = load i8, i8 addrspace(4)* %2076, align 1, !tbaa !19
  %2078 = zext i8 %2077 to i64
  %2079 = shl nuw nsw i64 %2078, 48
  %2080 = or i64 %2075, %2079
  %2081 = getelementptr inbounds i8, i8 addrspace(4)* %2042, i64 7
  %2082 = load i8, i8 addrspace(4)* %2081, align 1, !tbaa !19
  %2083 = zext i8 %2082 to i64
  %2084 = shl nuw i64 %2083, 56
  %2085 = or i64 %2080, %2084
  %2086 = add nsw i32 %2043, -8
  %2087 = getelementptr inbounds i8, i8 addrspace(4)* %2042, i64 8
  br label %2101

2088:                                             ; preds = %2046, %2088
  %2089 = phi i32 [ %2099, %2088 ], [ 0, %2046 ]
  %2090 = phi i64 [ %2098, %2088 ], [ 0, %2046 ]
  %2091 = zext i32 %2089 to i64
  %2092 = getelementptr inbounds i8, i8 addrspace(4)* %2042, i64 %2091
  %2093 = load i8, i8 addrspace(4)* %2092, align 1, !tbaa !19
  %2094 = zext i8 %2093 to i64
  %2095 = shl i32 %2089, 3
  %2096 = zext i32 %2095 to i64
  %2097 = shl nuw i64 %2094, %2096
  %2098 = or i64 %2097, %2090
  %2099 = add nuw nsw i32 %2089, 1
  %2100 = icmp eq i32 %2099, %2043
  br i1 %2100, label %2101, label %2088

2101:                                             ; preds = %2088, %2048, %2046
  %2102 = phi i8 addrspace(4)* [ %2087, %2048 ], [ %2042, %2046 ], [ %2042, %2088 ]
  %2103 = phi i32 [ %2086, %2048 ], [ 0, %2046 ], [ 0, %2088 ]
  %2104 = phi i64 [ %2085, %2048 ], [ 0, %2046 ], [ %2098, %2088 ]
  %2105 = icmp ugt i32 %2103, 7
  br i1 %2105, label %2108, label %2106

2106:                                             ; preds = %2101
  %2107 = icmp eq i32 %2103, 0
  br i1 %2107, label %2161, label %2148

2108:                                             ; preds = %2101
  %2109 = load i8, i8 addrspace(4)* %2102, align 1, !tbaa !19
  %2110 = zext i8 %2109 to i64
  %2111 = getelementptr inbounds i8, i8 addrspace(4)* %2102, i64 1
  %2112 = load i8, i8 addrspace(4)* %2111, align 1, !tbaa !19
  %2113 = zext i8 %2112 to i64
  %2114 = shl nuw nsw i64 %2113, 8
  %2115 = or i64 %2114, %2110
  %2116 = getelementptr inbounds i8, i8 addrspace(4)* %2102, i64 2
  %2117 = load i8, i8 addrspace(4)* %2116, align 1, !tbaa !19
  %2118 = zext i8 %2117 to i64
  %2119 = shl nuw nsw i64 %2118, 16
  %2120 = or i64 %2115, %2119
  %2121 = getelementptr inbounds i8, i8 addrspace(4)* %2102, i64 3
  %2122 = load i8, i8 addrspace(4)* %2121, align 1, !tbaa !19
  %2123 = zext i8 %2122 to i64
  %2124 = shl nuw nsw i64 %2123, 24
  %2125 = or i64 %2120, %2124
  %2126 = getelementptr inbounds i8, i8 addrspace(4)* %2102, i64 4
  %2127 = load i8, i8 addrspace(4)* %2126, align 1, !tbaa !19
  %2128 = zext i8 %2127 to i64
  %2129 = shl nuw nsw i64 %2128, 32
  %2130 = or i64 %2125, %2129
  %2131 = getelementptr inbounds i8, i8 addrspace(4)* %2102, i64 5
  %2132 = load i8, i8 addrspace(4)* %2131, align 1, !tbaa !19
  %2133 = zext i8 %2132 to i64
  %2134 = shl nuw nsw i64 %2133, 40
  %2135 = or i64 %2130, %2134
  %2136 = getelementptr inbounds i8, i8 addrspace(4)* %2102, i64 6
  %2137 = load i8, i8 addrspace(4)* %2136, align 1, !tbaa !19
  %2138 = zext i8 %2137 to i64
  %2139 = shl nuw nsw i64 %2138, 48
  %2140 = or i64 %2135, %2139
  %2141 = getelementptr inbounds i8, i8 addrspace(4)* %2102, i64 7
  %2142 = load i8, i8 addrspace(4)* %2141, align 1, !tbaa !19
  %2143 = zext i8 %2142 to i64
  %2144 = shl nuw i64 %2143, 56
  %2145 = or i64 %2140, %2144
  %2146 = add nsw i32 %2103, -8
  %2147 = getelementptr inbounds i8, i8 addrspace(4)* %2102, i64 8
  br label %2161

2148:                                             ; preds = %2106, %2148
  %2149 = phi i32 [ %2159, %2148 ], [ 0, %2106 ]
  %2150 = phi i64 [ %2158, %2148 ], [ 0, %2106 ]
  %2151 = zext i32 %2149 to i64
  %2152 = getelementptr inbounds i8, i8 addrspace(4)* %2102, i64 %2151
  %2153 = load i8, i8 addrspace(4)* %2152, align 1, !tbaa !19
  %2154 = zext i8 %2153 to i64
  %2155 = shl i32 %2149, 3
  %2156 = zext i32 %2155 to i64
  %2157 = shl nuw i64 %2154, %2156
  %2158 = or i64 %2157, %2150
  %2159 = add nuw nsw i32 %2149, 1
  %2160 = icmp eq i32 %2159, %2103
  br i1 %2160, label %2161, label %2148

2161:                                             ; preds = %2148, %2108, %2106
  %2162 = phi i8 addrspace(4)* [ %2147, %2108 ], [ %2102, %2106 ], [ %2102, %2148 ]
  %2163 = phi i32 [ %2146, %2108 ], [ 0, %2106 ], [ 0, %2148 ]
  %2164 = phi i64 [ %2145, %2108 ], [ 0, %2106 ], [ %2158, %2148 ]
  %2165 = icmp ugt i32 %2163, 7
  br i1 %2165, label %2168, label %2166

2166:                                             ; preds = %2161
  %2167 = icmp eq i32 %2163, 0
  br i1 %2167, label %2221, label %2208

2168:                                             ; preds = %2161
  %2169 = load i8, i8 addrspace(4)* %2162, align 1, !tbaa !19
  %2170 = zext i8 %2169 to i64
  %2171 = getelementptr inbounds i8, i8 addrspace(4)* %2162, i64 1
  %2172 = load i8, i8 addrspace(4)* %2171, align 1, !tbaa !19
  %2173 = zext i8 %2172 to i64
  %2174 = shl nuw nsw i64 %2173, 8
  %2175 = or i64 %2174, %2170
  %2176 = getelementptr inbounds i8, i8 addrspace(4)* %2162, i64 2
  %2177 = load i8, i8 addrspace(4)* %2176, align 1, !tbaa !19
  %2178 = zext i8 %2177 to i64
  %2179 = shl nuw nsw i64 %2178, 16
  %2180 = or i64 %2175, %2179
  %2181 = getelementptr inbounds i8, i8 addrspace(4)* %2162, i64 3
  %2182 = load i8, i8 addrspace(4)* %2181, align 1, !tbaa !19
  %2183 = zext i8 %2182 to i64
  %2184 = shl nuw nsw i64 %2183, 24
  %2185 = or i64 %2180, %2184
  %2186 = getelementptr inbounds i8, i8 addrspace(4)* %2162, i64 4
  %2187 = load i8, i8 addrspace(4)* %2186, align 1, !tbaa !19
  %2188 = zext i8 %2187 to i64
  %2189 = shl nuw nsw i64 %2188, 32
  %2190 = or i64 %2185, %2189
  %2191 = getelementptr inbounds i8, i8 addrspace(4)* %2162, i64 5
  %2192 = load i8, i8 addrspace(4)* %2191, align 1, !tbaa !19
  %2193 = zext i8 %2192 to i64
  %2194 = shl nuw nsw i64 %2193, 40
  %2195 = or i64 %2190, %2194
  %2196 = getelementptr inbounds i8, i8 addrspace(4)* %2162, i64 6
  %2197 = load i8, i8 addrspace(4)* %2196, align 1, !tbaa !19
  %2198 = zext i8 %2197 to i64
  %2199 = shl nuw nsw i64 %2198, 48
  %2200 = or i64 %2195, %2199
  %2201 = getelementptr inbounds i8, i8 addrspace(4)* %2162, i64 7
  %2202 = load i8, i8 addrspace(4)* %2201, align 1, !tbaa !19
  %2203 = zext i8 %2202 to i64
  %2204 = shl nuw i64 %2203, 56
  %2205 = or i64 %2200, %2204
  %2206 = add nsw i32 %2163, -8
  %2207 = getelementptr inbounds i8, i8 addrspace(4)* %2162, i64 8
  br label %2221

2208:                                             ; preds = %2166, %2208
  %2209 = phi i32 [ %2219, %2208 ], [ 0, %2166 ]
  %2210 = phi i64 [ %2218, %2208 ], [ 0, %2166 ]
  %2211 = zext i32 %2209 to i64
  %2212 = getelementptr inbounds i8, i8 addrspace(4)* %2162, i64 %2211
  %2213 = load i8, i8 addrspace(4)* %2212, align 1, !tbaa !19
  %2214 = zext i8 %2213 to i64
  %2215 = shl i32 %2209, 3
  %2216 = zext i32 %2215 to i64
  %2217 = shl nuw i64 %2214, %2216
  %2218 = or i64 %2217, %2210
  %2219 = add nuw nsw i32 %2209, 1
  %2220 = icmp eq i32 %2219, %2163
  br i1 %2220, label %2221, label %2208

2221:                                             ; preds = %2208, %2168, %2166
  %2222 = phi i8 addrspace(4)* [ %2207, %2168 ], [ %2162, %2166 ], [ %2162, %2208 ]
  %2223 = phi i32 [ %2206, %2168 ], [ 0, %2166 ], [ 0, %2208 ]
  %2224 = phi i64 [ %2205, %2168 ], [ 0, %2166 ], [ %2218, %2208 ]
  %2225 = icmp ugt i32 %2223, 7
  br i1 %2225, label %2228, label %2226

2226:                                             ; preds = %2221
  %2227 = icmp eq i32 %2223, 0
  br i1 %2227, label %2281, label %2268

2228:                                             ; preds = %2221
  %2229 = load i8, i8 addrspace(4)* %2222, align 1, !tbaa !19
  %2230 = zext i8 %2229 to i64
  %2231 = getelementptr inbounds i8, i8 addrspace(4)* %2222, i64 1
  %2232 = load i8, i8 addrspace(4)* %2231, align 1, !tbaa !19
  %2233 = zext i8 %2232 to i64
  %2234 = shl nuw nsw i64 %2233, 8
  %2235 = or i64 %2234, %2230
  %2236 = getelementptr inbounds i8, i8 addrspace(4)* %2222, i64 2
  %2237 = load i8, i8 addrspace(4)* %2236, align 1, !tbaa !19
  %2238 = zext i8 %2237 to i64
  %2239 = shl nuw nsw i64 %2238, 16
  %2240 = or i64 %2235, %2239
  %2241 = getelementptr inbounds i8, i8 addrspace(4)* %2222, i64 3
  %2242 = load i8, i8 addrspace(4)* %2241, align 1, !tbaa !19
  %2243 = zext i8 %2242 to i64
  %2244 = shl nuw nsw i64 %2243, 24
  %2245 = or i64 %2240, %2244
  %2246 = getelementptr inbounds i8, i8 addrspace(4)* %2222, i64 4
  %2247 = load i8, i8 addrspace(4)* %2246, align 1, !tbaa !19
  %2248 = zext i8 %2247 to i64
  %2249 = shl nuw nsw i64 %2248, 32
  %2250 = or i64 %2245, %2249
  %2251 = getelementptr inbounds i8, i8 addrspace(4)* %2222, i64 5
  %2252 = load i8, i8 addrspace(4)* %2251, align 1, !tbaa !19
  %2253 = zext i8 %2252 to i64
  %2254 = shl nuw nsw i64 %2253, 40
  %2255 = or i64 %2250, %2254
  %2256 = getelementptr inbounds i8, i8 addrspace(4)* %2222, i64 6
  %2257 = load i8, i8 addrspace(4)* %2256, align 1, !tbaa !19
  %2258 = zext i8 %2257 to i64
  %2259 = shl nuw nsw i64 %2258, 48
  %2260 = or i64 %2255, %2259
  %2261 = getelementptr inbounds i8, i8 addrspace(4)* %2222, i64 7
  %2262 = load i8, i8 addrspace(4)* %2261, align 1, !tbaa !19
  %2263 = zext i8 %2262 to i64
  %2264 = shl nuw i64 %2263, 56
  %2265 = or i64 %2260, %2264
  %2266 = add nsw i32 %2223, -8
  %2267 = getelementptr inbounds i8, i8 addrspace(4)* %2222, i64 8
  br label %2281

2268:                                             ; preds = %2226, %2268
  %2269 = phi i32 [ %2279, %2268 ], [ 0, %2226 ]
  %2270 = phi i64 [ %2278, %2268 ], [ 0, %2226 ]
  %2271 = zext i32 %2269 to i64
  %2272 = getelementptr inbounds i8, i8 addrspace(4)* %2222, i64 %2271
  %2273 = load i8, i8 addrspace(4)* %2272, align 1, !tbaa !19
  %2274 = zext i8 %2273 to i64
  %2275 = shl i32 %2269, 3
  %2276 = zext i32 %2275 to i64
  %2277 = shl nuw i64 %2274, %2276
  %2278 = or i64 %2277, %2270
  %2279 = add nuw nsw i32 %2269, 1
  %2280 = icmp eq i32 %2279, %2223
  br i1 %2280, label %2281, label %2268

2281:                                             ; preds = %2268, %2228, %2226
  %2282 = phi i8 addrspace(4)* [ %2267, %2228 ], [ %2222, %2226 ], [ %2222, %2268 ]
  %2283 = phi i32 [ %2266, %2228 ], [ 0, %2226 ], [ 0, %2268 ]
  %2284 = phi i64 [ %2265, %2228 ], [ 0, %2226 ], [ %2278, %2268 ]
  %2285 = icmp ugt i32 %2283, 7
  br i1 %2285, label %2288, label %2286

2286:                                             ; preds = %2281
  %2287 = icmp eq i32 %2283, 0
  br i1 %2287, label %2339, label %2326

2288:                                             ; preds = %2281
  %2289 = load i8, i8 addrspace(4)* %2282, align 1, !tbaa !19
  %2290 = zext i8 %2289 to i64
  %2291 = getelementptr inbounds i8, i8 addrspace(4)* %2282, i64 1
  %2292 = load i8, i8 addrspace(4)* %2291, align 1, !tbaa !19
  %2293 = zext i8 %2292 to i64
  %2294 = shl nuw nsw i64 %2293, 8
  %2295 = or i64 %2294, %2290
  %2296 = getelementptr inbounds i8, i8 addrspace(4)* %2282, i64 2
  %2297 = load i8, i8 addrspace(4)* %2296, align 1, !tbaa !19
  %2298 = zext i8 %2297 to i64
  %2299 = shl nuw nsw i64 %2298, 16
  %2300 = or i64 %2295, %2299
  %2301 = getelementptr inbounds i8, i8 addrspace(4)* %2282, i64 3
  %2302 = load i8, i8 addrspace(4)* %2301, align 1, !tbaa !19
  %2303 = zext i8 %2302 to i64
  %2304 = shl nuw nsw i64 %2303, 24
  %2305 = or i64 %2300, %2304
  %2306 = getelementptr inbounds i8, i8 addrspace(4)* %2282, i64 4
  %2307 = load i8, i8 addrspace(4)* %2306, align 1, !tbaa !19
  %2308 = zext i8 %2307 to i64
  %2309 = shl nuw nsw i64 %2308, 32
  %2310 = or i64 %2305, %2309
  %2311 = getelementptr inbounds i8, i8 addrspace(4)* %2282, i64 5
  %2312 = load i8, i8 addrspace(4)* %2311, align 1, !tbaa !19
  %2313 = zext i8 %2312 to i64
  %2314 = shl nuw nsw i64 %2313, 40
  %2315 = or i64 %2310, %2314
  %2316 = getelementptr inbounds i8, i8 addrspace(4)* %2282, i64 6
  %2317 = load i8, i8 addrspace(4)* %2316, align 1, !tbaa !19
  %2318 = zext i8 %2317 to i64
  %2319 = shl nuw nsw i64 %2318, 48
  %2320 = or i64 %2315, %2319
  %2321 = getelementptr inbounds i8, i8 addrspace(4)* %2282, i64 7
  %2322 = load i8, i8 addrspace(4)* %2321, align 1, !tbaa !19
  %2323 = zext i8 %2322 to i64
  %2324 = shl nuw i64 %2323, 56
  %2325 = or i64 %2320, %2324
  br label %2339

2326:                                             ; preds = %2286, %2326
  %2327 = phi i32 [ %2337, %2326 ], [ 0, %2286 ]
  %2328 = phi i64 [ %2336, %2326 ], [ 0, %2286 ]
  %2329 = zext i32 %2327 to i64
  %2330 = getelementptr inbounds i8, i8 addrspace(4)* %2282, i64 %2329
  %2331 = load i8, i8 addrspace(4)* %2330, align 1, !tbaa !19
  %2332 = zext i8 %2331 to i64
  %2333 = shl i32 %2327, 3
  %2334 = zext i32 %2333 to i64
  %2335 = shl nuw i64 %2332, %2334
  %2336 = or i64 %2335, %2328
  %2337 = add nuw nsw i32 %2327, 1
  %2338 = icmp eq i32 %2337, %2283
  br i1 %2338, label %2339, label %2326

2339:                                             ; preds = %2326, %2288, %2286
  %2340 = phi i64 [ %2325, %2288 ], [ 0, %2286 ], [ %2336, %2326 ]
  %2341 = shl nuw nsw i64 %1922, 2
  %2342 = add nuw nsw i64 %2341, 28
  %2343 = and i64 %2342, 480
  %2344 = and i64 %1924, -225
  %2345 = or i64 %2344, %2343
  %2346 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef %2345, i64 noundef %1984, i64 noundef %2044, i64 noundef %2104, i64 noundef %2164, i64 noundef %2224, i64 noundef %2284, i64 noundef %2340) #10
  %2347 = sub i64 %1914, %1922
  %2348 = getelementptr inbounds i8, i8 addrspace(4)* %1915, i64 %1922
  %2349 = icmp eq i64 %2347, 0
  br i1 %2349, label %2350, label %1913

2350:                                             ; preds = %2339, %1905
  %2351 = phi <2 x i64> [ %1908, %1905 ], [ %2346, %2339 ]
  %2352 = extractelement <2 x i64> %2351, i64 0
  %2353 = zext i32 %45 to i64
  %2354 = and i64 %2352, -227
  %2355 = or i64 %2354, 34
  %2356 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %66, i64 noundef %2355, i64 noundef %2353, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %2357

2357:                                             ; preds = %0, %2350
  %2358 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 24
  %2359 = bitcast i8 addrspace(4)* %2358 to i64 addrspace(4)*
  %2360 = load i64, i64 addrspace(4)* %2359, align 8, !tbaa !18
  %2361 = inttoptr i64 %2360 to i8 addrspace(1)*
  %2362 = addrspacecast i8 addrspace(1)* %2361 to i8*
  %2363 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2362, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %2364 = extractelement <2 x i64> %2363, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([120 x i8], [120 x i8] addrspace(4)* @.str.5, i64 0, i64 0) to i8*), i8* null), label %2374, label %2365

2365:                                             ; preds = %2357, %2365
  %2366 = phi i8 addrspace(4)* [ %2367, %2365 ], [ getelementptr inbounds ([120 x i8], [120 x i8] addrspace(4)* @.str.5, i64 0, i64 0), %2357 ]
  %2367 = getelementptr i8, i8 addrspace(4)* %2366, i64 1
  %2368 = load i8, i8 addrspace(4)* %2366, align 1
  %2369 = icmp eq i8 %2368, 0
  br i1 %2369, label %2370, label %2365

2370:                                             ; preds = %2365
  %2371 = addrspacecast i8 addrspace(4)* %2366 to i8*
  %2372 = ptrtoint i8* %2371 to i64
  %2373 = add i64 %2372, add (i64 sub (i64 0, i64 ptrtoint ([120 x i8]* addrspacecast ([120 x i8] addrspace(4)* @.str.5 to [120 x i8]*) to i64)), i64 1)
  br label %2374

2374:                                             ; preds = %2370, %2357
  %2375 = phi i64 [ %2373, %2370 ], [ 0, %2357 ]
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([120 x i8], [120 x i8] addrspace(4)* @.str.5, i64 0, i64 0) to i8*), i8* null), label %2376, label %2380

2376:                                             ; preds = %2374
  %2377 = and i64 %2364, -225
  %2378 = or i64 %2377, 32
  %2379 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2362, i64 noundef %2378, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %2821

2380:                                             ; preds = %2374
  %2381 = and i64 %2364, 2
  %2382 = and i64 %2364, -3
  %2383 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %2382, i64 0
  br label %2384

2384:                                             ; preds = %2810, %2380
  %2385 = phi i64 [ %2375, %2380 ], [ %2818, %2810 ]
  %2386 = phi i8 addrspace(4)* [ getelementptr inbounds ([120 x i8], [120 x i8] addrspace(4)* @.str.5, i64 0, i64 0), %2380 ], [ %2819, %2810 ]
  %2387 = phi <2 x i64> [ %2383, %2380 ], [ %2817, %2810 ]
  %2388 = icmp ugt i64 %2385, 56
  %2389 = extractelement <2 x i64> %2387, i64 0
  %2390 = or i64 %2389, %2381
  %2391 = insertelement <2 x i64> poison, i64 %2390, i64 0
  %2392 = select i1 %2388, <2 x i64> %2387, <2 x i64> %2391
  %2393 = tail call i64 @llvm.umin.i64(i64 %2385, i64 56)
  %2394 = trunc i64 %2393 to i32
  %2395 = extractelement <2 x i64> %2392, i64 0
  %2396 = icmp ugt i32 %2394, 7
  br i1 %2396, label %2399, label %2397

2397:                                             ; preds = %2384
  %2398 = icmp eq i32 %2394, 0
  br i1 %2398, label %2452, label %2439

2399:                                             ; preds = %2384
  %2400 = load i8, i8 addrspace(4)* %2386, align 1, !tbaa !19
  %2401 = zext i8 %2400 to i64
  %2402 = getelementptr inbounds i8, i8 addrspace(4)* %2386, i64 1
  %2403 = load i8, i8 addrspace(4)* %2402, align 1, !tbaa !19
  %2404 = zext i8 %2403 to i64
  %2405 = shl nuw nsw i64 %2404, 8
  %2406 = or i64 %2405, %2401
  %2407 = getelementptr inbounds i8, i8 addrspace(4)* %2386, i64 2
  %2408 = load i8, i8 addrspace(4)* %2407, align 1, !tbaa !19
  %2409 = zext i8 %2408 to i64
  %2410 = shl nuw nsw i64 %2409, 16
  %2411 = or i64 %2406, %2410
  %2412 = getelementptr inbounds i8, i8 addrspace(4)* %2386, i64 3
  %2413 = load i8, i8 addrspace(4)* %2412, align 1, !tbaa !19
  %2414 = zext i8 %2413 to i64
  %2415 = shl nuw nsw i64 %2414, 24
  %2416 = or i64 %2411, %2415
  %2417 = getelementptr inbounds i8, i8 addrspace(4)* %2386, i64 4
  %2418 = load i8, i8 addrspace(4)* %2417, align 1, !tbaa !19
  %2419 = zext i8 %2418 to i64
  %2420 = shl nuw nsw i64 %2419, 32
  %2421 = or i64 %2416, %2420
  %2422 = getelementptr inbounds i8, i8 addrspace(4)* %2386, i64 5
  %2423 = load i8, i8 addrspace(4)* %2422, align 1, !tbaa !19
  %2424 = zext i8 %2423 to i64
  %2425 = shl nuw nsw i64 %2424, 40
  %2426 = or i64 %2421, %2425
  %2427 = getelementptr inbounds i8, i8 addrspace(4)* %2386, i64 6
  %2428 = load i8, i8 addrspace(4)* %2427, align 1, !tbaa !19
  %2429 = zext i8 %2428 to i64
  %2430 = shl nuw nsw i64 %2429, 48
  %2431 = or i64 %2426, %2430
  %2432 = getelementptr inbounds i8, i8 addrspace(4)* %2386, i64 7
  %2433 = load i8, i8 addrspace(4)* %2432, align 1, !tbaa !19
  %2434 = zext i8 %2433 to i64
  %2435 = shl nuw i64 %2434, 56
  %2436 = or i64 %2431, %2435
  %2437 = add nsw i32 %2394, -8
  %2438 = getelementptr inbounds i8, i8 addrspace(4)* %2386, i64 8
  br label %2452

2439:                                             ; preds = %2397, %2439
  %2440 = phi i32 [ %2450, %2439 ], [ 0, %2397 ]
  %2441 = phi i64 [ %2449, %2439 ], [ 0, %2397 ]
  %2442 = zext i32 %2440 to i64
  %2443 = getelementptr inbounds i8, i8 addrspace(4)* %2386, i64 %2442
  %2444 = load i8, i8 addrspace(4)* %2443, align 1, !tbaa !19
  %2445 = zext i8 %2444 to i64
  %2446 = shl i32 %2440, 3
  %2447 = zext i32 %2446 to i64
  %2448 = shl nuw i64 %2445, %2447
  %2449 = or i64 %2448, %2441
  %2450 = add nuw nsw i32 %2440, 1
  %2451 = icmp eq i32 %2450, %2394
  br i1 %2451, label %2452, label %2439, !llvm.loop !20

2452:                                             ; preds = %2439, %2399, %2397
  %2453 = phi i8 addrspace(4)* [ %2438, %2399 ], [ %2386, %2397 ], [ %2386, %2439 ]
  %2454 = phi i32 [ %2437, %2399 ], [ 0, %2397 ], [ 0, %2439 ]
  %2455 = phi i64 [ %2436, %2399 ], [ 0, %2397 ], [ %2449, %2439 ]
  %2456 = icmp ugt i32 %2454, 7
  br i1 %2456, label %2459, label %2457

2457:                                             ; preds = %2452
  %2458 = icmp eq i32 %2454, 0
  br i1 %2458, label %2512, label %2499

2459:                                             ; preds = %2452
  %2460 = load i8, i8 addrspace(4)* %2453, align 1, !tbaa !19
  %2461 = zext i8 %2460 to i64
  %2462 = getelementptr inbounds i8, i8 addrspace(4)* %2453, i64 1
  %2463 = load i8, i8 addrspace(4)* %2462, align 1, !tbaa !19
  %2464 = zext i8 %2463 to i64
  %2465 = shl nuw nsw i64 %2464, 8
  %2466 = or i64 %2465, %2461
  %2467 = getelementptr inbounds i8, i8 addrspace(4)* %2453, i64 2
  %2468 = load i8, i8 addrspace(4)* %2467, align 1, !tbaa !19
  %2469 = zext i8 %2468 to i64
  %2470 = shl nuw nsw i64 %2469, 16
  %2471 = or i64 %2466, %2470
  %2472 = getelementptr inbounds i8, i8 addrspace(4)* %2453, i64 3
  %2473 = load i8, i8 addrspace(4)* %2472, align 1, !tbaa !19
  %2474 = zext i8 %2473 to i64
  %2475 = shl nuw nsw i64 %2474, 24
  %2476 = or i64 %2471, %2475
  %2477 = getelementptr inbounds i8, i8 addrspace(4)* %2453, i64 4
  %2478 = load i8, i8 addrspace(4)* %2477, align 1, !tbaa !19
  %2479 = zext i8 %2478 to i64
  %2480 = shl nuw nsw i64 %2479, 32
  %2481 = or i64 %2476, %2480
  %2482 = getelementptr inbounds i8, i8 addrspace(4)* %2453, i64 5
  %2483 = load i8, i8 addrspace(4)* %2482, align 1, !tbaa !19
  %2484 = zext i8 %2483 to i64
  %2485 = shl nuw nsw i64 %2484, 40
  %2486 = or i64 %2481, %2485
  %2487 = getelementptr inbounds i8, i8 addrspace(4)* %2453, i64 6
  %2488 = load i8, i8 addrspace(4)* %2487, align 1, !tbaa !19
  %2489 = zext i8 %2488 to i64
  %2490 = shl nuw nsw i64 %2489, 48
  %2491 = or i64 %2486, %2490
  %2492 = getelementptr inbounds i8, i8 addrspace(4)* %2453, i64 7
  %2493 = load i8, i8 addrspace(4)* %2492, align 1, !tbaa !19
  %2494 = zext i8 %2493 to i64
  %2495 = shl nuw i64 %2494, 56
  %2496 = or i64 %2491, %2495
  %2497 = add nsw i32 %2454, -8
  %2498 = getelementptr inbounds i8, i8 addrspace(4)* %2453, i64 8
  br label %2512

2499:                                             ; preds = %2457, %2499
  %2500 = phi i32 [ %2510, %2499 ], [ 0, %2457 ]
  %2501 = phi i64 [ %2509, %2499 ], [ 0, %2457 ]
  %2502 = zext i32 %2500 to i64
  %2503 = getelementptr inbounds i8, i8 addrspace(4)* %2453, i64 %2502
  %2504 = load i8, i8 addrspace(4)* %2503, align 1, !tbaa !19
  %2505 = zext i8 %2504 to i64
  %2506 = shl i32 %2500, 3
  %2507 = zext i32 %2506 to i64
  %2508 = shl nuw i64 %2505, %2507
  %2509 = or i64 %2508, %2501
  %2510 = add nuw nsw i32 %2500, 1
  %2511 = icmp eq i32 %2510, %2454
  br i1 %2511, label %2512, label %2499

2512:                                             ; preds = %2499, %2459, %2457
  %2513 = phi i8 addrspace(4)* [ %2498, %2459 ], [ %2453, %2457 ], [ %2453, %2499 ]
  %2514 = phi i32 [ %2497, %2459 ], [ 0, %2457 ], [ 0, %2499 ]
  %2515 = phi i64 [ %2496, %2459 ], [ 0, %2457 ], [ %2509, %2499 ]
  %2516 = icmp ugt i32 %2514, 7
  br i1 %2516, label %2519, label %2517

2517:                                             ; preds = %2512
  %2518 = icmp eq i32 %2514, 0
  br i1 %2518, label %2572, label %2559

2519:                                             ; preds = %2512
  %2520 = load i8, i8 addrspace(4)* %2513, align 1, !tbaa !19
  %2521 = zext i8 %2520 to i64
  %2522 = getelementptr inbounds i8, i8 addrspace(4)* %2513, i64 1
  %2523 = load i8, i8 addrspace(4)* %2522, align 1, !tbaa !19
  %2524 = zext i8 %2523 to i64
  %2525 = shl nuw nsw i64 %2524, 8
  %2526 = or i64 %2525, %2521
  %2527 = getelementptr inbounds i8, i8 addrspace(4)* %2513, i64 2
  %2528 = load i8, i8 addrspace(4)* %2527, align 1, !tbaa !19
  %2529 = zext i8 %2528 to i64
  %2530 = shl nuw nsw i64 %2529, 16
  %2531 = or i64 %2526, %2530
  %2532 = getelementptr inbounds i8, i8 addrspace(4)* %2513, i64 3
  %2533 = load i8, i8 addrspace(4)* %2532, align 1, !tbaa !19
  %2534 = zext i8 %2533 to i64
  %2535 = shl nuw nsw i64 %2534, 24
  %2536 = or i64 %2531, %2535
  %2537 = getelementptr inbounds i8, i8 addrspace(4)* %2513, i64 4
  %2538 = load i8, i8 addrspace(4)* %2537, align 1, !tbaa !19
  %2539 = zext i8 %2538 to i64
  %2540 = shl nuw nsw i64 %2539, 32
  %2541 = or i64 %2536, %2540
  %2542 = getelementptr inbounds i8, i8 addrspace(4)* %2513, i64 5
  %2543 = load i8, i8 addrspace(4)* %2542, align 1, !tbaa !19
  %2544 = zext i8 %2543 to i64
  %2545 = shl nuw nsw i64 %2544, 40
  %2546 = or i64 %2541, %2545
  %2547 = getelementptr inbounds i8, i8 addrspace(4)* %2513, i64 6
  %2548 = load i8, i8 addrspace(4)* %2547, align 1, !tbaa !19
  %2549 = zext i8 %2548 to i64
  %2550 = shl nuw nsw i64 %2549, 48
  %2551 = or i64 %2546, %2550
  %2552 = getelementptr inbounds i8, i8 addrspace(4)* %2513, i64 7
  %2553 = load i8, i8 addrspace(4)* %2552, align 1, !tbaa !19
  %2554 = zext i8 %2553 to i64
  %2555 = shl nuw i64 %2554, 56
  %2556 = or i64 %2551, %2555
  %2557 = add nsw i32 %2514, -8
  %2558 = getelementptr inbounds i8, i8 addrspace(4)* %2513, i64 8
  br label %2572

2559:                                             ; preds = %2517, %2559
  %2560 = phi i32 [ %2570, %2559 ], [ 0, %2517 ]
  %2561 = phi i64 [ %2569, %2559 ], [ 0, %2517 ]
  %2562 = zext i32 %2560 to i64
  %2563 = getelementptr inbounds i8, i8 addrspace(4)* %2513, i64 %2562
  %2564 = load i8, i8 addrspace(4)* %2563, align 1, !tbaa !19
  %2565 = zext i8 %2564 to i64
  %2566 = shl i32 %2560, 3
  %2567 = zext i32 %2566 to i64
  %2568 = shl nuw i64 %2565, %2567
  %2569 = or i64 %2568, %2561
  %2570 = add nuw nsw i32 %2560, 1
  %2571 = icmp eq i32 %2570, %2514
  br i1 %2571, label %2572, label %2559

2572:                                             ; preds = %2559, %2519, %2517
  %2573 = phi i8 addrspace(4)* [ %2558, %2519 ], [ %2513, %2517 ], [ %2513, %2559 ]
  %2574 = phi i32 [ %2557, %2519 ], [ 0, %2517 ], [ 0, %2559 ]
  %2575 = phi i64 [ %2556, %2519 ], [ 0, %2517 ], [ %2569, %2559 ]
  %2576 = icmp ugt i32 %2574, 7
  br i1 %2576, label %2579, label %2577

2577:                                             ; preds = %2572
  %2578 = icmp eq i32 %2574, 0
  br i1 %2578, label %2632, label %2619

2579:                                             ; preds = %2572
  %2580 = load i8, i8 addrspace(4)* %2573, align 1, !tbaa !19
  %2581 = zext i8 %2580 to i64
  %2582 = getelementptr inbounds i8, i8 addrspace(4)* %2573, i64 1
  %2583 = load i8, i8 addrspace(4)* %2582, align 1, !tbaa !19
  %2584 = zext i8 %2583 to i64
  %2585 = shl nuw nsw i64 %2584, 8
  %2586 = or i64 %2585, %2581
  %2587 = getelementptr inbounds i8, i8 addrspace(4)* %2573, i64 2
  %2588 = load i8, i8 addrspace(4)* %2587, align 1, !tbaa !19
  %2589 = zext i8 %2588 to i64
  %2590 = shl nuw nsw i64 %2589, 16
  %2591 = or i64 %2586, %2590
  %2592 = getelementptr inbounds i8, i8 addrspace(4)* %2573, i64 3
  %2593 = load i8, i8 addrspace(4)* %2592, align 1, !tbaa !19
  %2594 = zext i8 %2593 to i64
  %2595 = shl nuw nsw i64 %2594, 24
  %2596 = or i64 %2591, %2595
  %2597 = getelementptr inbounds i8, i8 addrspace(4)* %2573, i64 4
  %2598 = load i8, i8 addrspace(4)* %2597, align 1, !tbaa !19
  %2599 = zext i8 %2598 to i64
  %2600 = shl nuw nsw i64 %2599, 32
  %2601 = or i64 %2596, %2600
  %2602 = getelementptr inbounds i8, i8 addrspace(4)* %2573, i64 5
  %2603 = load i8, i8 addrspace(4)* %2602, align 1, !tbaa !19
  %2604 = zext i8 %2603 to i64
  %2605 = shl nuw nsw i64 %2604, 40
  %2606 = or i64 %2601, %2605
  %2607 = getelementptr inbounds i8, i8 addrspace(4)* %2573, i64 6
  %2608 = load i8, i8 addrspace(4)* %2607, align 1, !tbaa !19
  %2609 = zext i8 %2608 to i64
  %2610 = shl nuw nsw i64 %2609, 48
  %2611 = or i64 %2606, %2610
  %2612 = getelementptr inbounds i8, i8 addrspace(4)* %2573, i64 7
  %2613 = load i8, i8 addrspace(4)* %2612, align 1, !tbaa !19
  %2614 = zext i8 %2613 to i64
  %2615 = shl nuw i64 %2614, 56
  %2616 = or i64 %2611, %2615
  %2617 = add nsw i32 %2574, -8
  %2618 = getelementptr inbounds i8, i8 addrspace(4)* %2573, i64 8
  br label %2632

2619:                                             ; preds = %2577, %2619
  %2620 = phi i32 [ %2630, %2619 ], [ 0, %2577 ]
  %2621 = phi i64 [ %2629, %2619 ], [ 0, %2577 ]
  %2622 = zext i32 %2620 to i64
  %2623 = getelementptr inbounds i8, i8 addrspace(4)* %2573, i64 %2622
  %2624 = load i8, i8 addrspace(4)* %2623, align 1, !tbaa !19
  %2625 = zext i8 %2624 to i64
  %2626 = shl i32 %2620, 3
  %2627 = zext i32 %2626 to i64
  %2628 = shl nuw i64 %2625, %2627
  %2629 = or i64 %2628, %2621
  %2630 = add nuw nsw i32 %2620, 1
  %2631 = icmp eq i32 %2630, %2574
  br i1 %2631, label %2632, label %2619

2632:                                             ; preds = %2619, %2579, %2577
  %2633 = phi i8 addrspace(4)* [ %2618, %2579 ], [ %2573, %2577 ], [ %2573, %2619 ]
  %2634 = phi i32 [ %2617, %2579 ], [ 0, %2577 ], [ 0, %2619 ]
  %2635 = phi i64 [ %2616, %2579 ], [ 0, %2577 ], [ %2629, %2619 ]
  %2636 = icmp ugt i32 %2634, 7
  br i1 %2636, label %2639, label %2637

2637:                                             ; preds = %2632
  %2638 = icmp eq i32 %2634, 0
  br i1 %2638, label %2692, label %2679

2639:                                             ; preds = %2632
  %2640 = load i8, i8 addrspace(4)* %2633, align 1, !tbaa !19
  %2641 = zext i8 %2640 to i64
  %2642 = getelementptr inbounds i8, i8 addrspace(4)* %2633, i64 1
  %2643 = load i8, i8 addrspace(4)* %2642, align 1, !tbaa !19
  %2644 = zext i8 %2643 to i64
  %2645 = shl nuw nsw i64 %2644, 8
  %2646 = or i64 %2645, %2641
  %2647 = getelementptr inbounds i8, i8 addrspace(4)* %2633, i64 2
  %2648 = load i8, i8 addrspace(4)* %2647, align 1, !tbaa !19
  %2649 = zext i8 %2648 to i64
  %2650 = shl nuw nsw i64 %2649, 16
  %2651 = or i64 %2646, %2650
  %2652 = getelementptr inbounds i8, i8 addrspace(4)* %2633, i64 3
  %2653 = load i8, i8 addrspace(4)* %2652, align 1, !tbaa !19
  %2654 = zext i8 %2653 to i64
  %2655 = shl nuw nsw i64 %2654, 24
  %2656 = or i64 %2651, %2655
  %2657 = getelementptr inbounds i8, i8 addrspace(4)* %2633, i64 4
  %2658 = load i8, i8 addrspace(4)* %2657, align 1, !tbaa !19
  %2659 = zext i8 %2658 to i64
  %2660 = shl nuw nsw i64 %2659, 32
  %2661 = or i64 %2656, %2660
  %2662 = getelementptr inbounds i8, i8 addrspace(4)* %2633, i64 5
  %2663 = load i8, i8 addrspace(4)* %2662, align 1, !tbaa !19
  %2664 = zext i8 %2663 to i64
  %2665 = shl nuw nsw i64 %2664, 40
  %2666 = or i64 %2661, %2665
  %2667 = getelementptr inbounds i8, i8 addrspace(4)* %2633, i64 6
  %2668 = load i8, i8 addrspace(4)* %2667, align 1, !tbaa !19
  %2669 = zext i8 %2668 to i64
  %2670 = shl nuw nsw i64 %2669, 48
  %2671 = or i64 %2666, %2670
  %2672 = getelementptr inbounds i8, i8 addrspace(4)* %2633, i64 7
  %2673 = load i8, i8 addrspace(4)* %2672, align 1, !tbaa !19
  %2674 = zext i8 %2673 to i64
  %2675 = shl nuw i64 %2674, 56
  %2676 = or i64 %2671, %2675
  %2677 = add nsw i32 %2634, -8
  %2678 = getelementptr inbounds i8, i8 addrspace(4)* %2633, i64 8
  br label %2692

2679:                                             ; preds = %2637, %2679
  %2680 = phi i32 [ %2690, %2679 ], [ 0, %2637 ]
  %2681 = phi i64 [ %2689, %2679 ], [ 0, %2637 ]
  %2682 = zext i32 %2680 to i64
  %2683 = getelementptr inbounds i8, i8 addrspace(4)* %2633, i64 %2682
  %2684 = load i8, i8 addrspace(4)* %2683, align 1, !tbaa !19
  %2685 = zext i8 %2684 to i64
  %2686 = shl i32 %2680, 3
  %2687 = zext i32 %2686 to i64
  %2688 = shl nuw i64 %2685, %2687
  %2689 = or i64 %2688, %2681
  %2690 = add nuw nsw i32 %2680, 1
  %2691 = icmp eq i32 %2690, %2634
  br i1 %2691, label %2692, label %2679

2692:                                             ; preds = %2679, %2639, %2637
  %2693 = phi i8 addrspace(4)* [ %2678, %2639 ], [ %2633, %2637 ], [ %2633, %2679 ]
  %2694 = phi i32 [ %2677, %2639 ], [ 0, %2637 ], [ 0, %2679 ]
  %2695 = phi i64 [ %2676, %2639 ], [ 0, %2637 ], [ %2689, %2679 ]
  %2696 = icmp ugt i32 %2694, 7
  br i1 %2696, label %2699, label %2697

2697:                                             ; preds = %2692
  %2698 = icmp eq i32 %2694, 0
  br i1 %2698, label %2752, label %2739

2699:                                             ; preds = %2692
  %2700 = load i8, i8 addrspace(4)* %2693, align 1, !tbaa !19
  %2701 = zext i8 %2700 to i64
  %2702 = getelementptr inbounds i8, i8 addrspace(4)* %2693, i64 1
  %2703 = load i8, i8 addrspace(4)* %2702, align 1, !tbaa !19
  %2704 = zext i8 %2703 to i64
  %2705 = shl nuw nsw i64 %2704, 8
  %2706 = or i64 %2705, %2701
  %2707 = getelementptr inbounds i8, i8 addrspace(4)* %2693, i64 2
  %2708 = load i8, i8 addrspace(4)* %2707, align 1, !tbaa !19
  %2709 = zext i8 %2708 to i64
  %2710 = shl nuw nsw i64 %2709, 16
  %2711 = or i64 %2706, %2710
  %2712 = getelementptr inbounds i8, i8 addrspace(4)* %2693, i64 3
  %2713 = load i8, i8 addrspace(4)* %2712, align 1, !tbaa !19
  %2714 = zext i8 %2713 to i64
  %2715 = shl nuw nsw i64 %2714, 24
  %2716 = or i64 %2711, %2715
  %2717 = getelementptr inbounds i8, i8 addrspace(4)* %2693, i64 4
  %2718 = load i8, i8 addrspace(4)* %2717, align 1, !tbaa !19
  %2719 = zext i8 %2718 to i64
  %2720 = shl nuw nsw i64 %2719, 32
  %2721 = or i64 %2716, %2720
  %2722 = getelementptr inbounds i8, i8 addrspace(4)* %2693, i64 5
  %2723 = load i8, i8 addrspace(4)* %2722, align 1, !tbaa !19
  %2724 = zext i8 %2723 to i64
  %2725 = shl nuw nsw i64 %2724, 40
  %2726 = or i64 %2721, %2725
  %2727 = getelementptr inbounds i8, i8 addrspace(4)* %2693, i64 6
  %2728 = load i8, i8 addrspace(4)* %2727, align 1, !tbaa !19
  %2729 = zext i8 %2728 to i64
  %2730 = shl nuw nsw i64 %2729, 48
  %2731 = or i64 %2726, %2730
  %2732 = getelementptr inbounds i8, i8 addrspace(4)* %2693, i64 7
  %2733 = load i8, i8 addrspace(4)* %2732, align 1, !tbaa !19
  %2734 = zext i8 %2733 to i64
  %2735 = shl nuw i64 %2734, 56
  %2736 = or i64 %2731, %2735
  %2737 = add nsw i32 %2694, -8
  %2738 = getelementptr inbounds i8, i8 addrspace(4)* %2693, i64 8
  br label %2752

2739:                                             ; preds = %2697, %2739
  %2740 = phi i32 [ %2750, %2739 ], [ 0, %2697 ]
  %2741 = phi i64 [ %2749, %2739 ], [ 0, %2697 ]
  %2742 = zext i32 %2740 to i64
  %2743 = getelementptr inbounds i8, i8 addrspace(4)* %2693, i64 %2742
  %2744 = load i8, i8 addrspace(4)* %2743, align 1, !tbaa !19
  %2745 = zext i8 %2744 to i64
  %2746 = shl i32 %2740, 3
  %2747 = zext i32 %2746 to i64
  %2748 = shl nuw i64 %2745, %2747
  %2749 = or i64 %2748, %2741
  %2750 = add nuw nsw i32 %2740, 1
  %2751 = icmp eq i32 %2750, %2694
  br i1 %2751, label %2752, label %2739

2752:                                             ; preds = %2739, %2699, %2697
  %2753 = phi i8 addrspace(4)* [ %2738, %2699 ], [ %2693, %2697 ], [ %2693, %2739 ]
  %2754 = phi i32 [ %2737, %2699 ], [ 0, %2697 ], [ 0, %2739 ]
  %2755 = phi i64 [ %2736, %2699 ], [ 0, %2697 ], [ %2749, %2739 ]
  %2756 = icmp ugt i32 %2754, 7
  br i1 %2756, label %2759, label %2757

2757:                                             ; preds = %2752
  %2758 = icmp eq i32 %2754, 0
  br i1 %2758, label %2810, label %2797

2759:                                             ; preds = %2752
  %2760 = load i8, i8 addrspace(4)* %2753, align 1, !tbaa !19
  %2761 = zext i8 %2760 to i64
  %2762 = getelementptr inbounds i8, i8 addrspace(4)* %2753, i64 1
  %2763 = load i8, i8 addrspace(4)* %2762, align 1, !tbaa !19
  %2764 = zext i8 %2763 to i64
  %2765 = shl nuw nsw i64 %2764, 8
  %2766 = or i64 %2765, %2761
  %2767 = getelementptr inbounds i8, i8 addrspace(4)* %2753, i64 2
  %2768 = load i8, i8 addrspace(4)* %2767, align 1, !tbaa !19
  %2769 = zext i8 %2768 to i64
  %2770 = shl nuw nsw i64 %2769, 16
  %2771 = or i64 %2766, %2770
  %2772 = getelementptr inbounds i8, i8 addrspace(4)* %2753, i64 3
  %2773 = load i8, i8 addrspace(4)* %2772, align 1, !tbaa !19
  %2774 = zext i8 %2773 to i64
  %2775 = shl nuw nsw i64 %2774, 24
  %2776 = or i64 %2771, %2775
  %2777 = getelementptr inbounds i8, i8 addrspace(4)* %2753, i64 4
  %2778 = load i8, i8 addrspace(4)* %2777, align 1, !tbaa !19
  %2779 = zext i8 %2778 to i64
  %2780 = shl nuw nsw i64 %2779, 32
  %2781 = or i64 %2776, %2780
  %2782 = getelementptr inbounds i8, i8 addrspace(4)* %2753, i64 5
  %2783 = load i8, i8 addrspace(4)* %2782, align 1, !tbaa !19
  %2784 = zext i8 %2783 to i64
  %2785 = shl nuw nsw i64 %2784, 40
  %2786 = or i64 %2781, %2785
  %2787 = getelementptr inbounds i8, i8 addrspace(4)* %2753, i64 6
  %2788 = load i8, i8 addrspace(4)* %2787, align 1, !tbaa !19
  %2789 = zext i8 %2788 to i64
  %2790 = shl nuw nsw i64 %2789, 48
  %2791 = or i64 %2786, %2790
  %2792 = getelementptr inbounds i8, i8 addrspace(4)* %2753, i64 7
  %2793 = load i8, i8 addrspace(4)* %2792, align 1, !tbaa !19
  %2794 = zext i8 %2793 to i64
  %2795 = shl nuw i64 %2794, 56
  %2796 = or i64 %2791, %2795
  br label %2810

2797:                                             ; preds = %2757, %2797
  %2798 = phi i32 [ %2808, %2797 ], [ 0, %2757 ]
  %2799 = phi i64 [ %2807, %2797 ], [ 0, %2757 ]
  %2800 = zext i32 %2798 to i64
  %2801 = getelementptr inbounds i8, i8 addrspace(4)* %2753, i64 %2800
  %2802 = load i8, i8 addrspace(4)* %2801, align 1, !tbaa !19
  %2803 = zext i8 %2802 to i64
  %2804 = shl i32 %2798, 3
  %2805 = zext i32 %2804 to i64
  %2806 = shl nuw i64 %2803, %2805
  %2807 = or i64 %2806, %2799
  %2808 = add nuw nsw i32 %2798, 1
  %2809 = icmp eq i32 %2808, %2754
  br i1 %2809, label %2810, label %2797

2810:                                             ; preds = %2797, %2759, %2757
  %2811 = phi i64 [ %2796, %2759 ], [ 0, %2757 ], [ %2807, %2797 ]
  %2812 = shl nuw nsw i64 %2393, 2
  %2813 = add nuw nsw i64 %2812, 28
  %2814 = and i64 %2813, 480
  %2815 = and i64 %2395, -225
  %2816 = or i64 %2815, %2814
  %2817 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2362, i64 noundef %2816, i64 noundef %2455, i64 noundef %2515, i64 noundef %2575, i64 noundef %2635, i64 noundef %2695, i64 noundef %2755, i64 noundef %2811) #10
  %2818 = sub i64 %2385, %2393
  %2819 = getelementptr inbounds i8, i8 addrspace(4)* %2386, i64 %2393
  %2820 = icmp eq i64 %2818, 0
  br i1 %2820, label %2821, label %2384

2821:                                             ; preds = %2810, %2376
  %2822 = phi <2 x i64> [ %2379, %2376 ], [ %2817, %2810 ]
  %2823 = extractelement <2 x i64> %2822, i64 0
  %2824 = zext i32 %51 to i64
  %2825 = and i64 %2823, -225
  %2826 = or i64 %2825, 32
  %2827 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2362, i64 noundef %2826, i64 noundef %2824, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %2828 = extractelement <2 x i64> %2827, i64 0
  %2829 = zext i32 %52 to i64
  %2830 = and i64 %2828, -225
  %2831 = or i64 %2830, 32
  %2832 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2362, i64 noundef %2831, i64 noundef %2829, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %2833 = extractelement <2 x i64> %2832, i64 0
  %2834 = zext i32 %53 to i64
  %2835 = and i64 %2833, -225
  %2836 = or i64 %2835, 32
  %2837 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2362, i64 noundef %2836, i64 noundef %2834, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %2838 = extractelement <2 x i64> %2837, i64 0
  %2839 = zext i32 %2 to i64
  %2840 = and i64 %2838, -225
  %2841 = or i64 %2840, 32
  %2842 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2362, i64 noundef %2841, i64 noundef %2839, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %2843 = extractelement <2 x i64> %2842, i64 0
  %2844 = zext i32 %10 to i64
  %2845 = and i64 %2843, -225
  %2846 = or i64 %2845, 32
  %2847 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2362, i64 noundef %2846, i64 noundef %2844, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %2848 = extractelement <2 x i64> %2847, i64 0
  %2849 = zext i32 %19 to i64
  %2850 = and i64 %2848, -225
  %2851 = or i64 %2850, 32
  %2852 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2362, i64 noundef %2851, i64 noundef %2849, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %2853 = extractelement <2 x i64> %2852, i64 0
  %2854 = zext i32 %32 to i64
  %2855 = and i64 %2853, -225
  %2856 = or i64 %2855, 32
  %2857 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2362, i64 noundef %2856, i64 noundef %2854, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %2858 = extractelement <2 x i64> %2857, i64 0
  %2859 = zext i32 %37 to i64
  %2860 = and i64 %2858, -225
  %2861 = or i64 %2860, 32
  %2862 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2362, i64 noundef %2861, i64 noundef %2859, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %2863 = extractelement <2 x i64> %2862, i64 0
  %2864 = zext i32 %43 to i64
  %2865 = and i64 %2863, -225
  %2866 = or i64 %2865, 32
  %2867 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2362, i64 noundef %2866, i64 noundef %2864, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %2868 = extractelement <2 x i64> %2867, i64 0
  %2869 = zext i16 %5 to i64
  %2870 = and i64 %2868, -225
  %2871 = or i64 %2870, 32
  %2872 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2362, i64 noundef %2871, i64 noundef %2869, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %2873 = extractelement <2 x i64> %2872, i64 0
  %2874 = zext i16 %13 to i64
  %2875 = and i64 %2873, -225
  %2876 = or i64 %2875, 32
  %2877 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2362, i64 noundef %2876, i64 noundef %2874, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %2878 = extractelement <2 x i64> %2877, i64 0
  %2879 = zext i16 %22 to i64
  %2880 = and i64 %2878, -225
  %2881 = or i64 %2880, 32
  %2882 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2362, i64 noundef %2881, i64 noundef %2879, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %2883 = extractelement <2 x i64> %2882, i64 0
  %2884 = zext i32 %58 to i64
  %2885 = and i64 %2883, -227
  %2886 = or i64 %2885, 34
  %2887 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %2362, i64 noundef %2886, i64 noundef %2884, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !22
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !23
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !18
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !18
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !18
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !18
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !18
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !18
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !18
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !18
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !23
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !24
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !23
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !23
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !22
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !25
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !27
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !25
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !27
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !18
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !18
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !25
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !27
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !22
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !18
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !28
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !27
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !22
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !22
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !22
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !23
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !18
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !18
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !18
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !18
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !18
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !18
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !18
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !18
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %110 = call i64 @llvm.read_register.i64(metadata !29) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !30
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !32
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !33
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !18
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !18
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !18
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !18
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !18
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !18
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !18
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !18
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !18
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !25
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !27
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !34
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !34
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !35
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !37
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !22
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !22
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !18
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !18
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !19
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !18
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !27
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !25
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !34
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !34
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !19
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
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{!7, !11, i64 16}
!16 = !{!7, !11, i64 20}
!17 = !{i32 0, i32 1024}
!18 = !{!12, !12, i64 0}
!19 = !{!9, !9, i64 0}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = !{!13, !13, i64 0}
!23 = !{!11, !11, i64 0}
!24 = !{i64 2662}
!25 = !{!26, !13, i64 0}
!26 = !{!"", !13, i64 0, !13, i64 8, !14, i64 16, !12, i64 24, !12, i64 32, !12, i64 40}
!27 = !{!26, !12, i64 40}
!28 = !{!26, !13, i64 8}
!29 = !{!"exec"}
!30 = !{!31, !11, i64 16}
!31 = !{!"", !12, i64 0, !12, i64 8, !11, i64 16, !11, i64 20}
!32 = !{!31, !12, i64 8}
!33 = !{!31, !11, i64 20}
!34 = !{!31, !12, i64 0}
!35 = !{!36, !12, i64 16}
!36 = !{!"amd_signal_s", !12, i64 0, !9, i64 8, !12, i64 16, !11, i64 24, !11, i64 28, !12, i64 32, !12, i64 40, !9, i64 48, !9, i64 56}
!37 = !{!36, !11, i64 24}
