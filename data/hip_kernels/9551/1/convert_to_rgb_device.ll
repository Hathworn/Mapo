; ModuleID = '../data/hip_kernels/9551/1/main.cu'
source_filename = "../data/hip_kernels/9551/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14convert_to_rgbPfPhiiii(float addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = mul nsw i32 %7, %4
  %10 = mul nsw i32 %8, %5
  %11 = add nsw i32 %10, %9
  %12 = add nsw i32 %11, 2
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %0, i64 %13
  %15 = load float, float addrspace(1)* %14, align 4, !tbaa !5, !amdgpu.noclobber !9
  %16 = add nsw i32 %11, 1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !5, !amdgpu.noclobber !9
  %20 = sext i32 %11 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !5, !amdgpu.noclobber !9
  %23 = fdiv contract float %15, 6.000000e+01
  %24 = tail call float @llvm.floor.f32(float %23)
  %25 = fsub contract float %23, %24
  %26 = fsub contract float 1.000000e+00, %19
  %27 = fmul contract float %22, %26
  %28 = fmul contract float %19, %25
  %29 = fsub contract float 1.000000e+00, %28
  %30 = fmul contract float %22, %29
  %31 = fsub contract float 1.000000e+00, %25
  %32 = fmul contract float %19, %31
  %33 = fsub contract float 1.000000e+00, %32
  %34 = fmul contract float %22, %33
  %35 = fcmp contract oeq float %24, 0.000000e+00
  %36 = fcmp contract oeq float %24, 6.000000e+00
  %37 = or i1 %35, %36
  br i1 %37, label %50, label %38

38:                                               ; preds = %6
  %39 = fcmp contract oeq float %24, 1.000000e+00
  br i1 %39, label %50, label %40

40:                                               ; preds = %38
  %41 = fcmp contract oeq float %24, 2.000000e+00
  br i1 %41, label %50, label %42

42:                                               ; preds = %40
  %43 = fcmp contract oeq float %24, 3.000000e+00
  %44 = fcmp contract oeq float %24, 4.000000e+00
  %45 = select i1 %44, float %34, float %22
  %46 = or i1 %43, %44
  %47 = select i1 %46, float %22, float %30
  %48 = select i1 %43, float %30, float %27
  %49 = select i1 %43, float %27, float %45
  br label %50

50:                                               ; preds = %42, %40, %38, %6
  %51 = phi float [ %27, %6 ], [ %27, %38 ], [ %34, %40 ], [ %47, %42 ]
  %52 = phi float [ %34, %6 ], [ %22, %38 ], [ %22, %40 ], [ %48, %42 ]
  %53 = phi float [ %22, %6 ], [ %30, %38 ], [ %27, %40 ], [ %49, %42 ]
  %54 = fmul contract float %53, 2.550000e+02
  %55 = tail call float @llvm.rint.f32(float %54)
  %56 = fptoui float %55 to i32
  %57 = trunc i32 %56 to i8
  %58 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %13
  store i8 %57, i8 addrspace(1)* %58, align 1, !tbaa !10
  %59 = fmul contract float %52, 2.550000e+02
  %60 = tail call float @llvm.rint.f32(float %59)
  %61 = fptoui float %60 to i32
  %62 = trunc i32 %61 to i8
  %63 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %17
  store i8 %62, i8 addrspace(1)* %63, align 1, !tbaa !10
  %64 = fmul contract float %51, 2.550000e+02
  %65 = tail call float @llvm.rint.f32(float %64)
  %66 = fptoui float %65 to i32
  %67 = trunc i32 %66 to i8
  %68 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %20
  store i8 %67, i8 addrspace(1)* %68, align 1, !tbaa !10
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!7, !7, i64 0}
