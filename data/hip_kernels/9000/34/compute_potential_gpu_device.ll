; ModuleID = '../data/hip_kernels/9000/34/main.cu'
source_filename = "../data/hip_kernels/9000/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21compute_potential_gpuPfS_S_S_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = add i32 %15, %8
  %17 = icmp eq i32 %6, 0
  %18 = select i1 %17, i32 %5, i32 %6
  %19 = icmp slt i32 %16, %18
  br i1 %19, label %20, label %81

20:                                               ; preds = %7
  %21 = sext i32 %16 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !6
  %24 = getelementptr inbounds float, float addrspace(1)* %2, i64 %21
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !6
  %26 = getelementptr inbounds float, float addrspace(1)* %3, i64 %21
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !6
  %28 = icmp slt i32 %6, %5
  br i1 %28, label %29, label %78

29:                                               ; preds = %20, %74
  %30 = phi float [ %75, %74 ], [ undef, %20 ]
  %31 = phi i32 [ %76, %74 ], [ %6, %20 ]
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !6
  %35 = fsub contract float %23, %34
  %36 = getelementptr inbounds float, float addrspace(1)* %2, i64 %32
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !6
  %38 = fsub contract float %25, %37
  %39 = getelementptr inbounds float, float addrspace(1)* %3, i64 %32
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !6
  %41 = fsub contract float %27, %40
  %42 = icmp eq i32 %16, %31
  br i1 %42, label %74, label %43

43:                                               ; preds = %29
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !6
  %46 = fmul contract float %35, %35
  %47 = fmul contract float %38, %38
  %48 = fadd contract float %46, %47
  %49 = fmul contract float %41, %41
  %50 = fadd contract float %48, %49
  %51 = fcmp olt float %50, 0x39F0000000000000
  %52 = select i1 %51, float 0x41F0000000000000, float 1.000000e+00
  %53 = fmul float %50, %52
  %54 = tail call float @llvm.sqrt.f32(float %53)
  %55 = bitcast float %54 to i32
  %56 = add nsw i32 %55, -1
  %57 = bitcast i32 %56 to float
  %58 = add nsw i32 %55, 1
  %59 = bitcast i32 %58 to float
  %60 = tail call i1 @llvm.amdgcn.class.f32(float %53, i32 608)
  %61 = select i1 %51, float 0x3EF0000000000000, float 1.000000e+00
  %62 = fneg float %59
  %63 = tail call float @llvm.fma.f32(float %62, float %54, float %53)
  %64 = fcmp ogt float %63, 0.000000e+00
  %65 = fneg float %57
  %66 = tail call float @llvm.fma.f32(float %65, float %54, float %53)
  %67 = fcmp ole float %66, 0.000000e+00
  %68 = select i1 %67, float %57, float %54
  %69 = select i1 %64, float %59, float %68
  %70 = fmul float %61, %69
  %71 = select i1 %60, float %53, float %70
  %72 = fdiv contract float %45, %71
  %73 = fsub contract float %30, %72
  br label %74

74:                                               ; preds = %29, %43
  %75 = phi float [ %73, %43 ], [ %30, %29 ]
  %76 = add nsw i32 %31, 1
  %77 = icmp slt i32 %76, %5
  br i1 %77, label %29, label %78, !llvm.loop !11

78:                                               ; preds = %74, %20
  %79 = phi float [ undef, %20 ], [ %75, %74 ]
  %80 = getelementptr inbounds float, float addrspace(1)* %4, i64 %21
  store float %79, float addrspace(1)* %80, align 4, !tbaa !7
  br label %81

81:                                               ; preds = %78, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
