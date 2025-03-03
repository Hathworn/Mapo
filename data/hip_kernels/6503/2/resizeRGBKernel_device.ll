; ModuleID = '../data/hip_kernels/6503/2/main.cu'
source_filename = "../data/hip_kernels/6503/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL15resizeRGBKernelPKtiiPhiiPi = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define amdgpu_kernel void @_ZL15resizeRGBKernelPKtiiPhiiPi(i16 addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i8 addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 comdat {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %16, %4
  %26 = icmp slt i32 %24, %5
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %70

28:                                               ; preds = %7
  %29 = sdiv i32 %1, %4
  %30 = sdiv i32 %2, %5
  %31 = mul i32 %24, %1
  %32 = mul i32 %31, %30
  %33 = mul i32 %29, %16
  %34 = add i32 %32, %33
  %35 = mul i32 %34, 3
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %36
  %38 = load i16, i16 addrspace(1)* %37, align 2, !tbaa !7, !amdgpu.noclobber !5
  %39 = add nsw i32 %35, 1
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %40
  %42 = load i16, i16 addrspace(1)* %41, align 2, !tbaa !7, !amdgpu.noclobber !5
  %43 = add nsw i32 %35, 2
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %44
  %46 = load i16, i16 addrspace(1)* %45, align 2, !tbaa !7, !amdgpu.noclobber !5
  %47 = mul nsw i32 %24, %4
  %48 = zext i16 %38 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !11, !amdgpu.noclobber !5
  %51 = trunc i32 %50 to i8
  %52 = add i32 %47, %16
  %53 = mul i32 %52, 3
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %54
  store i8 %51, i8 addrspace(1)* %55, align 1, !tbaa !13
  %56 = zext i16 %42 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !11
  %59 = trunc i32 %58 to i8
  %60 = add nsw i32 %53, 1
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %61
  store i8 %59, i8 addrspace(1)* %62, align 1, !tbaa !13
  %63 = zext i16 %46 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !11
  %66 = trunc i32 %65 to i8
  %67 = add nsw i32 %53, 2
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %68
  store i8 %66, i8 addrspace(1)* %69, align 1, !tbaa !13
  br label %70

70:                                               ; preds = %28, %7
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
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = !{!9, !9, i64 0}
