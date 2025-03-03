; ModuleID = '../data/hip_kernels/9142/2/main.cu'
source_filename = "../data/hip_kernels/9142/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14rgb2hsl_kerneliPhS_S_PfS0_S_(i32 %0, i8 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture readonly %2, i8 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4, float addrspace(1)* nocapture writeonly %5, i8 addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = mul i32 %14, %13
  %16 = add i32 %15, %8
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %17
  %19 = load i8, i8 addrspace(1)* %18, align 1, !tbaa !7, !amdgpu.noclobber !6
  %20 = uitofp i8 %19 to float
  %21 = fdiv contract float %20, 2.550000e+02
  %22 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %17
  %23 = load i8, i8 addrspace(1)* %22, align 1, !tbaa !7, !amdgpu.noclobber !6
  %24 = uitofp i8 %23 to float
  %25 = fdiv contract float %24, 2.550000e+02
  %26 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %17
  %27 = load i8, i8 addrspace(1)* %26, align 1, !tbaa !7, !amdgpu.noclobber !6
  %28 = uitofp i8 %27 to float
  %29 = fdiv contract float %28, 2.550000e+02
  %30 = fcmp contract olt float %21, %25
  %31 = select contract i1 %30, float %21, float %25
  %32 = fcmp contract olt float %31, %29
  %33 = select contract i1 %32, float %31, float %29
  %34 = fcmp contract ogt float %21, %25
  %35 = select contract i1 %34, float %21, float %25
  %36 = fcmp contract ogt float %35, %29
  %37 = select contract i1 %36, float %35, float %29
  %38 = fsub contract float %37, %33
  %39 = fadd contract float %37, %33
  %40 = fmul contract float %39, 5.000000e-01
  %41 = fcmp contract oeq float %38, 0.000000e+00
  br i1 %41, label %78, label %42

42:                                               ; preds = %7
  %43 = fcmp contract olt float %40, 5.000000e-01
  %44 = fsub contract float 2.000000e+00, %37
  %45 = fsub contract float %44, %33
  %46 = select i1 %43, float %39, float %45
  %47 = fdiv contract float %38, %46
  %48 = fsub contract float %37, %21
  %49 = fdiv contract float %48, 6.000000e+00
  %50 = fmul contract float %38, 5.000000e-01
  %51 = fadd contract float %49, %50
  %52 = fdiv contract float %51, %38
  %53 = fsub contract float %37, %25
  %54 = fdiv contract float %53, 6.000000e+00
  %55 = fadd contract float %54, %50
  %56 = fdiv contract float %55, %38
  %57 = fsub contract float %37, %29
  %58 = fdiv contract float %57, 6.000000e+00
  %59 = fadd contract float %58, %50
  %60 = fdiv contract float %59, %38
  %61 = fcmp contract oeq float %21, %37
  br i1 %61, label %62, label %64

62:                                               ; preds = %42
  %63 = fsub contract float %60, %56
  br label %78

64:                                               ; preds = %42
  %65 = fcmp contract oeq float %25, %37
  br i1 %65, label %66, label %72

66:                                               ; preds = %64
  %67 = fpext float %52 to double
  %68 = fadd contract double %67, 0x3FD5555555555555
  %69 = fpext float %60 to double
  %70 = fsub contract double %68, %69
  %71 = fptrunc double %70 to float
  br label %78

72:                                               ; preds = %64
  %73 = fpext float %56 to double
  %74 = fadd contract double %73, 0x3FE5555555555555
  %75 = fpext float %52 to double
  %76 = fsub contract double %74, %75
  %77 = fptrunc double %76 to float
  br label %78

78:                                               ; preds = %62, %72, %66, %7
  %79 = phi float [ 0.000000e+00, %7 ], [ %47, %66 ], [ %47, %72 ], [ %47, %62 ]
  %80 = phi float [ 0.000000e+00, %7 ], [ %71, %66 ], [ %77, %72 ], [ %63, %62 ]
  %81 = fcmp contract olt float %80, 0.000000e+00
  %82 = fadd contract float %80, 1.000000e+00
  %83 = select i1 %81, float %82, float %80
  %84 = fcmp contract ogt float %83, 1.000000e+00
  %85 = fadd contract float %83, -1.000000e+00
  %86 = select i1 %84, float %85, float %83
  %87 = getelementptr inbounds float, float addrspace(1)* %4, i64 %17
  store float %86, float addrspace(1)* %87, align 4, !tbaa !10
  %88 = getelementptr inbounds float, float addrspace(1)* %5, i64 %17
  store float %79, float addrspace(1)* %88, align 4, !tbaa !10
  %89 = fmul contract float %40, 2.550000e+02
  %90 = fptoui float %89 to i8
  %91 = getelementptr inbounds i8, i8 addrspace(1)* %6, i64 %17
  store i8 %90, i8 addrspace(1)* %91, align 1, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
