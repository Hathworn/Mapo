; ModuleID = '../data/hip_kernels/925/37/main.cu'
source_filename = "../data/hip_kernels/925/37/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdatad = external hidden local_unnamed_addr addrspace(3) global [0 x double], align 8

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9multipassPdS_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !7
  %14 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 16
  %21 = bitcast i8 addrspace(4)* %20 to i32 addrspace(4)*
  %22 = load i32, i32 addrspace(4)* %21, align 8, !tbaa !16
  %23 = mul nuw nsw i32 %14, %19
  %24 = add nuw nsw i32 %23, %4
  %25 = mul nuw nsw i32 %24, %10
  %26 = add nuw nsw i32 %25, %3
  %27 = udiv i32 %13, %10
  %28 = mul i32 %27, %10
  %29 = icmp ugt i32 %13, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %27, %30
  %32 = udiv i32 %22, %19
  %33 = mul i32 %32, %19
  %34 = icmp ugt i32 %22, %33
  %35 = zext i1 %34 to i32
  %36 = add i32 %32, %35
  %37 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %38 = mul i32 %36, %37
  %39 = add i32 %38, %15
  %40 = mul i32 %39, %31
  %41 = add i32 %40, %6
  %42 = getelementptr i8, i8 addrspace(4)* %5, i64 8
  %43 = bitcast i8 addrspace(4)* %42 to i16 addrspace(4)*
  %44 = load i16, i16 addrspace(4)* %43, align 4, !range !5, !invariant.load !6
  %45 = zext i16 %44 to i32
  %46 = mul i32 %41, %45
  %47 = add i32 %46, %14
  %48 = mul i32 %47, %19
  %49 = add i32 %48, %4
  %50 = mul i32 %49, %10
  %51 = add i32 %50, %3
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds double, double addrspace(1)* %0, i64 %52
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !17, !amdgpu.noclobber !6
  %55 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @sdatad, i32 0, i32 %26
  store double %54, double addrspace(3)* %55, align 8, !tbaa !17
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %56 = icmp ult i16 %9, 2
  br i1 %56, label %57, label %59

57:                                               ; preds = %69, %2
  %58 = icmp eq i32 %26, 0
  br i1 %58, label %71, label %75

59:                                               ; preds = %2, %69
  %60 = phi i32 [ %61, %69 ], [ %10, %2 ]
  %61 = lshr i32 %60, 1
  %62 = icmp ult i32 %26, %61
  br i1 %62, label %63, label %69

63:                                               ; preds = %59
  %64 = add nuw i32 %61, %26
  %65 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @sdatad, i32 0, i32 %64
  %66 = load double, double addrspace(3)* %65, align 8, !tbaa !17
  %67 = load double, double addrspace(3)* %55, align 8, !tbaa !17
  %68 = fadd contract double %66, %67
  store double %68, double addrspace(3)* %55, align 8, !tbaa !17
  br label %69

69:                                               ; preds = %63, %59
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %70 = icmp ult i32 %60, 4
  br i1 %70, label %57, label %59, !llvm.loop !21

71:                                               ; preds = %57
  %72 = load double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @sdatad, i32 0, i32 0), align 8, !tbaa !17
  %73 = zext i32 %41 to i64
  %74 = getelementptr inbounds double, double addrspace(1)* %1, i64 %73
  store double %72, double addrspace(1)* %74, align 8, !tbaa !17
  br label %75

75:                                               ; preds = %71, %57
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
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
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!8, !12, i64 16}
!17 = !{!18, !18, i64 0}
!18 = !{!"double", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
