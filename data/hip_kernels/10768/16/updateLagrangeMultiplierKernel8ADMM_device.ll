; ModuleID = '../data/hip_kernels/10768/16/main.cu'
source_filename = "../data/hip_kernels/10768/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z35updateLagrangeMultiplierKernel8ADMMPfS_S_S_S_S_S_S_S_S_S_fjjj(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture %5, float addrspace(1)* nocapture %6, float addrspace(1)* nocapture %7, float addrspace(1)* nocapture %8, float addrspace(1)* nocapture %9, float addrspace(1)* nocapture writeonly %10, float %11, i32 %12, i32 %13, i32 %14) local_unnamed_addr #0 {
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %17 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = add i32 %23, %16
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %27 = getelementptr i8, i8 addrspace(4)* %17, i64 6
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = load i16, i16 addrspace(4)* %28, align 2, !range !5, !invariant.load !6
  %30 = zext i16 %29 to i32
  %31 = mul i32 %26, %30
  %32 = add i32 %31, %25
  %33 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %34 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %35 = getelementptr i8, i8 addrspace(4)* %17, i64 8
  %36 = bitcast i8 addrspace(4)* %35 to i16 addrspace(4)*
  %37 = load i16, i16 addrspace(4)* %36, align 4, !range !5, !invariant.load !6
  %38 = zext i16 %37 to i32
  %39 = mul i32 %34, %38
  %40 = add i32 %39, %33
  %41 = icmp ult i32 %24, %12
  %42 = icmp ult i32 %32, %13
  %43 = select i1 %41, i1 %42, i1 false
  %44 = icmp ult i32 %40, %14
  %45 = select i1 %43, i1 %44, i1 false
  br i1 %45, label %46, label %102

46:                                               ; preds = %15
  %47 = mul i32 %40, %13
  %48 = add i32 %47, %32
  %49 = mul i32 %48, %12
  %50 = add i32 %49, %24
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !6
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !6
  %56 = fsub contract float %53, %55
  %57 = getelementptr inbounds float, float addrspace(1)* %10, i64 %51
  store float %56, float addrspace(1)* %57, align 4, !tbaa !7
  %58 = getelementptr inbounds float, float addrspace(1)* %4, i64 %51
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = load float, float addrspace(1)* %52, align 4, !tbaa !7
  %61 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %62 = fsub contract float %60, %61
  %63 = fmul contract float %62, %11
  %64 = fadd contract float %59, %63
  store float %64, float addrspace(1)* %58, align 4, !tbaa !7
  %65 = getelementptr inbounds float, float addrspace(1)* %5, i64 %51
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7
  %67 = load float, float addrspace(1)* %52, align 4, !tbaa !7
  %68 = getelementptr inbounds float, float addrspace(1)* %2, i64 %51
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7
  %70 = fsub contract float %67, %69
  %71 = fmul contract float %70, %11
  %72 = fadd contract float %66, %71
  store float %72, float addrspace(1)* %65, align 4, !tbaa !7
  %73 = getelementptr inbounds float, float addrspace(1)* %6, i64 %51
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %75 = load float, float addrspace(1)* %52, align 4, !tbaa !7
  %76 = getelementptr inbounds float, float addrspace(1)* %3, i64 %51
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7
  %78 = fsub contract float %75, %77
  %79 = fmul contract float %78, %11
  %80 = fadd contract float %74, %79
  store float %80, float addrspace(1)* %73, align 4, !tbaa !7
  %81 = getelementptr inbounds float, float addrspace(1)* %7, i64 %51
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %84 = load float, float addrspace(1)* %68, align 4, !tbaa !7
  %85 = fsub contract float %83, %84
  %86 = fmul contract float %85, %11
  %87 = fadd contract float %82, %86
  store float %87, float addrspace(1)* %81, align 4, !tbaa !7
  %88 = getelementptr inbounds float, float addrspace(1)* %8, i64 %51
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7
  %90 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %91 = load float, float addrspace(1)* %76, align 4, !tbaa !7
  %92 = fsub contract float %90, %91
  %93 = fmul contract float %92, %11
  %94 = fadd contract float %89, %93
  store float %94, float addrspace(1)* %88, align 4, !tbaa !7
  %95 = getelementptr inbounds float, float addrspace(1)* %9, i64 %51
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7
  %97 = load float, float addrspace(1)* %68, align 4, !tbaa !7
  %98 = load float, float addrspace(1)* %76, align 4, !tbaa !7
  %99 = fsub contract float %97, %98
  %100 = fmul contract float %99, %11
  %101 = fadd contract float %96, %100
  store float %101, float addrspace(1)* %95, align 4, !tbaa !7
  br label %102

102:                                              ; preds = %46, %15
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
