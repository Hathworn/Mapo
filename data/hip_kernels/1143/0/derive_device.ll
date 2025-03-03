; ModuleID = '../data/hip_kernels/1143/0/main.cu'
source_filename = "../data/hip_kernels/1143/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z6derivePdS_iid(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, double %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !4
  %12 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !13, !invariant.load !14
  %15 = zext i16 %14 to i32
  %16 = udiv i32 %11, %15
  %17 = mul i32 %16, %15
  %18 = icmp ugt i32 %11, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 16
  %22 = bitcast i8 addrspace(4)* %21 to i32 addrspace(4)*
  %23 = load i32, i32 addrspace(4)* %22, align 8, !tbaa !15
  %24 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 2, !range !13, !invariant.load !14
  %27 = zext i16 %26 to i32
  %28 = udiv i32 %23, %27
  %29 = mul i32 %28, %27
  %30 = icmp ugt i32 %23, %29
  %31 = zext i1 %30 to i32
  %32 = add i32 %28, %31
  %33 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %34 = mul i32 %32, %33
  %35 = add i32 %34, %7
  %36 = mul i32 %35, %20
  %37 = add i32 %36, %6
  %38 = getelementptr i8, i8 addrspace(4)* %8, i64 8
  %39 = bitcast i8 addrspace(4)* %38 to i16 addrspace(4)*
  %40 = load i16, i16 addrspace(4)* %39, align 4, !range !13, !invariant.load !14
  %41 = zext i16 %40 to i32
  %42 = mul i32 %37, %41
  %43 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !16
  %44 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !16
  %45 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %46 = add i32 %42, %44
  %47 = mul i32 %46, %27
  %48 = add i32 %47, %43
  %49 = mul i32 %48, %15
  %50 = add i32 %49, %45
  %51 = icmp slt i32 %50, %3
  br i1 %51, label %52, label %72

52:                                               ; preds = %5
  %53 = add nsw i32 %50, %2
  %54 = icmp slt i32 %53, %3
  br i1 %54, label %55, label %63

55:                                               ; preds = %52
  %56 = sext i32 %53 to i64
  %57 = getelementptr inbounds double, double addrspace(1)* %0, i64 %56
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !17, !amdgpu.noclobber !14
  %59 = sext i32 %50 to i64
  %60 = getelementptr inbounds double, double addrspace(1)* %0, i64 %59
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !17, !amdgpu.noclobber !14
  %62 = fsub contract double %58, %61
  br label %67

63:                                               ; preds = %52
  %64 = sext i32 %50 to i64
  %65 = getelementptr inbounds double, double addrspace(1)* %0, i64 %64
  %66 = load double, double addrspace(1)* %65, align 8, !tbaa !17, !amdgpu.noclobber !14
  br label %67

67:                                               ; preds = %63, %55
  %68 = phi double [ %62, %55 ], [ %66, %63 ]
  %69 = phi i64 [ %59, %55 ], [ %64, %63 ]
  %70 = fdiv contract double %68, %4
  %71 = getelementptr inbounds double, double addrspace(1)* %1, i64 %69
  store double %70, double addrspace(1)* %71, align 8, !tbaa !17
  br label %72

72:                                               ; preds = %67, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #1

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{!5, !9, i64 16}
!16 = !{i32 0, i32 1024}
!17 = !{!18, !18, i64 0}
!18 = !{!"double", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
