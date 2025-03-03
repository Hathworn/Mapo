; ModuleID = '../data/hip_kernels/937/2/main.cu'
source_filename = "../data/hip_kernels/937/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15rgb2hsl_gpu_sonPhS_S_PfS0_S_i(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, float addrspace(1)* nocapture writeonly %4, i8 addrspace(1)* nocapture writeonly %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = mul i32 %14, %13
  %16 = add i32 %15, %8
  %17 = icmp slt i32 %16, %6
  br i1 %17, label %18, label %97

18:                                               ; preds = %7
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %19
  %21 = load i8, i8 addrspace(1)* %20, align 1, !tbaa !7, !amdgpu.noclobber !6
  %22 = uitofp i8 %21 to float
  %23 = fdiv contract float %22, 2.550000e+02
  %24 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %19
  %25 = load i8, i8 addrspace(1)* %24, align 1, !tbaa !7, !amdgpu.noclobber !6
  %26 = uitofp i8 %25 to float
  %27 = fdiv contract float %26, 2.550000e+02
  %28 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %19
  %29 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !7, !amdgpu.noclobber !6
  %30 = uitofp i8 %29 to float
  %31 = fdiv contract float %30, 2.550000e+02
  %32 = fcmp contract olt float %23, %27
  %33 = select contract i1 %32, float %23, float %27
  %34 = fcmp contract olt float %33, %31
  %35 = select contract i1 %34, float %33, float %31
  %36 = fcmp contract ogt float %23, %27
  %37 = select contract i1 %36, float %23, float %27
  %38 = fcmp contract ogt float %37, %31
  %39 = select contract i1 %38, float %37, float %31
  %40 = fsub contract float %39, %35
  %41 = fadd contract float %39, %35
  %42 = fmul contract float %41, 5.000000e-01
  %43 = fcmp contract oeq float %40, 0.000000e+00
  br i1 %43, label %89, label %44

44:                                               ; preds = %18
  %45 = fcmp contract olt float %42, 5.000000e-01
  br i1 %45, label %79, label %46

46:                                               ; preds = %44
  %47 = fsub contract float 2.000000e+00, %39
  %48 = fsub contract float %47, %35
  %49 = fsub contract float %39, %23
  %50 = fdiv contract float %49, 6.000000e+00
  %51 = fmul contract float %40, 5.000000e-01
  %52 = fadd contract float %50, %51
  %53 = fdiv contract float %52, %40
  %54 = fsub contract float %39, %27
  %55 = fdiv contract float %54, 6.000000e+00
  %56 = fadd contract float %55, %51
  %57 = fdiv contract float %56, %40
  %58 = fsub contract float %39, %31
  %59 = fdiv contract float %58, 6.000000e+00
  %60 = fadd contract float %59, %51
  %61 = fdiv contract float %60, %40
  %62 = fcmp contract oeq float %23, %39
  br i1 %62, label %63, label %65

63:                                               ; preds = %46
  %64 = fsub contract float %61, %57
  br label %79

65:                                               ; preds = %46
  %66 = fcmp contract oeq float %27, %39
  br i1 %66, label %67, label %73

67:                                               ; preds = %65
  %68 = fpext float %53 to double
  %69 = fadd contract double %68, 0x3FD5555555555555
  %70 = fpext float %61 to double
  %71 = fsub contract double %69, %70
  %72 = fptrunc double %71 to float
  br label %79

73:                                               ; preds = %65
  %74 = fpext float %57 to double
  %75 = fadd contract double %74, 0x3FE5555555555555
  %76 = fpext float %53 to double
  %77 = fsub contract double %75, %76
  %78 = fptrunc double %77 to float
  br label %79

79:                                               ; preds = %63, %73, %67, %44
  %80 = phi float [ %41, %44 ], [ %48, %67 ], [ %48, %73 ], [ %48, %63 ]
  %81 = phi float [ undef, %44 ], [ %72, %67 ], [ %78, %73 ], [ %64, %63 ]
  %82 = fdiv contract float %40, %80
  %83 = fcmp contract olt float %81, 0.000000e+00
  %84 = fadd contract float %81, 1.000000e+00
  %85 = select i1 %83, float %84, float %81
  %86 = fcmp contract ogt float %85, 1.000000e+00
  %87 = fadd contract float %85, -1.000000e+00
  %88 = select i1 %86, float %87, float %85
  br label %89

89:                                               ; preds = %79, %18
  %90 = phi float [ 0.000000e+00, %18 ], [ %82, %79 ]
  %91 = phi float [ 0.000000e+00, %18 ], [ %88, %79 ]
  %92 = getelementptr inbounds float, float addrspace(1)* %3, i64 %19
  store float %91, float addrspace(1)* %92, align 4, !tbaa !10
  %93 = getelementptr inbounds float, float addrspace(1)* %4, i64 %19
  store float %90, float addrspace(1)* %93, align 4, !tbaa !10
  %94 = fmul contract float %42, 2.550000e+02
  %95 = fptoui float %94 to i8
  %96 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %19
  store i8 %95, i8 addrspace(1)* %96, align 1, !tbaa !7
  br label %97

97:                                               ; preds = %7, %89
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
