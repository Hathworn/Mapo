; ModuleID = '../data/hip_kernels/11819/348/main.cu'
source_filename = "../data/hip_kernels/11819/348/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z27gpu_stencil37_hack1_cp_rowsPdS_S_S_mmmiii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readnone %2, double addrspace(1)* nocapture readnone %3, i64 %4, i64 %5, i64 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %12 = mul i32 %11, %9
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = mul i32 %13, %8
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = mul i32 %20, %19
  %22 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 16
  %23 = bitcast i8 addrspace(4)* %22 to i32 addrspace(4)*
  %24 = load i32, i32 addrspace(4)* %23, align 8, !tbaa !6
  %25 = getelementptr i8, i8 addrspace(4)* %15, i64 6
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 2, !range !4, !invariant.load !5
  %28 = zext i16 %27 to i32
  %29 = udiv i32 %24, %28
  %30 = mul i32 %29, %28
  %31 = icmp ugt i32 %24, %30
  %32 = zext i1 %31 to i32
  %33 = add i32 %29, %32
  %34 = zext i32 %33 to i64
  %35 = sext i32 %12 to i64
  %36 = sext i32 %14 to i64
  %37 = add nsw i32 %14, 1
  %38 = sext i32 %37 to i64
  %39 = icmp ult i64 %38, %4
  %40 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %41 = add nsw i32 %21, %40
  %42 = sext i32 %41 to i64
  %43 = icmp uge i64 %42, %5
  %44 = icmp sgt i32 %9, 0
  br i1 %44, label %45, label %53

45:                                               ; preds = %10
  %46 = sext i32 %21 to i64
  %47 = zext i32 %40 to i64
  %48 = add nsw i64 %46, %47
  %49 = zext i32 %13 to i64
  %50 = zext i32 %21 to i64
  %51 = shl i64 %5, 1
  %52 = add nuw nsw i64 %50, %47
  br label %54

53:                                               ; preds = %80, %10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void

54:                                               ; preds = %45, %80
  %55 = phi i32 [ 0, %45 ], [ %81, %80 ]
  %56 = add nsw i32 %55, %12
  %57 = sext i32 %56 to i64
  %58 = icmp uge i64 %57, %6
  %59 = zext i32 %55 to i64
  %60 = add nsw i64 %59, %35
  %61 = mul i64 %60, %4
  %62 = add i64 %61, %36
  %63 = mul i64 %62, %5
  %64 = add i64 %48, %63
  %65 = mul nsw i64 %57, %34
  %66 = add i64 %65, %49
  %67 = mul i64 %51, %66
  %68 = add i64 %52, %67
  %69 = select i1 %43, i1 true, i1 %58
  br i1 %69, label %80, label %70

70:                                               ; preds = %54
  %71 = getelementptr inbounds double, double addrspace(1)* %0, i64 %64
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !16
  %73 = getelementptr inbounds double, double addrspace(1)* %1, i64 %68
  store double %72, double addrspace(1)* %73, align 8, !tbaa !16
  br i1 %39, label %74, label %80

74:                                               ; preds = %70
  %75 = add i64 %64, %5
  %76 = getelementptr inbounds double, double addrspace(1)* %0, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !16
  %78 = add i64 %68, %5
  %79 = getelementptr inbounds double, double addrspace(1)* %1, i64 %78
  store double %77, double addrspace(1)* %79, align 8, !tbaa !16
  br label %80

80:                                               ; preds = %54, %70, %74
  %81 = add nuw nsw i32 %55, 1
  %82 = icmp eq i32 %81, %9
  br i1 %82, label %53, label %54, !llvm.loop !20
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!6 = !{!7, !11, i64 16}
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
