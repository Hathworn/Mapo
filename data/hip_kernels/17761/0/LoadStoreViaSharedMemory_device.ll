; ModuleID = '../data/hip_kernels/17761/0/main.cu'
source_filename = "../data/hip_kernels/17761/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ24LoadStoreViaSharedMemoryPiS_E12SharedMemory = internal unnamed_addr addrspace(3) global [2048 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z24LoadStoreViaSharedMemoryPiS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %4 = getelementptr i8, i8 addrspace(4)* %3, i64 4
  %5 = bitcast i8 addrspace(4)* %4 to i16 addrspace(4)*
  %6 = load i16, i16 addrspace(4)* %5, align 4, !invariant.load !4
  %7 = udiv i16 2048, %6
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !5
  %10 = mul nuw nsw i32 %9, %8
  %11 = add nuw nsw i32 %10, %8
  %12 = icmp ugt i16 %6, 2048
  br i1 %12, label %21, label %13

13:                                               ; preds = %2, %13
  %14 = phi i32 [ %19, %13 ], [ %10, %2 ]
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !6, !amdgpu.noclobber !4
  %18 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ24LoadStoreViaSharedMemoryPiS_E12SharedMemory, i32 0, i32 %14
  store i32 %17, i32 addrspace(3)* %18, align 4, !tbaa !6
  %19 = add nuw nsw i32 %14, 1
  %20 = icmp ult i32 %19, %11
  br i1 %20, label %13, label %21, !llvm.loop !10

21:                                               ; preds = %13, %2
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %12, label %30, label %22

22:                                               ; preds = %21, %22
  %23 = phi i32 [ %28, %22 ], [ %10, %21 ]
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ24LoadStoreViaSharedMemoryPiS_E12SharedMemory, i32 0, i32 %23
  %26 = load i32, i32 addrspace(3)* %25, align 4, !tbaa !6
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %24
  store i32 %26, i32 addrspace(1)* %27, align 4, !tbaa !6
  %28 = add nuw nsw i32 %23, 1
  %29 = icmp ult i32 %28, %11
  br i1 %29, label %22, label %30, !llvm.loop !12

30:                                               ; preds = %22, %21
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{}
!5 = !{i32 0, i32 1024}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
