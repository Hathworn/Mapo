; ModuleID = '../data/hip_kernels/9551/0/main.cu'
source_filename = "../data/hip_kernels/9551/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14convert_to_hsvPhPfiiii(i8 addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = mul nsw i32 %7, %4
  %10 = mul nsw i32 %8, %5
  %11 = add nsw i32 %10, %9
  %12 = add nsw i32 %11, 2
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %13
  %15 = load i8, i8 addrspace(1)* %14, align 1, !tbaa !5, !amdgpu.noclobber !8
  %16 = uitofp i8 %15 to float
  %17 = fdiv contract float %16, 2.550000e+02
  %18 = add nsw i32 %11, 1
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %19
  %21 = load i8, i8 addrspace(1)* %20, align 1, !tbaa !5, !amdgpu.noclobber !8
  %22 = uitofp i8 %21 to float
  %23 = fdiv contract float %22, 2.550000e+02
  %24 = sext i32 %11 to i64
  %25 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %24
  %26 = load i8, i8 addrspace(1)* %25, align 1, !tbaa !5, !amdgpu.noclobber !8
  %27 = uitofp i8 %26 to float
  %28 = fdiv contract float %27, 2.550000e+02
  %29 = tail call float @llvm.maxnum.f32(float %23, float %28)
  %30 = tail call float @llvm.maxnum.f32(float %17, float %29)
  %31 = tail call float @llvm.minnum.f32(float %23, float %28)
  %32 = tail call float @llvm.minnum.f32(float %17, float %31)
  %33 = fsub contract float %30, %32
  %34 = fcmp contract oeq float %30, 0.000000e+00
  br i1 %34, label %59, label %35

35:                                               ; preds = %6
  %36 = fdiv contract float %33, %30
  %37 = fcmp contract olt float %33, 0x3F50624DE0000000
  br i1 %37, label %59, label %38

38:                                               ; preds = %35
  %39 = fcmp contract oeq float %30, %17
  br i1 %39, label %40, label %47

40:                                               ; preds = %38
  %41 = fsub contract float %23, %28
  %42 = fmul contract float %41, 6.000000e+01
  %43 = fdiv contract float %42, %33
  %44 = fcmp contract olt float %43, 0.000000e+00
  %45 = fadd contract float %43, 3.600000e+02
  %46 = select i1 %44, float %45, float %43
  br label %59

47:                                               ; preds = %38
  %48 = fcmp contract oeq float %30, %23
  br i1 %48, label %49, label %54

49:                                               ; preds = %47
  %50 = fsub contract float %28, %17
  %51 = fdiv contract float %50, %33
  %52 = fadd contract float %51, 2.000000e+00
  %53 = fmul contract float %52, 6.000000e+01
  br label %59

54:                                               ; preds = %47
  %55 = fsub contract float %17, %23
  %56 = fdiv contract float %55, %33
  %57 = fadd contract float %56, 4.000000e+00
  %58 = fmul contract float %57, 6.000000e+01
  br label %59

59:                                               ; preds = %40, %35, %6, %49, %54
  %60 = phi float [ %36, %49 ], [ %36, %54 ], [ 0.000000e+00, %6 ], [ %36, %35 ], [ %36, %40 ]
  %61 = phi float [ %53, %49 ], [ %58, %54 ], [ 0.000000e+00, %6 ], [ 0.000000e+00, %35 ], [ %46, %40 ]
  %62 = fcmp contract ogt float %61, 4.000000e+01
  %63 = fcmp contract olt float %61, 2.000000e+02
  %64 = and i1 %62, %63
  %65 = fcmp contract ogt float %60, 0.000000e+00
  %66 = select i1 %64, i1 %65, i1 false
  %67 = fcmp contract olt float %60, 1.000000e+02
  %68 = select i1 %66, i1 %67, i1 false
  %69 = fcmp contract ogt float %30, 0.000000e+00
  %70 = select i1 %68, i1 %69, i1 false
  %71 = fcmp contract olt float %30, 1.000000e+02
  %72 = select i1 %70, i1 %71, i1 false
  %73 = fadd contract float %61, 1.400000e+02
  %74 = select i1 %72, float %73, float %61
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %74, float addrspace(1)* %75, align 4
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 %19
  store float %60, float addrspace(1)* %76, align 4
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  store float %30, float addrspace(1)* %77, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

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
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
