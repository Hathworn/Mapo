; ModuleID = '../data/hip_kernels/54/0/main.cu'
source_filename = "../data/hip_kernels/54/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16computeMI_KernelPfPhiiPii(float addrspace(1)* nocapture %0, i8 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, i32 %5) local_unnamed_addr #1 {
  %7 = alloca [2 x [2 x i32]], align 16, addrspace(5)
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = add i32 %8, %5
  %17 = add i32 %16, %15
  %18 = add nsw i32 %2, -1
  %19 = mul nsw i32 %18, %2
  %20 = sdiv i32 %19, 2
  %21 = icmp sgt i32 %17, %20
  br i1 %21, label %252, label %22

22:                                               ; preds = %6
  %23 = bitcast [2 x [2 x i32]] addrspace(5)* %7 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %23) #5
  call void @llvm.memset.p5i8.i64(i8 addrspace(5)* noundef align 16 dereferenceable(16) %23, i8 0, i64 16, i1 false)
  %24 = sext i32 %17 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %0, i64 %24
  %26 = icmp slt i32 %2, 3
  %27 = icmp slt i32 %17, %18
  %28 = select i1 %26, i1 true, i1 %27
  br i1 %28, label %43, label %29

29:                                               ; preds = %22, %29
  %30 = phi i32 [ %37, %29 ], [ %18, %22 ]
  %31 = phi i32 [ %35, %29 ], [ 0, %22 ]
  %32 = phi i32 [ %34, %29 ], [ 1, %22 ]
  %33 = phi i32 [ %36, %29 ], [ %17, %22 ]
  %34 = add nuw nsw i32 %32, 1
  %35 = add nuw nsw i32 %31, 1
  %36 = sub nsw i32 %33, %30
  %37 = add nsw i32 %30, -1
  %38 = icmp ult i32 %30, 3
  %39 = icmp slt i32 %36, %37
  %40 = select i1 %38, i1 true, i1 %39
  br i1 %40, label %41, label %29, !llvm.loop !7

41:                                               ; preds = %29
  %42 = zext i32 %35 to i64
  br label %43

43:                                               ; preds = %41, %22
  %44 = phi i32 [ %17, %22 ], [ %36, %41 ]
  %45 = phi i32 [ 1, %22 ], [ %34, %41 ]
  %46 = phi i64 [ 0, %22 ], [ %42, %41 ]
  %47 = add nsw i32 %45, %44
  store float 0.000000e+00, float addrspace(1)* %25, align 4, !tbaa !9
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !13, !amdgpu.noclobber !6
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %46
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !13, !amdgpu.noclobber !6
  %53 = icmp sgt i32 %3, 0
  br i1 %53, label %54, label %84

54:                                               ; preds = %43
  %55 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %46
  %56 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %48
  %57 = sext i32 %2 to i64
  %58 = and i32 %3, 7
  %59 = icmp ult i32 %3, 8
  br i1 %59, label %62, label %60

60:                                               ; preds = %54
  %61 = and i32 %3, -8
  br label %90

62:                                               ; preds = %90, %54
  %63 = phi i8 addrspace(1)* [ %55, %54 ], [ %165, %90 ]
  %64 = phi i8 addrspace(1)* [ %56, %54 ], [ %164, %90 ]
  %65 = icmp eq i32 %58, 0
  br i1 %65, label %81, label %66

66:                                               ; preds = %62, %66
  %67 = phi i8 addrspace(1)* [ %78, %66 ], [ %63, %62 ]
  %68 = phi i8 addrspace(1)* [ %77, %66 ], [ %64, %62 ]
  %69 = phi i32 [ %79, %66 ], [ 0, %62 ]
  %70 = load i8, i8 addrspace(1)* %68, align 1, !tbaa !15
  %71 = zext i8 %70 to i32
  %72 = load i8, i8 addrspace(1)* %67, align 1, !tbaa !15
  %73 = zext i8 %72 to i32
  %74 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]] addrspace(5)* %7, i32 0, i32 %71, i32 %73
  %75 = load i32, i32 addrspace(5)* %74, align 4, !tbaa !13
  %76 = add nsw i32 %75, 1
  store i32 %76, i32 addrspace(5)* %74, align 4, !tbaa !13
  %77 = getelementptr inbounds i8, i8 addrspace(1)* %68, i64 %57
  %78 = getelementptr inbounds i8, i8 addrspace(1)* %67, i64 %57
  %79 = add i32 %69, 1
  %80 = icmp eq i32 %79, %58
  br i1 %80, label %81, label %66, !llvm.loop !16

81:                                               ; preds = %66, %62
  %82 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]] addrspace(5)* %7, i32 0, i32 0, i32 0
  %83 = load i32, i32 addrspace(5)* %82, align 16, !tbaa !13
  br label %84

84:                                               ; preds = %81, %43
  %85 = phi i32 [ %83, %81 ], [ 0, %43 ]
  %86 = sitofp i32 %3 to float
  %87 = sub nsw i32 %3, %50
  %88 = sub nsw i32 %3, %52
  %89 = icmp eq i32 %85, 0
  br i1 %89, label %185, label %168

90:                                               ; preds = %90, %60
  %91 = phi i8 addrspace(1)* [ %55, %60 ], [ %165, %90 ]
  %92 = phi i8 addrspace(1)* [ %56, %60 ], [ %164, %90 ]
  %93 = phi i32 [ 0, %60 ], [ %166, %90 ]
  %94 = load i8, i8 addrspace(1)* %92, align 1, !tbaa !15
  %95 = zext i8 %94 to i32
  %96 = load i8, i8 addrspace(1)* %91, align 1, !tbaa !15
  %97 = zext i8 %96 to i32
  %98 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]] addrspace(5)* %7, i32 0, i32 %95, i32 %97
  %99 = load i32, i32 addrspace(5)* %98, align 4, !tbaa !13
  %100 = add nsw i32 %99, 1
  store i32 %100, i32 addrspace(5)* %98, align 4, !tbaa !13
  %101 = getelementptr inbounds i8, i8 addrspace(1)* %92, i64 %57
  %102 = getelementptr inbounds i8, i8 addrspace(1)* %91, i64 %57
  %103 = load i8, i8 addrspace(1)* %101, align 1, !tbaa !15
  %104 = zext i8 %103 to i32
  %105 = load i8, i8 addrspace(1)* %102, align 1, !tbaa !15
  %106 = zext i8 %105 to i32
  %107 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]] addrspace(5)* %7, i32 0, i32 %104, i32 %106
  %108 = load i32, i32 addrspace(5)* %107, align 4, !tbaa !13
  %109 = add nsw i32 %108, 1
  store i32 %109, i32 addrspace(5)* %107, align 4, !tbaa !13
  %110 = getelementptr inbounds i8, i8 addrspace(1)* %101, i64 %57
  %111 = getelementptr inbounds i8, i8 addrspace(1)* %102, i64 %57
  %112 = load i8, i8 addrspace(1)* %110, align 1, !tbaa !15
  %113 = zext i8 %112 to i32
  %114 = load i8, i8 addrspace(1)* %111, align 1, !tbaa !15
  %115 = zext i8 %114 to i32
  %116 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]] addrspace(5)* %7, i32 0, i32 %113, i32 %115
  %117 = load i32, i32 addrspace(5)* %116, align 4, !tbaa !13
  %118 = add nsw i32 %117, 1
  store i32 %118, i32 addrspace(5)* %116, align 4, !tbaa !13
  %119 = getelementptr inbounds i8, i8 addrspace(1)* %110, i64 %57
  %120 = getelementptr inbounds i8, i8 addrspace(1)* %111, i64 %57
  %121 = load i8, i8 addrspace(1)* %119, align 1, !tbaa !15
  %122 = zext i8 %121 to i32
  %123 = load i8, i8 addrspace(1)* %120, align 1, !tbaa !15
  %124 = zext i8 %123 to i32
  %125 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]] addrspace(5)* %7, i32 0, i32 %122, i32 %124
  %126 = load i32, i32 addrspace(5)* %125, align 4, !tbaa !13
  %127 = add nsw i32 %126, 1
  store i32 %127, i32 addrspace(5)* %125, align 4, !tbaa !13
  %128 = getelementptr inbounds i8, i8 addrspace(1)* %119, i64 %57
  %129 = getelementptr inbounds i8, i8 addrspace(1)* %120, i64 %57
  %130 = load i8, i8 addrspace(1)* %128, align 1, !tbaa !15
  %131 = zext i8 %130 to i32
  %132 = load i8, i8 addrspace(1)* %129, align 1, !tbaa !15
  %133 = zext i8 %132 to i32
  %134 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]] addrspace(5)* %7, i32 0, i32 %131, i32 %133
  %135 = load i32, i32 addrspace(5)* %134, align 4, !tbaa !13
  %136 = add nsw i32 %135, 1
  store i32 %136, i32 addrspace(5)* %134, align 4, !tbaa !13
  %137 = getelementptr inbounds i8, i8 addrspace(1)* %128, i64 %57
  %138 = getelementptr inbounds i8, i8 addrspace(1)* %129, i64 %57
  %139 = load i8, i8 addrspace(1)* %137, align 1, !tbaa !15
  %140 = zext i8 %139 to i32
  %141 = load i8, i8 addrspace(1)* %138, align 1, !tbaa !15
  %142 = zext i8 %141 to i32
  %143 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]] addrspace(5)* %7, i32 0, i32 %140, i32 %142
  %144 = load i32, i32 addrspace(5)* %143, align 4, !tbaa !13
  %145 = add nsw i32 %144, 1
  store i32 %145, i32 addrspace(5)* %143, align 4, !tbaa !13
  %146 = getelementptr inbounds i8, i8 addrspace(1)* %137, i64 %57
  %147 = getelementptr inbounds i8, i8 addrspace(1)* %138, i64 %57
  %148 = load i8, i8 addrspace(1)* %146, align 1, !tbaa !15
  %149 = zext i8 %148 to i32
  %150 = load i8, i8 addrspace(1)* %147, align 1, !tbaa !15
  %151 = zext i8 %150 to i32
  %152 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]] addrspace(5)* %7, i32 0, i32 %149, i32 %151
  %153 = load i32, i32 addrspace(5)* %152, align 4, !tbaa !13
  %154 = add nsw i32 %153, 1
  store i32 %154, i32 addrspace(5)* %152, align 4, !tbaa !13
  %155 = getelementptr inbounds i8, i8 addrspace(1)* %146, i64 %57
  %156 = getelementptr inbounds i8, i8 addrspace(1)* %147, i64 %57
  %157 = load i8, i8 addrspace(1)* %155, align 1, !tbaa !15
  %158 = zext i8 %157 to i32
  %159 = load i8, i8 addrspace(1)* %156, align 1, !tbaa !15
  %160 = zext i8 %159 to i32
  %161 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]] addrspace(5)* %7, i32 0, i32 %158, i32 %160
  %162 = load i32, i32 addrspace(5)* %161, align 4, !tbaa !13
  %163 = add nsw i32 %162, 1
  store i32 %163, i32 addrspace(5)* %161, align 4, !tbaa !13
  %164 = getelementptr inbounds i8, i8 addrspace(1)* %155, i64 %57
  %165 = getelementptr inbounds i8, i8 addrspace(1)* %156, i64 %57
  %166 = add i32 %93, 8
  %167 = icmp eq i32 %166, %61
  br i1 %167, label %62, label %90, !llvm.loop !18

168:                                              ; preds = %84
  %169 = sitofp i32 %85 to float
  %170 = fdiv contract float %169, %86
  %171 = sitofp i32 %87 to float
  %172 = fdiv contract float %171, %86
  %173 = fdiv contract float %170, %172
  %174 = sitofp i32 %88 to float
  %175 = fdiv contract float %174, %86
  %176 = fdiv contract float %173, %175
  %177 = tail call i1 @llvm.amdgcn.class.f32(float %176, i32 144)
  %178 = select i1 %177, float 0x41F0000000000000, float 1.000000e+00
  %179 = fmul float %176, %178
  %180 = tail call float @llvm.log2.f32(float %179)
  %181 = select i1 %177, float 3.200000e+01, float 0.000000e+00
  %182 = fsub float %180, %181
  %183 = fmul contract float %170, %182
  %184 = fadd contract float %183, 0.000000e+00
  store float %184, float addrspace(1)* %25, align 4, !tbaa !9
  br label %185

185:                                              ; preds = %84, %168
  %186 = phi float [ 0.000000e+00, %84 ], [ %184, %168 ]
  %187 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]] addrspace(5)* %7, i32 0, i32 1, i32 0
  %188 = load i32, i32 addrspace(5)* %187, align 8, !tbaa !13
  %189 = icmp eq i32 %188, 0
  br i1 %189, label %207, label %190

190:                                              ; preds = %185
  %191 = sitofp i32 %188 to float
  %192 = fdiv contract float %191, %86
  %193 = sitofp i32 %50 to float
  %194 = fdiv contract float %193, %86
  %195 = fdiv contract float %192, %194
  %196 = sitofp i32 %88 to float
  %197 = fdiv contract float %196, %86
  %198 = fdiv contract float %195, %197
  %199 = tail call i1 @llvm.amdgcn.class.f32(float %198, i32 144)
  %200 = select i1 %199, float 0x41F0000000000000, float 1.000000e+00
  %201 = fmul float %198, %200
  %202 = tail call float @llvm.log2.f32(float %201)
  %203 = select i1 %199, float 3.200000e+01, float 0.000000e+00
  %204 = fsub float %202, %203
  %205 = fmul contract float %192, %204
  %206 = fadd contract float %205, %186
  store float %206, float addrspace(1)* %25, align 4, !tbaa !9
  br label %207

207:                                              ; preds = %190, %185
  %208 = phi float [ %206, %190 ], [ %186, %185 ]
  %209 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]] addrspace(5)* %7, i32 0, i32 0, i32 1
  %210 = load i32, i32 addrspace(5)* %209, align 4, !tbaa !13
  %211 = icmp eq i32 %210, 0
  br i1 %211, label %229, label %212

212:                                              ; preds = %207
  %213 = sitofp i32 %210 to float
  %214 = fdiv contract float %213, %86
  %215 = sitofp i32 %87 to float
  %216 = fdiv contract float %215, %86
  %217 = fdiv contract float %214, %216
  %218 = sitofp i32 %52 to float
  %219 = fdiv contract float %218, %86
  %220 = fdiv contract float %217, %219
  %221 = tail call i1 @llvm.amdgcn.class.f32(float %220, i32 144)
  %222 = select i1 %221, float 0x41F0000000000000, float 1.000000e+00
  %223 = fmul float %220, %222
  %224 = tail call float @llvm.log2.f32(float %223)
  %225 = select i1 %221, float 3.200000e+01, float 0.000000e+00
  %226 = fsub float %224, %225
  %227 = fmul contract float %214, %226
  %228 = fadd contract float %227, %208
  store float %228, float addrspace(1)* %25, align 4, !tbaa !9
  br label %229

229:                                              ; preds = %212, %207
  %230 = phi float [ %228, %212 ], [ %208, %207 ]
  %231 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]] addrspace(5)* %7, i32 0, i32 1, i32 1
  %232 = load i32, i32 addrspace(5)* %231, align 4, !tbaa !13
  %233 = icmp eq i32 %232, 0
  br i1 %233, label %251, label %234

234:                                              ; preds = %229
  %235 = sitofp i32 %232 to float
  %236 = fdiv contract float %235, %86
  %237 = sitofp i32 %50 to float
  %238 = fdiv contract float %237, %86
  %239 = fdiv contract float %236, %238
  %240 = sitofp i32 %52 to float
  %241 = fdiv contract float %240, %86
  %242 = fdiv contract float %239, %241
  %243 = tail call i1 @llvm.amdgcn.class.f32(float %242, i32 144)
  %244 = select i1 %243, float 0x41F0000000000000, float 1.000000e+00
  %245 = fmul float %242, %244
  %246 = tail call float @llvm.log2.f32(float %245)
  %247 = select i1 %243, float 3.200000e+01, float 0.000000e+00
  %248 = fsub float %246, %247
  %249 = fmul contract float %236, %248
  %250 = fadd contract float %249, %230
  store float %250, float addrspace(1)* %25, align 4, !tbaa !9
  br label %251

251:                                              ; preds = %234, %229
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %23) #5
  br label %252

252:                                              ; preds = %6, %251
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p5i8.i64(i8 addrspace(5)* nocapture writeonly, i8, i64, i1 immarg) #4

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { argmemonly nocallback nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !11, i64 0}
!15 = !{!11, !11, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
!18 = distinct !{!18, !8}
