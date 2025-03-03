; ModuleID = '../data/hip_kernels/640/4/main.cu'
source_filename = "../data/hip_kernels/640/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@min_Idx = external hidden addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7scatterPjS_S_S_jS_jjj(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 %4, i32 addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = icmp ult i32 %10, %8
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  br i1 %11, label %13, label %18

13:                                               ; preds = %9
  %14 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  br label %30

18:                                               ; preds = %30, %9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %25 = bitcast i8 addrspace(4)* %24 to i32 addrspace(4)*
  %26 = load i32, i32 addrspace(4)* %25, align 4, !tbaa !7
  %27 = mul i32 %19, %23
  %28 = add i32 %27, %10
  %29 = icmp ult i32 %28, %4
  br i1 %29, label %35, label %43

30:                                               ; preds = %13, %30
  %31 = phi i32 [ %10, %13 ], [ %33, %30 ]
  %32 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @min_Idx, i32 0, i32 %31
  store i32 %4, i32 addrspace(3)* %32, align 4, !tbaa !16
  %33 = add i32 %31, %17
  %34 = icmp ult i32 %33, %8
  br i1 %34, label %30, label %18, !llvm.loop !20

35:                                               ; preds = %18
  %36 = sext i32 %28 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !16, !amdgpu.noclobber !6
  %39 = lshr i32 %38, %7
  %40 = and i32 %39, %6
  %41 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @min_Idx, i32 0, i32 %40
  %42 = atomicrmw umin i32 addrspace(3)* %41, i32 %28 syncscope("agent-one-as") monotonic, align 4
  br label %43

43:                                               ; preds = %35, %18
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %29, label %44, label %73

44:                                               ; preds = %43
  %45 = sext i32 %28 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !16, !amdgpu.noclobber !6
  %48 = lshr i32 %47, %7
  %49 = and i32 %48, %6
  %50 = udiv i32 %26, %23
  %51 = mul i32 %50, %23
  %52 = icmp ugt i32 %26, %51
  %53 = zext i1 %52 to i32
  %54 = add i32 %50, %53
  %55 = mul i32 %54, %49
  %56 = add i32 %55, %19
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %57
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !16, !amdgpu.noclobber !6
  %60 = add i32 %59, %28
  %61 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @min_Idx, i32 0, i32 %49
  %62 = load i32, i32 addrspace(3)* %61, align 4, !tbaa !16
  %63 = sub i32 %60, %62
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %64
  store i32 %47, i32 addrspace(1)* %65, align 4, !tbaa !16
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %45
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !16
  %68 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !16
  %69 = sub i32 %28, %62
  %70 = add i32 %69, %68
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %71
  store i32 %67, i32 addrspace(1)* %72, align 4, !tbaa !16
  br label %73

73:                                               ; preds = %44, %43
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
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
