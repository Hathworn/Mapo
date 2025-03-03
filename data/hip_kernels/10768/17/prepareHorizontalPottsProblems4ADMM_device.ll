; ModuleID = '../data/hip_kernels/10768/17/main.cu'
source_filename = "../data/hip_kernels/10768/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z35prepareHorizontalPottsProblems4ADMMPfS_S_S_S_S_fjjj(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = add i32 %18, %11
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !5, !invariant.load !6
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = add i32 %26, %20
  %28 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %29 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %30 = getelementptr i8, i8 addrspace(4)* %12, i64 8
  %31 = bitcast i8 addrspace(4)* %30 to i16 addrspace(4)*
  %32 = load i16, i16 addrspace(4)* %31, align 4, !range !5, !invariant.load !6
  %33 = zext i16 %32 to i32
  %34 = mul i32 %29, %33
  %35 = add i32 %34, %28
  %36 = icmp ult i32 %19, %7
  %37 = icmp ult i32 %27, %8
  %38 = select i1 %36, i1 %37, i1 false
  %39 = icmp ult i32 %35, %9
  %40 = select i1 %38, i1 %39, i1 false
  br i1 %40, label %41, label %65

41:                                               ; preds = %10
  %42 = mul i32 %27, %7
  %43 = add i32 %42, %19
  %44 = mul i32 %8, %7
  %45 = mul i32 %44, %35
  %46 = add i32 %43, %45
  %47 = zext i32 %43 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %3, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !6
  %50 = zext i32 %46 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !6
  %53 = fmul contract float %49, %52
  %54 = getelementptr inbounds float, float addrspace(1)* %2, i64 %50
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !6
  %56 = fmul contract float %55, %6
  %57 = fadd contract float %53, %56
  %58 = getelementptr inbounds float, float addrspace(1)* %5, i64 %50
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !6
  %60 = fsub contract float %57, %59
  %61 = getelementptr inbounds float, float addrspace(1)* %4, i64 %47
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !6
  %63 = fdiv contract float %60, %62
  %64 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  store float %63, float addrspace(1)* %64, align 4, !tbaa !7
  br label %65

65:                                               ; preds = %41, %10
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
