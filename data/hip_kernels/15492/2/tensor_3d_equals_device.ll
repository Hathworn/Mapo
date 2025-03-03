; ModuleID = '../data/hip_kernels/15492/2/main.cu'
source_filename = "../data/hip_kernels/15492/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16tensor_3d_equalsiiiPKfiiiiS0_iiiiPi(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, i32 %7, float addrspace(1)* nocapture readonly %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 addrspace(1)* nocapture %13) local_unnamed_addr #0 {
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %15, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %21, %22
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %25 = getelementptr i8, i8 addrspace(4)* %16, i64 6
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 2, !range !4, !invariant.load !5
  %28 = zext i16 %27 to i32
  %29 = mul i32 %24, %28
  %30 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %31 = add i32 %29, %30
  %32 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %33 = getelementptr i8, i8 addrspace(4)* %16, i64 8
  %34 = bitcast i8 addrspace(4)* %33 to i16 addrspace(4)*
  %35 = load i16, i16 addrspace(4)* %34, align 4, !range !4, !invariant.load !5
  %36 = zext i16 %35 to i32
  %37 = mul i32 %32, %36
  %38 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !6
  %39 = add i32 %37, %38
  %40 = icmp slt i32 %23, %0
  %41 = icmp slt i32 %31, %1
  %42 = select i1 %40, i1 %41, i1 false
  %43 = icmp slt i32 %39, %2
  %44 = select i1 %42, i1 %43, i1 false
  br i1 %44, label %45, label %68

45:                                               ; preds = %14
  %46 = mul nsw i32 %23, %5
  %47 = add nsw i32 %46, %4
  %48 = mul nsw i32 %31, %6
  %49 = add nsw i32 %47, %48
  %50 = mul nsw i32 %39, %7
  %51 = add nsw i32 %49, %50
  %52 = mul nsw i32 %23, %10
  %53 = add nsw i32 %52, %9
  %54 = mul nsw i32 %31, %11
  %55 = add nsw i32 %53, %54
  %56 = mul nsw i32 %39, %12
  %57 = add nsw i32 %55, %56
  %58 = sext i32 %51 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %3, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !5
  %61 = sext i32 %57 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %8, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  %64 = fcmp contract une float %60, %63
  br i1 %64, label %65, label %68

65:                                               ; preds = %45
  %66 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !11, !amdgpu.noclobber !5
  %67 = add nsw i32 %66, 1
  store i32 %67, i32 addrspace(1)* %13, align 4, !tbaa !11
  br label %68

68:                                               ; preds = %14, %45, %65
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
