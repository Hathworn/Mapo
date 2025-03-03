; ModuleID = '../data/hip_kernels/8448/5/main.cu'
source_filename = "../data/hip_kernels/8448/5/main.cu"
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

@_ZZ18histogram_creationPiS_iE10local_hist = internal addrspace(3) global [6 x i32] undef, align 16
@.str.2 = private unnamed_addr addrspace(4) constant [24 x i8] c"%d histogram_local %d \0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z18histogram_creationPiS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2) local_unnamed_addr #1 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp ult i32 %11, 6
  br i1 %13, label %18, label %14

14:                                               ; preds = %18, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %15 = icmp slt i32 %12, 65
  br i1 %15, label %16, label %23

16:                                               ; preds = %14
  %17 = mul i32 %8, %2
  br label %31

18:                                               ; preds = %3, %18
  %19 = phi i32 [ %21, %18 ], [ %11, %3 ]
  %20 = getelementptr inbounds [6 x i32], [6 x i32] addrspace(3)* @_ZZ18histogram_creationPiS_iE10local_hist, i32 0, i32 %19
  store i32 0, i32 addrspace(3)* %20, align 4, !tbaa !7
  %21 = add nuw nsw i32 %19, %8
  %22 = icmp ult i32 %21, 6
  br i1 %22, label %18, label %14, !llvm.loop !11

23:                                               ; preds = %31, %14
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %13, label %24, label %40

24:                                               ; preds = %23
  %25 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %26 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 24
  %27 = bitcast i8 addrspace(4)* %26 to i64 addrspace(4)*
  %28 = load i64, i64 addrspace(4)* %27, align 8, !tbaa !13
  %29 = inttoptr i64 %28 to i8 addrspace(1)*
  %30 = addrspacecast i8 addrspace(1)* %29 to i8*
  br label %41

31:                                               ; preds = %16, %31
  %32 = phi i32 [ %12, %16 ], [ %38, %31 ]
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = getelementptr inbounds [6 x i32], [6 x i32] addrspace(3)* @_ZZ18histogram_creationPiS_iE10local_hist, i32 0, i32 %35
  %37 = atomicrmw add i32 addrspace(3)* %36, i32 1 syncscope("agent-one-as") monotonic, align 4
  %38 = add i32 %32, %17
  %39 = icmp slt i32 %38, 65
  br i1 %39, label %31, label %23, !llvm.loop !17

40:                                               ; preds = %495, %23
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void

41:                                               ; preds = %24, %495
  %42 = phi i32 [ %11, %24 ], [ %506, %495 ]
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %43
  %45 = getelementptr inbounds [6 x i32], [6 x i32] addrspace(3)* @_ZZ18histogram_creationPiS_iE10local_hist, i32 0, i32 %42
  %46 = load i32, i32 addrspace(3)* %45, align 4, !tbaa !7
  %47 = atomicrmw add i32 addrspace(1)* %44, i32 %46 syncscope("agent-one-as") monotonic, align 4
  %48 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %30, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %49 = extractelement <2 x i64> %48, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), label %50, label %54

50:                                               ; preds = %41
  %51 = and i64 %49, -225
  %52 = or i64 %51, 32
  %53 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %30, i64 noundef %52, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %495

54:                                               ; preds = %41
  %55 = and i64 %49, 2
  %56 = and i64 %49, -3
  %57 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %56, i64 0
  br label %58

58:                                               ; preds = %484, %54
  %59 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str.2, i64 0, i64 23) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([24 x i8]* addrspacecast ([24 x i8] addrspace(4)* @.str.2 to [24 x i8]*) to i64)), i64 1))), %54 ], [ %492, %484 ]
  %60 = phi i8 addrspace(4)* [ getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str.2, i64 0, i64 0), %54 ], [ %493, %484 ]
  %61 = phi <2 x i64> [ %57, %54 ], [ %491, %484 ]
  %62 = icmp ugt i64 %59, 56
  %63 = extractelement <2 x i64> %61, i64 0
  %64 = or i64 %63, %55
  %65 = insertelement <2 x i64> poison, i64 %64, i64 0
  %66 = select i1 %62, <2 x i64> %61, <2 x i64> %65
  %67 = tail call i64 @llvm.umin.i64(i64 %59, i64 56)
  %68 = trunc i64 %67 to i32
  %69 = extractelement <2 x i64> %66, i64 0
  %70 = icmp ugt i32 %68, 7
  br i1 %70, label %73, label %71

71:                                               ; preds = %58
  %72 = icmp eq i32 %68, 0
  br i1 %72, label %126, label %113

73:                                               ; preds = %58
  %74 = load i8, i8 addrspace(4)* %60, align 1, !tbaa !18
  %75 = zext i8 %74 to i64
  %76 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 1
  %77 = load i8, i8 addrspace(4)* %76, align 1, !tbaa !18
  %78 = zext i8 %77 to i64
  %79 = shl nuw nsw i64 %78, 8
  %80 = or i64 %79, %75
  %81 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 2
  %82 = load i8, i8 addrspace(4)* %81, align 1, !tbaa !18
  %83 = zext i8 %82 to i64
  %84 = shl nuw nsw i64 %83, 16
  %85 = or i64 %80, %84
  %86 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 3
  %87 = load i8, i8 addrspace(4)* %86, align 1, !tbaa !18
  %88 = zext i8 %87 to i64
  %89 = shl nuw nsw i64 %88, 24
  %90 = or i64 %85, %89
  %91 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 4
  %92 = load i8, i8 addrspace(4)* %91, align 1, !tbaa !18
  %93 = zext i8 %92 to i64
  %94 = shl nuw nsw i64 %93, 32
  %95 = or i64 %90, %94
  %96 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 5
  %97 = load i8, i8 addrspace(4)* %96, align 1, !tbaa !18
  %98 = zext i8 %97 to i64
  %99 = shl nuw nsw i64 %98, 40
  %100 = or i64 %95, %99
  %101 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 6
  %102 = load i8, i8 addrspace(4)* %101, align 1, !tbaa !18
  %103 = zext i8 %102 to i64
  %104 = shl nuw nsw i64 %103, 48
  %105 = or i64 %100, %104
  %106 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 7
  %107 = load i8, i8 addrspace(4)* %106, align 1, !tbaa !18
  %108 = zext i8 %107 to i64
  %109 = shl nuw i64 %108, 56
  %110 = or i64 %105, %109
  %111 = add nsw i32 %68, -8
  %112 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 8
  br label %126

113:                                              ; preds = %71, %113
  %114 = phi i32 [ %124, %113 ], [ 0, %71 ]
  %115 = phi i64 [ %123, %113 ], [ 0, %71 ]
  %116 = zext i32 %114 to i64
  %117 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 %116
  %118 = load i8, i8 addrspace(4)* %117, align 1, !tbaa !18
  %119 = zext i8 %118 to i64
  %120 = shl i32 %114, 3
  %121 = zext i32 %120 to i64
  %122 = shl nuw i64 %119, %121
  %123 = or i64 %122, %115
  %124 = add nuw nsw i32 %114, 1
  %125 = icmp eq i32 %124, %68
  br i1 %125, label %126, label %113, !llvm.loop !19

126:                                              ; preds = %113, %73, %71
  %127 = phi i8 addrspace(4)* [ %112, %73 ], [ %60, %71 ], [ %60, %113 ]
  %128 = phi i32 [ %111, %73 ], [ 0, %71 ], [ 0, %113 ]
  %129 = phi i64 [ %110, %73 ], [ 0, %71 ], [ %123, %113 ]
  %130 = icmp ugt i32 %128, 7
  br i1 %130, label %133, label %131

131:                                              ; preds = %126
  %132 = icmp eq i32 %128, 0
  br i1 %132, label %186, label %173

133:                                              ; preds = %126
  %134 = load i8, i8 addrspace(4)* %127, align 1, !tbaa !18
  %135 = zext i8 %134 to i64
  %136 = getelementptr inbounds i8, i8 addrspace(4)* %127, i64 1
  %137 = load i8, i8 addrspace(4)* %136, align 1, !tbaa !18
  %138 = zext i8 %137 to i64
  %139 = shl nuw nsw i64 %138, 8
  %140 = or i64 %139, %135
  %141 = getelementptr inbounds i8, i8 addrspace(4)* %127, i64 2
  %142 = load i8, i8 addrspace(4)* %141, align 1, !tbaa !18
  %143 = zext i8 %142 to i64
  %144 = shl nuw nsw i64 %143, 16
  %145 = or i64 %140, %144
  %146 = getelementptr inbounds i8, i8 addrspace(4)* %127, i64 3
  %147 = load i8, i8 addrspace(4)* %146, align 1, !tbaa !18
  %148 = zext i8 %147 to i64
  %149 = shl nuw nsw i64 %148, 24
  %150 = or i64 %145, %149
  %151 = getelementptr inbounds i8, i8 addrspace(4)* %127, i64 4
  %152 = load i8, i8 addrspace(4)* %151, align 1, !tbaa !18
  %153 = zext i8 %152 to i64
  %154 = shl nuw nsw i64 %153, 32
  %155 = or i64 %150, %154
  %156 = getelementptr inbounds i8, i8 addrspace(4)* %127, i64 5
  %157 = load i8, i8 addrspace(4)* %156, align 1, !tbaa !18
  %158 = zext i8 %157 to i64
  %159 = shl nuw nsw i64 %158, 40
  %160 = or i64 %155, %159
  %161 = getelementptr inbounds i8, i8 addrspace(4)* %127, i64 6
  %162 = load i8, i8 addrspace(4)* %161, align 1, !tbaa !18
  %163 = zext i8 %162 to i64
  %164 = shl nuw nsw i64 %163, 48
  %165 = or i64 %160, %164
  %166 = getelementptr inbounds i8, i8 addrspace(4)* %127, i64 7
  %167 = load i8, i8 addrspace(4)* %166, align 1, !tbaa !18
  %168 = zext i8 %167 to i64
  %169 = shl nuw i64 %168, 56
  %170 = or i64 %165, %169
  %171 = add nsw i32 %128, -8
  %172 = getelementptr inbounds i8, i8 addrspace(4)* %127, i64 8
  br label %186

173:                                              ; preds = %131, %173
  %174 = phi i32 [ %184, %173 ], [ 0, %131 ]
  %175 = phi i64 [ %183, %173 ], [ 0, %131 ]
  %176 = zext i32 %174 to i64
  %177 = getelementptr inbounds i8, i8 addrspace(4)* %127, i64 %176
  %178 = load i8, i8 addrspace(4)* %177, align 1, !tbaa !18
  %179 = zext i8 %178 to i64
  %180 = shl i32 %174, 3
  %181 = zext i32 %180 to i64
  %182 = shl nuw i64 %179, %181
  %183 = or i64 %182, %175
  %184 = add nuw nsw i32 %174, 1
  %185 = icmp eq i32 %184, %128
  br i1 %185, label %186, label %173

186:                                              ; preds = %173, %133, %131
  %187 = phi i8 addrspace(4)* [ %172, %133 ], [ %127, %131 ], [ %127, %173 ]
  %188 = phi i32 [ %171, %133 ], [ 0, %131 ], [ 0, %173 ]
  %189 = phi i64 [ %170, %133 ], [ 0, %131 ], [ %183, %173 ]
  %190 = icmp ugt i32 %188, 7
  br i1 %190, label %193, label %191

191:                                              ; preds = %186
  %192 = icmp eq i32 %188, 0
  br i1 %192, label %246, label %233

193:                                              ; preds = %186
  %194 = load i8, i8 addrspace(4)* %187, align 1, !tbaa !18
  %195 = zext i8 %194 to i64
  %196 = getelementptr inbounds i8, i8 addrspace(4)* %187, i64 1
  %197 = load i8, i8 addrspace(4)* %196, align 1, !tbaa !18
  %198 = zext i8 %197 to i64
  %199 = shl nuw nsw i64 %198, 8
  %200 = or i64 %199, %195
  %201 = getelementptr inbounds i8, i8 addrspace(4)* %187, i64 2
  %202 = load i8, i8 addrspace(4)* %201, align 1, !tbaa !18
  %203 = zext i8 %202 to i64
  %204 = shl nuw nsw i64 %203, 16
  %205 = or i64 %200, %204
  %206 = getelementptr inbounds i8, i8 addrspace(4)* %187, i64 3
  %207 = load i8, i8 addrspace(4)* %206, align 1, !tbaa !18
  %208 = zext i8 %207 to i64
  %209 = shl nuw nsw i64 %208, 24
  %210 = or i64 %205, %209
  %211 = getelementptr inbounds i8, i8 addrspace(4)* %187, i64 4
  %212 = load i8, i8 addrspace(4)* %211, align 1, !tbaa !18
  %213 = zext i8 %212 to i64
  %214 = shl nuw nsw i64 %213, 32
  %215 = or i64 %210, %214
  %216 = getelementptr inbounds i8, i8 addrspace(4)* %187, i64 5
  %217 = load i8, i8 addrspace(4)* %216, align 1, !tbaa !18
  %218 = zext i8 %217 to i64
  %219 = shl nuw nsw i64 %218, 40
  %220 = or i64 %215, %219
  %221 = getelementptr inbounds i8, i8 addrspace(4)* %187, i64 6
  %222 = load i8, i8 addrspace(4)* %221, align 1, !tbaa !18
  %223 = zext i8 %222 to i64
  %224 = shl nuw nsw i64 %223, 48
  %225 = or i64 %220, %224
  %226 = getelementptr inbounds i8, i8 addrspace(4)* %187, i64 7
  %227 = load i8, i8 addrspace(4)* %226, align 1, !tbaa !18
  %228 = zext i8 %227 to i64
  %229 = shl nuw i64 %228, 56
  %230 = or i64 %225, %229
  %231 = add nsw i32 %188, -8
  %232 = getelementptr inbounds i8, i8 addrspace(4)* %187, i64 8
  br label %246

233:                                              ; preds = %191, %233
  %234 = phi i32 [ %244, %233 ], [ 0, %191 ]
  %235 = phi i64 [ %243, %233 ], [ 0, %191 ]
  %236 = zext i32 %234 to i64
  %237 = getelementptr inbounds i8, i8 addrspace(4)* %187, i64 %236
  %238 = load i8, i8 addrspace(4)* %237, align 1, !tbaa !18
  %239 = zext i8 %238 to i64
  %240 = shl i32 %234, 3
  %241 = zext i32 %240 to i64
  %242 = shl nuw i64 %239, %241
  %243 = or i64 %242, %235
  %244 = add nuw nsw i32 %234, 1
  %245 = icmp eq i32 %244, %188
  br i1 %245, label %246, label %233

246:                                              ; preds = %233, %193, %191
  %247 = phi i8 addrspace(4)* [ %232, %193 ], [ %187, %191 ], [ %187, %233 ]
  %248 = phi i32 [ %231, %193 ], [ 0, %191 ], [ 0, %233 ]
  %249 = phi i64 [ %230, %193 ], [ 0, %191 ], [ %243, %233 ]
  %250 = icmp ugt i32 %248, 7
  br i1 %250, label %253, label %251

251:                                              ; preds = %246
  %252 = icmp eq i32 %248, 0
  br i1 %252, label %306, label %293

253:                                              ; preds = %246
  %254 = load i8, i8 addrspace(4)* %247, align 1, !tbaa !18
  %255 = zext i8 %254 to i64
  %256 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 1
  %257 = load i8, i8 addrspace(4)* %256, align 1, !tbaa !18
  %258 = zext i8 %257 to i64
  %259 = shl nuw nsw i64 %258, 8
  %260 = or i64 %259, %255
  %261 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 2
  %262 = load i8, i8 addrspace(4)* %261, align 1, !tbaa !18
  %263 = zext i8 %262 to i64
  %264 = shl nuw nsw i64 %263, 16
  %265 = or i64 %260, %264
  %266 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 3
  %267 = load i8, i8 addrspace(4)* %266, align 1, !tbaa !18
  %268 = zext i8 %267 to i64
  %269 = shl nuw nsw i64 %268, 24
  %270 = or i64 %265, %269
  %271 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 4
  %272 = load i8, i8 addrspace(4)* %271, align 1, !tbaa !18
  %273 = zext i8 %272 to i64
  %274 = shl nuw nsw i64 %273, 32
  %275 = or i64 %270, %274
  %276 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 5
  %277 = load i8, i8 addrspace(4)* %276, align 1, !tbaa !18
  %278 = zext i8 %277 to i64
  %279 = shl nuw nsw i64 %278, 40
  %280 = or i64 %275, %279
  %281 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 6
  %282 = load i8, i8 addrspace(4)* %281, align 1, !tbaa !18
  %283 = zext i8 %282 to i64
  %284 = shl nuw nsw i64 %283, 48
  %285 = or i64 %280, %284
  %286 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 7
  %287 = load i8, i8 addrspace(4)* %286, align 1, !tbaa !18
  %288 = zext i8 %287 to i64
  %289 = shl nuw i64 %288, 56
  %290 = or i64 %285, %289
  %291 = add nsw i32 %248, -8
  %292 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 8
  br label %306

293:                                              ; preds = %251, %293
  %294 = phi i32 [ %304, %293 ], [ 0, %251 ]
  %295 = phi i64 [ %303, %293 ], [ 0, %251 ]
  %296 = zext i32 %294 to i64
  %297 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 %296
  %298 = load i8, i8 addrspace(4)* %297, align 1, !tbaa !18
  %299 = zext i8 %298 to i64
  %300 = shl i32 %294, 3
  %301 = zext i32 %300 to i64
  %302 = shl nuw i64 %299, %301
  %303 = or i64 %302, %295
  %304 = add nuw nsw i32 %294, 1
  %305 = icmp eq i32 %304, %248
  br i1 %305, label %306, label %293

306:                                              ; preds = %293, %253, %251
  %307 = phi i8 addrspace(4)* [ %292, %253 ], [ %247, %251 ], [ %247, %293 ]
  %308 = phi i32 [ %291, %253 ], [ 0, %251 ], [ 0, %293 ]
  %309 = phi i64 [ %290, %253 ], [ 0, %251 ], [ %303, %293 ]
  %310 = icmp ugt i32 %308, 7
  br i1 %310, label %313, label %311

311:                                              ; preds = %306
  %312 = icmp eq i32 %308, 0
  br i1 %312, label %366, label %353

313:                                              ; preds = %306
  %314 = load i8, i8 addrspace(4)* %307, align 1, !tbaa !18
  %315 = zext i8 %314 to i64
  %316 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 1
  %317 = load i8, i8 addrspace(4)* %316, align 1, !tbaa !18
  %318 = zext i8 %317 to i64
  %319 = shl nuw nsw i64 %318, 8
  %320 = or i64 %319, %315
  %321 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 2
  %322 = load i8, i8 addrspace(4)* %321, align 1, !tbaa !18
  %323 = zext i8 %322 to i64
  %324 = shl nuw nsw i64 %323, 16
  %325 = or i64 %320, %324
  %326 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 3
  %327 = load i8, i8 addrspace(4)* %326, align 1, !tbaa !18
  %328 = zext i8 %327 to i64
  %329 = shl nuw nsw i64 %328, 24
  %330 = or i64 %325, %329
  %331 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 4
  %332 = load i8, i8 addrspace(4)* %331, align 1, !tbaa !18
  %333 = zext i8 %332 to i64
  %334 = shl nuw nsw i64 %333, 32
  %335 = or i64 %330, %334
  %336 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 5
  %337 = load i8, i8 addrspace(4)* %336, align 1, !tbaa !18
  %338 = zext i8 %337 to i64
  %339 = shl nuw nsw i64 %338, 40
  %340 = or i64 %335, %339
  %341 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 6
  %342 = load i8, i8 addrspace(4)* %341, align 1, !tbaa !18
  %343 = zext i8 %342 to i64
  %344 = shl nuw nsw i64 %343, 48
  %345 = or i64 %340, %344
  %346 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 7
  %347 = load i8, i8 addrspace(4)* %346, align 1, !tbaa !18
  %348 = zext i8 %347 to i64
  %349 = shl nuw i64 %348, 56
  %350 = or i64 %345, %349
  %351 = add nsw i32 %308, -8
  %352 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 8
  br label %366

353:                                              ; preds = %311, %353
  %354 = phi i32 [ %364, %353 ], [ 0, %311 ]
  %355 = phi i64 [ %363, %353 ], [ 0, %311 ]
  %356 = zext i32 %354 to i64
  %357 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 %356
  %358 = load i8, i8 addrspace(4)* %357, align 1, !tbaa !18
  %359 = zext i8 %358 to i64
  %360 = shl i32 %354, 3
  %361 = zext i32 %360 to i64
  %362 = shl nuw i64 %359, %361
  %363 = or i64 %362, %355
  %364 = add nuw nsw i32 %354, 1
  %365 = icmp eq i32 %364, %308
  br i1 %365, label %366, label %353

366:                                              ; preds = %353, %313, %311
  %367 = phi i8 addrspace(4)* [ %352, %313 ], [ %307, %311 ], [ %307, %353 ]
  %368 = phi i32 [ %351, %313 ], [ 0, %311 ], [ 0, %353 ]
  %369 = phi i64 [ %350, %313 ], [ 0, %311 ], [ %363, %353 ]
  %370 = icmp ugt i32 %368, 7
  br i1 %370, label %373, label %371

371:                                              ; preds = %366
  %372 = icmp eq i32 %368, 0
  br i1 %372, label %426, label %413

373:                                              ; preds = %366
  %374 = load i8, i8 addrspace(4)* %367, align 1, !tbaa !18
  %375 = zext i8 %374 to i64
  %376 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 1
  %377 = load i8, i8 addrspace(4)* %376, align 1, !tbaa !18
  %378 = zext i8 %377 to i64
  %379 = shl nuw nsw i64 %378, 8
  %380 = or i64 %379, %375
  %381 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 2
  %382 = load i8, i8 addrspace(4)* %381, align 1, !tbaa !18
  %383 = zext i8 %382 to i64
  %384 = shl nuw nsw i64 %383, 16
  %385 = or i64 %380, %384
  %386 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 3
  %387 = load i8, i8 addrspace(4)* %386, align 1, !tbaa !18
  %388 = zext i8 %387 to i64
  %389 = shl nuw nsw i64 %388, 24
  %390 = or i64 %385, %389
  %391 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 4
  %392 = load i8, i8 addrspace(4)* %391, align 1, !tbaa !18
  %393 = zext i8 %392 to i64
  %394 = shl nuw nsw i64 %393, 32
  %395 = or i64 %390, %394
  %396 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 5
  %397 = load i8, i8 addrspace(4)* %396, align 1, !tbaa !18
  %398 = zext i8 %397 to i64
  %399 = shl nuw nsw i64 %398, 40
  %400 = or i64 %395, %399
  %401 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 6
  %402 = load i8, i8 addrspace(4)* %401, align 1, !tbaa !18
  %403 = zext i8 %402 to i64
  %404 = shl nuw nsw i64 %403, 48
  %405 = or i64 %400, %404
  %406 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 7
  %407 = load i8, i8 addrspace(4)* %406, align 1, !tbaa !18
  %408 = zext i8 %407 to i64
  %409 = shl nuw i64 %408, 56
  %410 = or i64 %405, %409
  %411 = add nsw i32 %368, -8
  %412 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 8
  br label %426

413:                                              ; preds = %371, %413
  %414 = phi i32 [ %424, %413 ], [ 0, %371 ]
  %415 = phi i64 [ %423, %413 ], [ 0, %371 ]
  %416 = zext i32 %414 to i64
  %417 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 %416
  %418 = load i8, i8 addrspace(4)* %417, align 1, !tbaa !18
  %419 = zext i8 %418 to i64
  %420 = shl i32 %414, 3
  %421 = zext i32 %420 to i64
  %422 = shl nuw i64 %419, %421
  %423 = or i64 %422, %415
  %424 = add nuw nsw i32 %414, 1
  %425 = icmp eq i32 %424, %368
  br i1 %425, label %426, label %413

426:                                              ; preds = %413, %373, %371
  %427 = phi i8 addrspace(4)* [ %412, %373 ], [ %367, %371 ], [ %367, %413 ]
  %428 = phi i32 [ %411, %373 ], [ 0, %371 ], [ 0, %413 ]
  %429 = phi i64 [ %410, %373 ], [ 0, %371 ], [ %423, %413 ]
  %430 = icmp ugt i32 %428, 7
  br i1 %430, label %433, label %431

431:                                              ; preds = %426
  %432 = icmp eq i32 %428, 0
  br i1 %432, label %484, label %471

433:                                              ; preds = %426
  %434 = load i8, i8 addrspace(4)* %427, align 1, !tbaa !18
  %435 = zext i8 %434 to i64
  %436 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 1
  %437 = load i8, i8 addrspace(4)* %436, align 1, !tbaa !18
  %438 = zext i8 %437 to i64
  %439 = shl nuw nsw i64 %438, 8
  %440 = or i64 %439, %435
  %441 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 2
  %442 = load i8, i8 addrspace(4)* %441, align 1, !tbaa !18
  %443 = zext i8 %442 to i64
  %444 = shl nuw nsw i64 %443, 16
  %445 = or i64 %440, %444
  %446 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 3
  %447 = load i8, i8 addrspace(4)* %446, align 1, !tbaa !18
  %448 = zext i8 %447 to i64
  %449 = shl nuw nsw i64 %448, 24
  %450 = or i64 %445, %449
  %451 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 4
  %452 = load i8, i8 addrspace(4)* %451, align 1, !tbaa !18
  %453 = zext i8 %452 to i64
  %454 = shl nuw nsw i64 %453, 32
  %455 = or i64 %450, %454
  %456 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 5
  %457 = load i8, i8 addrspace(4)* %456, align 1, !tbaa !18
  %458 = zext i8 %457 to i64
  %459 = shl nuw nsw i64 %458, 40
  %460 = or i64 %455, %459
  %461 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 6
  %462 = load i8, i8 addrspace(4)* %461, align 1, !tbaa !18
  %463 = zext i8 %462 to i64
  %464 = shl nuw nsw i64 %463, 48
  %465 = or i64 %460, %464
  %466 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 7
  %467 = load i8, i8 addrspace(4)* %466, align 1, !tbaa !18
  %468 = zext i8 %467 to i64
  %469 = shl nuw i64 %468, 56
  %470 = or i64 %465, %469
  br label %484

471:                                              ; preds = %431, %471
  %472 = phi i32 [ %482, %471 ], [ 0, %431 ]
  %473 = phi i64 [ %481, %471 ], [ 0, %431 ]
  %474 = zext i32 %472 to i64
  %475 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 %474
  %476 = load i8, i8 addrspace(4)* %475, align 1, !tbaa !18
  %477 = zext i8 %476 to i64
  %478 = shl i32 %472, 3
  %479 = zext i32 %478 to i64
  %480 = shl nuw i64 %477, %479
  %481 = or i64 %480, %473
  %482 = add nuw nsw i32 %472, 1
  %483 = icmp eq i32 %482, %428
  br i1 %483, label %484, label %471

484:                                              ; preds = %471, %433, %431
  %485 = phi i64 [ %470, %433 ], [ 0, %431 ], [ %481, %471 ]
  %486 = shl nuw nsw i64 %67, 2
  %487 = add nuw nsw i64 %486, 28
  %488 = and i64 %487, 480
  %489 = and i64 %69, -225
  %490 = or i64 %489, %488
  %491 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %30, i64 noundef %490, i64 noundef %129, i64 noundef %189, i64 noundef %249, i64 noundef %309, i64 noundef %369, i64 noundef %429, i64 noundef %485) #11
  %492 = sub i64 %59, %67
  %493 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 %67
  %494 = icmp eq i64 %492, 0
  br i1 %494, label %495, label %58

495:                                              ; preds = %484, %50
  %496 = phi <2 x i64> [ %53, %50 ], [ %491, %484 ]
  %497 = extractelement <2 x i64> %496, i64 0
  %498 = zext i32 %46 to i64
  %499 = and i64 %497, -225
  %500 = or i64 %499, 32
  %501 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %30, i64 noundef %500, i64 noundef %498, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %502 = extractelement <2 x i64> %501, i64 0
  %503 = and i64 %502, -227
  %504 = or i64 %503, 34
  %505 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %30, i64 noundef %504, i64 noundef %43, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %506 = add nuw nsw i32 %42, %8
  %507 = icmp ult i32 %506, 6
  br i1 %507, label %41, label %40, !llvm.loop !21
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #3

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) unnamed_addr #4 {
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
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !24
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !13
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !13
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !13
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !13
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !13
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !13
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !13
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !13
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #7
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !24
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #11, !srcloc !26
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !24
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #7
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !24
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #7
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !22
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #7
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !24
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !27
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !30
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !27
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !30
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !13
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #7
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !27
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !30
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !22
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #7
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !31
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !30
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !22
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !22
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !22
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !24
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !13
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !13
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !13
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !13
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !13
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !13
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !13
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !13
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !24
  %110 = call i64 @llvm.read_register.i64(metadata !32) #12
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !33
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !35
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !36
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !13
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !13
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !13
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !13
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !13
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !13
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !13
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !13
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !24
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !27
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !30
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !37
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !37
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !38
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !40
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #7
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !22
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !22
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !24
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !13
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !13
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !18
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !24
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !30
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !27
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !37
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !37
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !18
  %215 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %215) #7
  %216 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %216) #7
  %217 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %217) #7
  %218 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %218) #7
  %219 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %219) #7
  %220 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %220) #7
  %221 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %221) #7
  ret <2 x i64> %214
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #5

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #6

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #7

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #8

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #9

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #9

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #10

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #5 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #6 = { mustprogress nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { nofree nounwind readonly }
attributes #9 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #10 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #11 = { convergent nounwind }
attributes #12 = { convergent }

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!14, !14, i64 0}
!14 = !{!"long", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = distinct !{!17, !12}
!18 = !{!15, !15, i64 0}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !12}
!22 = !{!23, !23, i64 0}
!23 = !{!"any pointer", !15, i64 0}
!24 = !{!25, !25, i64 0}
!25 = !{!"int", !15, i64 0}
!26 = !{i64 2662}
!27 = !{!28, !23, i64 0}
!28 = !{!"", !23, i64 0, !23, i64 8, !29, i64 16, !14, i64 24, !14, i64 32, !14, i64 40}
!29 = !{!"hsa_signal_s", !14, i64 0}
!30 = !{!28, !14, i64 40}
!31 = !{!28, !23, i64 8}
!32 = !{!"exec"}
!33 = !{!34, !25, i64 16}
!34 = !{!"", !14, i64 0, !14, i64 8, !25, i64 16, !25, i64 20}
!35 = !{!34, !14, i64 8}
!36 = !{!34, !25, i64 20}
!37 = !{!34, !14, i64 0}
!38 = !{!39, !14, i64 16}
!39 = !{!"amd_signal_s", !14, i64 0, !15, i64 8, !14, i64 16, !25, i64 24, !25, i64 28, !14, i64 32, !14, i64 40, !15, i64 48, !15, i64 56}
!40 = !{!39, !25, i64 24}
