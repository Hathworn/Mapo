; ModuleID = '../data/hip_kernels/17687/16/main.cu'
source_filename = "../data/hip_kernels/17687/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@B = external hidden local_unnamed_addr addrspace(3) global [0 x double], align 8

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13kernelSyncBufPdS_(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = bitcast i8 addrspace(4)* %8 to <2 x i16> addrspace(4)*
  %11 = load <2 x i16>, <2 x i16> addrspace(4)* %10, align 4, !invariant.load !5
  %12 = zext <2 x i16> %11 to <2 x i32>
  %13 = extractelement <2 x i32> %12, i64 0
  %14 = mul i32 %7, %13
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 16
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 8, !tbaa !6
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %19 = getelementptr i8, i8 addrspace(4)* %6, i64 8
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !15, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 20
  %24 = bitcast i8 addrspace(4)* %23 to i32 addrspace(4)*
  %25 = load i32, i32 addrspace(4)* %24, align 4, !tbaa !16
  %26 = extractelement <2 x i32> %12, i64 1
  %27 = udiv i32 %17, %26
  %28 = mul i32 %27, %26
  %29 = icmp ugt i32 %17, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %27, %30
  %32 = udiv i32 %25, %22
  %33 = mul i32 %32, %22
  %34 = icmp ugt i32 %25, %33
  %35 = zext i1 %34 to i32
  %36 = add i32 %32, %35
  %37 = add nsw i32 %14, %3
  %38 = mul nuw nsw i32 %3, %26
  %39 = add nuw nsw i32 %38, %4
  %40 = mul nuw nsw i32 %39, %22
  %41 = add nuw nsw i32 %40, %5
  %42 = mul nsw i32 %31, %7
  %43 = add nsw i32 %42, %9
  %44 = mul nsw i32 %43, %36
  %45 = add nsw i32 %44, %18
  %46 = mul i32 %31, %37
  %47 = add i32 %46, %9
  %48 = mul i32 %47, %26
  %49 = add i32 %48, %4
  %50 = mul i32 %49, %36
  %51 = add i32 %50, %18
  %52 = mul i32 %51, %22
  %53 = add i32 %52, %5
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds double, double addrspace(1)* %1, i64 %54
  %56 = load double, double addrspace(1)* %55, align 8, !tbaa !17, !amdgpu.noclobber !5
  %57 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @B, i32 0, i32 %41
  store double %56, double addrspace(3)* %57, align 8, !tbaa !17
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %58 = mul nuw nsw i32 %26, %13
  %59 = mul nuw nsw i32 %58, %22
  %60 = icmp ugt i32 %59, 1
  br i1 %60, label %61, label %77

61:                                               ; preds = %2, %74
  %62 = phi i32 [ %64, %74 ], [ 1, %2 ]
  %63 = phi i32 [ %75, %74 ], [ %59, %2 ]
  %64 = shl nsw i32 %62, 1
  %65 = add i32 %64, -1
  %66 = and i32 %65, %41
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %68, label %74

68:                                               ; preds = %61
  %69 = load double, double addrspace(3)* %57, align 8, !tbaa !17
  %70 = add nsw i32 %62, %41
  %71 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @B, i32 0, i32 %70
  %72 = load double, double addrspace(3)* %71, align 8, !tbaa !17
  %73 = fadd contract double %69, %72
  store double %73, double addrspace(3)* %57, align 8, !tbaa !17
  br label %74

74:                                               ; preds = %68, %61
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %75 = lshr i32 %63, 1
  %76 = icmp ugt i32 %63, 3
  br i1 %76, label %61, label %77, !llvm.loop !21

77:                                               ; preds = %74, %2
  %78 = icmp eq i32 %41, 0
  br i1 %78, label %79, label %85

79:                                               ; preds = %77
  %80 = load double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @B, i32 0, i32 0), align 8, !tbaa !17
  %81 = sitofp i32 %59 to double
  %82 = fdiv contract double %80, %81
  %83 = sext i32 %45 to i64
  %84 = getelementptr inbounds double, double addrspace(1)* %0, i64 %83
  store double %82, double addrspace(1)* %84, align 8, !tbaa !17
  br label %85

85:                                               ; preds = %79, %77
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
!5 = !{}
!6 = !{!7, !11, i64 16}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i16 1, i16 1025}
!16 = !{!7, !11, i64 20}
!17 = !{!18, !18, i64 0}
!18 = !{!"double", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
