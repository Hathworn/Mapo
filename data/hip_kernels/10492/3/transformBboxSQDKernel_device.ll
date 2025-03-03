; ModuleID = '../data/hip_kernels/10492/3/main.cu'
source_filename = "../data/hip_kernels/10492/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z22transformBboxSQDKernelPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = mul i32 %5, %3
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add i32 %6, %7
  %9 = shl i32 %8, 2
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds float, float addrspace(1)* %0, i64 %10
  %12 = load float, float addrspace(1)* %11, align 4, !tbaa !5, !amdgpu.noclobber !9
  %13 = add nuw nsw i32 %9, 1
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds float, float addrspace(1)* %0, i64 %14
  %16 = load float, float addrspace(1)* %15, align 4, !tbaa !5, !amdgpu.noclobber !9
  %17 = add nuw nsw i32 %9, 2
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !5, !amdgpu.noclobber !9
  %21 = add nuw nsw i32 %9, 3
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %0, i64 %22
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !5, !amdgpu.noclobber !9
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 %10
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !5, !amdgpu.noclobber !9
  %27 = getelementptr inbounds float, float addrspace(1)* %1, i64 %14
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !5, !amdgpu.noclobber !9
  %29 = getelementptr inbounds float, float addrspace(1)* %1, i64 %18
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !5, !amdgpu.noclobber !9
  %31 = getelementptr inbounds float, float addrspace(1)* %1, i64 %22
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !5, !amdgpu.noclobber !9
  %33 = fcmp contract olt float %20, 1.000000e+00
  br i1 %33, label %34, label %49

34:                                               ; preds = %4
  %35 = fmul float %20, 0x3FF7154760000000
  %36 = tail call float @llvm.rint.f32(float %35)
  %37 = fcmp ogt float %20, 0x40562E4300000000
  %38 = fcmp olt float %20, 0xC059D1DA00000000
  %39 = fneg float %35
  %40 = tail call float @llvm.fma.f32(float %20, float 0x3FF7154760000000, float %39)
  %41 = tail call float @llvm.fma.f32(float %20, float 0x3E54AE0BE0000000, float %40)
  %42 = fsub float %35, %36
  %43 = fadd float %41, %42
  %44 = tail call float @llvm.exp2.f32(float %43)
  %45 = fptosi float %36 to i32
  %46 = tail call float @llvm.amdgcn.ldexp.f32(float %44, i32 %45)
  %47 = select i1 %38, float 0.000000e+00, float %46
  %48 = select i1 %37, float 0x7FF0000000000000, float %47
  br label %51

49:                                               ; preds = %4
  %50 = fmul contract float %20, 0x4005BF0A80000000
  br label %51

51:                                               ; preds = %49, %34
  %52 = phi contract float [ %48, %34 ], [ %50, %49 ]
  %53 = fcmp contract olt float %24, 1.000000e+00
  br i1 %53, label %54, label %69

54:                                               ; preds = %51
  %55 = fmul float %24, 0x3FF7154760000000
  %56 = tail call float @llvm.rint.f32(float %55)
  %57 = fcmp ogt float %24, 0x40562E4300000000
  %58 = fcmp olt float %24, 0xC059D1DA00000000
  %59 = fneg float %55
  %60 = tail call float @llvm.fma.f32(float %24, float 0x3FF7154760000000, float %59)
  %61 = tail call float @llvm.fma.f32(float %24, float 0x3E54AE0BE0000000, float %60)
  %62 = fsub float %55, %56
  %63 = fadd float %61, %62
  %64 = tail call float @llvm.exp2.f32(float %63)
  %65 = fptosi float %56 to i32
  %66 = tail call float @llvm.amdgcn.ldexp.f32(float %64, i32 %65)
  %67 = select i1 %58, float 0.000000e+00, float %66
  %68 = select i1 %57, float 0x7FF0000000000000, float %67
  br label %71

69:                                               ; preds = %51
  %70 = fmul contract float %24, 0x4005BF0A80000000
  br label %71

71:                                               ; preds = %69, %54
  %72 = phi contract float [ %68, %54 ], [ %70, %69 ]
  %73 = fmul contract float %30, %52
  %74 = fmul contract float %16, %32
  %75 = fadd contract float %28, %74
  %76 = fmul contract float %12, %30
  %77 = fadd contract float %26, %76
  %78 = fmul contract float %32, %72
  %79 = fpext float %77 to double
  %80 = fpext float %73 to double
  %81 = fmul contract double %80, 5.000000e-01
  %82 = fsub contract double %79, %81
  %83 = fptrunc double %82 to float
  %84 = getelementptr inbounds float, float addrspace(1)* %2, i64 %10
  store float %83, float addrspace(1)* %84, align 4, !tbaa !5
  %85 = fpext float %75 to double
  %86 = fpext float %78 to double
  %87 = fmul contract double %86, 5.000000e-01
  %88 = fsub contract double %85, %87
  %89 = fptrunc double %88 to float
  %90 = getelementptr inbounds float, float addrspace(1)* %2, i64 %14
  store float %89, float addrspace(1)* %90, align 4, !tbaa !5
  %91 = fadd contract double %81, %79
  %92 = fptrunc double %91 to float
  %93 = getelementptr inbounds float, float addrspace(1)* %2, i64 %18
  store float %92, float addrspace(1)* %93, align 4, !tbaa !5
  %94 = fadd contract double %87, %85
  %95 = fptrunc double %94 to float
  %96 = getelementptr inbounds float, float addrspace(1)* %2, i64 %22
  store float %95, float addrspace(1)* %96, align 4, !tbaa !5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

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
