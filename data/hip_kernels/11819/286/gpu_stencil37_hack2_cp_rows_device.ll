; ModuleID = '../data/hip_kernels/11819/286/main.cu'
source_filename = "../data/hip_kernels/11819/286/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z27gpu_stencil37_hack2_cp_rowsPdS_S_S_iiiiiiiiiiii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readnone %2, double addrspace(1)* nocapture readnone %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 %15) local_unnamed_addr #0 {
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %18 = mul i32 %17, %15
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = mul i32 %19, %14
  %21 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %22 = getelementptr i8, i8 addrspace(4)* %21, i64 4
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 4, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %27 = mul i32 %26, %25
  %28 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 16
  %29 = bitcast i8 addrspace(4)* %28 to i32 addrspace(4)*
  %30 = load i32, i32 addrspace(4)* %29, align 8, !tbaa !6
  %31 = getelementptr i8, i8 addrspace(4)* %21, i64 6
  %32 = bitcast i8 addrspace(4)* %31 to i16 addrspace(4)*
  %33 = load i16, i16 addrspace(4)* %32, align 2, !range !4, !invariant.load !5
  %34 = zext i16 %33 to i32
  %35 = udiv i32 %30, %34
  %36 = mul i32 %35, %34
  %37 = icmp ugt i32 %30, %36
  %38 = zext i1 %37 to i32
  %39 = add i32 %35, %38
  %40 = add nsw i32 %20, 1
  %41 = icmp slt i32 %40, %10
  %42 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %43 = add i32 %27, %42
  %44 = icmp sge i32 %43, %11
  %45 = icmp sgt i32 %15, 0
  br i1 %45, label %46, label %48

46:                                               ; preds = %16
  %47 = shl i32 %7, 1
  br label %49

48:                                               ; preds = %76, %16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void

49:                                               ; preds = %46, %76
  %50 = phi i32 [ 0, %46 ], [ %77, %76 ]
  %51 = add i32 %50, %18
  %52 = icmp sge i32 %51, %12
  %53 = mul i32 %51, %5
  %54 = add i32 %53, %20
  %55 = mul i32 %54, %4
  %56 = add i32 %43, %55
  %57 = mul i32 %51, %39
  %58 = add i32 %57, %19
  %59 = mul i32 %47, %58
  %60 = add i32 %43, %59
  %61 = select i1 %44, i1 true, i1 %52
  br i1 %61, label %76, label %62

62:                                               ; preds = %49
  %63 = sext i32 %56 to i64
  %64 = getelementptr inbounds double, double addrspace(1)* %0, i64 %63
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !16
  %66 = sext i32 %60 to i64
  %67 = getelementptr inbounds double, double addrspace(1)* %1, i64 %66
  store double %65, double addrspace(1)* %67, align 8, !tbaa !16
  br i1 %41, label %68, label %76

68:                                               ; preds = %62
  %69 = add nsw i32 %56, %4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds double, double addrspace(1)* %0, i64 %70
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !16
  %73 = add nsw i32 %60, %7
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds double, double addrspace(1)* %1, i64 %74
  store double %72, double addrspace(1)* %75, align 8, !tbaa !16
  br label %76

76:                                               ; preds = %49, %62, %68
  %77 = add nuw nsw i32 %50, 1
  %78 = icmp eq i32 %77, %15
  br i1 %78, label %48, label %49, !llvm.loop !20
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
