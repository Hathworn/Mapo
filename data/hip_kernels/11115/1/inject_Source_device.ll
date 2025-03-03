; ModuleID = '../data/hip_kernels/11115/1/main.cu'
source_filename = "../data/hip_kernels/11115/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13inject_SourceiiPfS_S_Piiii(i32 %0, i32 %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = sitofp i32 %6 to float
  %20 = sitofp i32 %7 to float
  %21 = fdiv contract float %19, %20
  %22 = sext i32 %1 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %3, i64 %22
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !5
  %25 = mul nsw i32 %18, %8
  %26 = add nsw i32 %25, %0
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %4, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !5
  %30 = fmul contract float %24, %29
  %31 = add nsw i32 %1, 1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %3, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = add nsw i32 %26, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %4, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = fmul contract float %34, %38
  %40 = fadd contract float %30, %39
  %41 = add nsw i32 %1, 2
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %3, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = add nsw i32 %26, 2
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %4, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = fmul contract float %44, %48
  %50 = fadd contract float %40, %49
  %51 = add nsw i32 %1, 3
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %3, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = add nsw i32 %26, 3
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %4, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !5
  %59 = fmul contract float %54, %58
  %60 = fadd contract float %50, %59
  %61 = add nsw i32 %1, 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %3, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  %65 = add nsw i32 %26, 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %4, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7, !amdgpu.noclobber !5
  %69 = fmul contract float %64, %68
  %70 = fadd contract float %60, %69
  %71 = add nsw i32 %1, 5
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %3, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = add nsw i32 %26, 5
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %4, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = fmul contract float %74, %78
  %80 = fadd contract float %70, %79
  %81 = add nsw i32 %1, 6
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %3, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !5
  %85 = add nsw i32 %26, 6
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %4, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = fmul contract float %84, %88
  %90 = fadd contract float %80, %89
  %91 = add nsw i32 %1, 7
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %3, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7, !amdgpu.noclobber !5
  %95 = add nsw i32 %26, 7
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %4, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7, !amdgpu.noclobber !5
  %99 = fmul contract float %94, %98
  %100 = fadd contract float %90, %99
  %101 = fmul contract float %21, %100
  %102 = sext i32 %18 to i64
  %103 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %102
  %104 = load i32, i32 addrspace(1)* %103, align 4, !tbaa !11, !amdgpu.noclobber !5
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %2, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !5
  %108 = fadd contract float %107, %101
  store float %108, float addrspace(1)* %106, align 4, !tbaa !7
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
