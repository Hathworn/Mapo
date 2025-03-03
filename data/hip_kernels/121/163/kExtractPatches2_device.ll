; ModuleID = '../data/hip_kernels/121/163/main.cu'
source_filename = "../data/hip_kernels/121/163/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16kExtractPatches2PfS_S_S_S_iiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %13 = freeze i32 %12
  %14 = freeze i32 %5
  %15 = udiv i32 %13, %14
  %16 = mul i32 %15, %14
  %17 = sub i32 %13, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %18, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %26 = add i32 %24, %25
  %27 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %28 = getelementptr i8, i8 addrspace(4)* %19, i64 6
  %29 = bitcast i8 addrspace(4)* %28 to i16 addrspace(4)*
  %30 = load i16, i16 addrspace(4)* %29, align 2, !range !4, !invariant.load !5
  %31 = zext i16 %30 to i32
  %32 = mul i32 %27, %31
  %33 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %34 = add i32 %32, %33
  %35 = icmp slt i32 %26, %8
  %36 = icmp slt i32 %34, %9
  %37 = select i1 %35, i1 %36, i1 false
  br i1 %37, label %38, label %71

38:                                               ; preds = %11
  %39 = sext i32 %17 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %3, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = fptosi float %41 to i32
  %43 = getelementptr inbounds float, float addrspace(1)* %2, i64 %39
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = fptosi float %44 to i32
  %46 = add nsw i32 %26, %45
  %47 = getelementptr inbounds float, float addrspace(1)* %4, i64 %39
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = fcmp contract ogt float %48, 5.000000e-01
  %50 = xor i32 %46, -1
  %51 = add i32 %50, %6
  %52 = select i1 %49, i32 %51, i32 %46
  %53 = mul nsw i32 %15, %9
  %54 = add nsw i32 %34, %53
  %55 = mul nsw i32 %54, %8
  %56 = add nsw i32 %55, %26
  %57 = mul nsw i32 %56, %5
  %58 = add nsw i32 %57, %17
  %59 = sext i32 %58 to i64
  %60 = mul nsw i32 %17, %10
  %61 = add nsw i32 %15, %60
  %62 = mul nsw i32 %61, %7
  %63 = add i32 %34, %62
  %64 = add i32 %63, %42
  %65 = mul nsw i32 %64, %6
  %66 = add nsw i32 %52, %65
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  store float %69, float addrspace(1)* %70, align 4, !tbaa !7
  br label %71

71:                                               ; preds = %38, %11
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
