; ModuleID = '../data/hip_kernels/977/6/main.cu'
source_filename = "../data/hip_kernels/977/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7reduce6PiS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 9
  %7 = add i32 %6, %4
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !5
  %12 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !14, !invariant.load !15
  %15 = zext i16 %14 to i32
  %16 = udiv i32 %11, %15
  %17 = mul i32 %16, %15
  %18 = icmp ugt i32 %11, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = shl i32 %20, 9
  %22 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %4
  store i32 0, i32 addrspace(3)* %22, align 4, !tbaa !16
  %23 = icmp ult i32 %7, %2
  br i1 %23, label %24, label %39

24:                                               ; preds = %3, %24
  %25 = phi i32 [ %35, %24 ], [ 0, %3 ]
  %26 = phi i32 [ %36, %24 ], [ %7, %3 ]
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !16, !amdgpu.noclobber !15
  %30 = add i32 %26, 256
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !16, !amdgpu.noclobber !15
  %34 = add nsw i32 %33, %29
  %35 = add nsw i32 %34, %25
  %36 = add i32 %26, %21
  %37 = icmp ult i32 %36, %2
  br i1 %37, label %24, label %38, !llvm.loop !20

38:                                               ; preds = %24
  store i32 %35, i32 addrspace(3)* %22, align 4, !tbaa !16
  br label %39

39:                                               ; preds = %38, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %40 = icmp ult i32 %4, 128
  br i1 %40, label %41, label %47

41:                                               ; preds = %39
  %42 = add nuw nsw i32 %4, 128
  %43 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %42
  %44 = load i32, i32 addrspace(3)* %43, align 4, !tbaa !16
  %45 = load i32, i32 addrspace(3)* %22, align 4, !tbaa !16
  %46 = add nsw i32 %45, %44
  store i32 %46, i32 addrspace(3)* %22, align 4, !tbaa !16
  br label %47

47:                                               ; preds = %41, %39
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %48 = icmp ult i32 %4, 64
  br i1 %48, label %49, label %55

49:                                               ; preds = %47
  %50 = add nuw nsw i32 %4, 64
  %51 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %50
  %52 = load i32, i32 addrspace(3)* %51, align 4, !tbaa !16
  %53 = load i32, i32 addrspace(3)* %22, align 4, !tbaa !16
  %54 = add nsw i32 %53, %52
  store i32 %54, i32 addrspace(3)* %22, align 4, !tbaa !16
  br label %55

55:                                               ; preds = %49, %47
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %56 = icmp ult i32 %4, 32
  br i1 %56, label %57, label %95

57:                                               ; preds = %55
  %58 = add nuw nsw i32 %4, 32
  %59 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %58
  %60 = addrspacecast i32 addrspace(3)* %59 to i32*
  %61 = load volatile i32, i32* %60, align 4, !tbaa !16
  %62 = addrspacecast i32 addrspace(3)* %22 to i32*
  %63 = load volatile i32, i32* %62, align 4, !tbaa !16
  %64 = add nsw i32 %63, %61
  store volatile i32 %64, i32* %62, align 4, !tbaa !16
  %65 = add nuw nsw i32 %4, 16
  %66 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %65
  %67 = addrspacecast i32 addrspace(3)* %66 to i32*
  %68 = load volatile i32, i32* %67, align 4, !tbaa !16
  %69 = load volatile i32, i32* %62, align 4, !tbaa !16
  %70 = add nsw i32 %69, %68
  store volatile i32 %70, i32* %62, align 4, !tbaa !16
  %71 = add nuw nsw i32 %4, 8
  %72 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %71
  %73 = addrspacecast i32 addrspace(3)* %72 to i32*
  %74 = load volatile i32, i32* %73, align 4, !tbaa !16
  %75 = load volatile i32, i32* %62, align 4, !tbaa !16
  %76 = add nsw i32 %75, %74
  store volatile i32 %76, i32* %62, align 4, !tbaa !16
  %77 = add nuw nsw i32 %4, 4
  %78 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %77
  %79 = addrspacecast i32 addrspace(3)* %78 to i32*
  %80 = load volatile i32, i32* %79, align 4, !tbaa !16
  %81 = load volatile i32, i32* %62, align 4, !tbaa !16
  %82 = add nsw i32 %81, %80
  store volatile i32 %82, i32* %62, align 4, !tbaa !16
  %83 = add nuw nsw i32 %4, 2
  %84 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %83
  %85 = addrspacecast i32 addrspace(3)* %84 to i32*
  %86 = load volatile i32, i32* %85, align 4, !tbaa !16
  %87 = load volatile i32, i32* %62, align 4, !tbaa !16
  %88 = add nsw i32 %87, %86
  store volatile i32 %88, i32* %62, align 4, !tbaa !16
  %89 = add nuw nsw i32 %4, 1
  %90 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %89
  %91 = addrspacecast i32 addrspace(3)* %90 to i32*
  %92 = load volatile i32, i32* %91, align 4, !tbaa !16
  %93 = load volatile i32, i32* %62, align 4, !tbaa !16
  %94 = add nsw i32 %93, %92
  store volatile i32 %94, i32* %62, align 4, !tbaa !16
  br label %95

95:                                               ; preds = %57, %55
  %96 = icmp eq i32 %4, 0
  br i1 %96, label %97, label %101

97:                                               ; preds = %95
  %98 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 0), align 4, !tbaa !16
  %99 = zext i32 %5 to i64
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %99
  store i32 %98, i32 addrspace(1)* %100, align 4, !tbaa !16
  br label %101

101:                                              ; preds = %97, %95
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
