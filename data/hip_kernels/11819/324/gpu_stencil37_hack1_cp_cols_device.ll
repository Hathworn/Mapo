; ModuleID = '../data/hip_kernels/11819/324/main.cu'
source_filename = "../data/hip_kernels/11819/324/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z27gpu_stencil37_hack1_cp_colsPdS_S_S_mmmiii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readnone %1, double addrspace(1)* nocapture writeonly %2, double addrspace(1)* nocapture readnone %3, i64 %4, i64 %5, i64 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %12 = mul i32 %11, %9
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 2, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = mul i32 %18, %17
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = mul i32 %20, %7
  %22 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %23 = bitcast i8 addrspace(4)* %22 to i32 addrspace(4)*
  %24 = load i32, i32 addrspace(4)* %23, align 4, !tbaa !6
  %25 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 4, !range !4, !invariant.load !5
  %28 = zext i16 %27 to i32
  %29 = udiv i32 %24, %28
  %30 = sext i32 %12 to i64
  %31 = sext i32 %21 to i64
  %32 = add nsw i32 %21, 1
  %33 = sext i32 %32 to i64
  %34 = icmp ult i64 %33, %5
  %35 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %36 = add nsw i32 %19, %35
  %37 = sext i32 %36 to i64
  %38 = icmp uge i64 %37, %4
  %39 = icmp sgt i32 %9, 0
  br i1 %39, label %40, label %54

40:                                               ; preds = %10
  %41 = sext i32 %19 to i64
  %42 = mul i32 %29, %28
  %43 = icmp ugt i32 %24, %42
  %44 = zext i1 %43 to i32
  %45 = add i32 %29, %44
  %46 = zext i32 %45 to i64
  %47 = zext i32 %35 to i64
  %48 = add nsw i64 %41, %47
  %49 = shl nuw nsw i64 %46, 1
  %50 = shl i32 %20, 1
  %51 = zext i32 %50 to i64
  %52 = zext i32 %19 to i64
  %53 = add nuw nsw i64 %52, %47
  br label %55

54:                                               ; preds = %81, %10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void

55:                                               ; preds = %40, %81
  %56 = phi i32 [ 0, %40 ], [ %82, %81 ]
  %57 = add nsw i32 %56, %12
  %58 = sext i32 %57 to i64
  %59 = icmp uge i64 %58, %6
  %60 = zext i32 %56 to i64
  %61 = add nsw i64 %60, %30
  %62 = mul i64 %61, %4
  %63 = add i64 %48, %62
  %64 = mul i64 %63, %5
  %65 = add i64 %64, %31
  %66 = mul i64 %49, %58
  %67 = add i64 %66, %51
  %68 = mul i64 %67, %4
  %69 = add i64 %53, %68
  %70 = select i1 %38, i1 true, i1 %59
  br i1 %70, label %81, label %71

71:                                               ; preds = %55
  %72 = getelementptr inbounds double, double addrspace(1)* %0, i64 %65
  %73 = load double, double addrspace(1)* %72, align 8, !tbaa !16
  %74 = getelementptr inbounds double, double addrspace(1)* %2, i64 %69
  store double %73, double addrspace(1)* %74, align 8, !tbaa !16
  br i1 %34, label %75, label %81

75:                                               ; preds = %71
  %76 = add i64 %65, 1
  %77 = getelementptr inbounds double, double addrspace(1)* %0, i64 %76
  %78 = load double, double addrspace(1)* %77, align 8, !tbaa !16
  %79 = add i64 %69, %4
  %80 = getelementptr inbounds double, double addrspace(1)* %2, i64 %79
  store double %78, double addrspace(1)* %80, align 8, !tbaa !16
  br label %81

81:                                               ; preds = %55, %71, %75
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %82 = add nuw nsw i32 %56, 1
  %83 = icmp eq i32 %82, %9
  br i1 %83, label %54, label %55, !llvm.loop !20
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
