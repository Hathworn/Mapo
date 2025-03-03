; ModuleID = '../data/hip_kernels/3557/3/main.cu'
source_filename = "../data/hip_kernels/3557/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20cudaSGatherRP_kerneljjjjPKfS0_S0_S0_S0_PKiPfjj(i32 %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture writeonly %10, i32 %11, i32 %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %15 = mul i32 %14, %11
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %17 = and i32 %16, 31
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  %24 = mul i32 %18, %23
  %25 = add i32 %24, %17
  %26 = icmp ult i32 %25, %12
  br i1 %26, label %27, label %107

27:                                               ; preds = %13
  %28 = mul i32 %14, %12
  %29 = add i32 %25, %28
  %30 = add nsw i32 %25, %15
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !6
  %34 = add nsw i32 %33, %15
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %5, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !11, !amdgpu.noclobber !6
  %38 = getelementptr inbounds float, float addrspace(1)* %6, i64 %35
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !11, !amdgpu.noclobber !6
  %40 = uitofp i32 %0 to float
  %41 = fmul contract float %39, %40
  %42 = fadd contract float %37, %41
  %43 = getelementptr inbounds float, float addrspace(1)* %7, i64 %35
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !11, !amdgpu.noclobber !6
  %45 = uitofp i32 %2 to float
  %46 = fadd contract float %44, %45
  %47 = fmul contract float %46, %40
  %48 = uitofp i32 %1 to float
  %49 = fmul contract float %47, %48
  %50 = fadd contract float %42, %49
  %51 = getelementptr inbounds float, float addrspace(1)* %8, i64 %35
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !11, !amdgpu.noclobber !6
  %53 = fmul contract float %52, %45
  %54 = fmul contract float %53, %40
  %55 = fmul contract float %54, %48
  %56 = fmul contract float %55, 6.000000e+00
  %57 = fadd contract float %50, %56
  %58 = fptoui float %57 to i32
  %59 = shl i32 %2, 1
  %60 = uitofp i32 %59 to float
  %61 = fadd contract float %44, %60
  %62 = fmul contract float %61, %40
  %63 = fmul contract float %62, %48
  %64 = fadd contract float %42, %63
  %65 = fadd contract float %64, %56
  %66 = fptoui float %65 to i32
  %67 = mul i32 %2, 3
  %68 = uitofp i32 %67 to float
  %69 = fadd contract float %44, %68
  %70 = fmul contract float %69, %40
  %71 = fmul contract float %70, %48
  %72 = fadd contract float %42, %71
  %73 = fadd contract float %72, %56
  %74 = fptoui float %73 to i32
  %75 = shl i32 %2, 2
  %76 = uitofp i32 %75 to float
  %77 = fadd contract float %44, %76
  %78 = fmul contract float %77, %40
  %79 = fmul contract float %78, %48
  %80 = fadd contract float %42, %79
  %81 = fadd contract float %80, %56
  %82 = fptoui float %81 to i32
  %83 = zext i32 %58 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %4, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !11, !amdgpu.noclobber !6
  %86 = shl nsw i32 %29, 2
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %10, i64 %87
  store float %85, float addrspace(1)* %88, align 4, !tbaa !11
  %89 = zext i32 %66 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %4, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !11
  %92 = add nuw nsw i32 %86, 1
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %10, i64 %93
  store float %91, float addrspace(1)* %94, align 4, !tbaa !11
  %95 = zext i32 %74 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %4, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !11
  %98 = add nuw nsw i32 %86, 2
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %10, i64 %99
  store float %97, float addrspace(1)* %100, align 4, !tbaa !11
  %101 = zext i32 %82 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %4, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !11
  %104 = add nuw nsw i32 %86, 3
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %10, i64 %105
  store float %103, float addrspace(1)* %106, align 4, !tbaa !11
  br label %107

107:                                              ; preds = %27, %13
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
