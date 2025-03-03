; ModuleID = '../data/hip_kernels/8208/1/main.cu'
source_filename = "../data/hip_kernels/8208/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9histogramPjS_jjE4hist = internal addrspace(3) global [4096 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9histogramPjS_jj(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ9histogramPjS_jjE4hist, i32 0, i32 %11
  store i32 0, i32 addrspace(3)* %12, align 4, !tbaa !7
  %13 = add nuw nsw i32 %11, %9
  %14 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ9histogramPjS_jjE4hist, i32 0, i32 %13
  store i32 0, i32 addrspace(3)* %14, align 4, !tbaa !7
  %15 = shl nuw nsw i32 %9, 1
  %16 = add nuw nsw i32 %15, %11
  %17 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ9histogramPjS_jjE4hist, i32 0, i32 %16
  store i32 0, i32 addrspace(3)* %17, align 4, !tbaa !7
  %18 = mul nuw nsw i32 %9, 3
  %19 = add nuw nsw i32 %18, %11
  %20 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ9histogramPjS_jjE4hist, i32 0, i32 %19
  store i32 0, i32 addrspace(3)* %20, align 4, !tbaa !7
  %21 = shl nuw nsw i32 %9, 2
  %22 = add nuw nsw i32 %21, %11
  %23 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ9histogramPjS_jjE4hist, i32 0, i32 %22
  store i32 0, i32 addrspace(3)* %23, align 4, !tbaa !7
  %24 = mul nuw nsw i32 %9, 5
  %25 = add nuw nsw i32 %24, %11
  %26 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ9histogramPjS_jjE4hist, i32 0, i32 %25
  store i32 0, i32 addrspace(3)* %26, align 4, !tbaa !7
  %27 = mul nuw nsw i32 %9, 6
  %28 = add nuw nsw i32 %27, %11
  %29 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ9histogramPjS_jjE4hist, i32 0, i32 %28
  store i32 0, i32 addrspace(3)* %29, align 4, !tbaa !7
  %30 = mul nuw nsw i32 %9, 7
  %31 = add nuw nsw i32 %30, %11
  %32 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ9histogramPjS_jjE4hist, i32 0, i32 %31
  store i32 0, i32 addrspace(3)* %32, align 4, !tbaa !7
  %33 = mul i32 %10, %9
  %34 = add i32 %33, %11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %35 = icmp ult i32 %34, %2
  br i1 %35, label %36, label %42

36:                                               ; preds = %4
  %37 = sext i32 %34 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ9histogramPjS_jjE4hist, i32 0, i32 %39
  %41 = atomicrmw add i32 addrspace(3)* %40, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %42

42:                                               ; preds = %36, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = zext i32 %11 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %43
  %45 = load i32, i32 addrspace(3)* %12, align 4, !tbaa !7
  %46 = atomicrmw add i32 addrspace(1)* %44, i32 %45 syncscope("agent-one-as") monotonic, align 4
  %47 = zext i32 %13 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %47
  %49 = load i32, i32 addrspace(3)* %14, align 4, !tbaa !7
  %50 = atomicrmw add i32 addrspace(1)* %48, i32 %49 syncscope("agent-one-as") monotonic, align 4
  %51 = zext i32 %16 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %51
  %53 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !7
  %54 = atomicrmw add i32 addrspace(1)* %52, i32 %53 syncscope("agent-one-as") monotonic, align 4
  %55 = zext i32 %19 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %55
  %57 = load i32, i32 addrspace(3)* %20, align 4, !tbaa !7
  %58 = atomicrmw add i32 addrspace(1)* %56, i32 %57 syncscope("agent-one-as") monotonic, align 4
  %59 = zext i32 %22 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %59
  %61 = load i32, i32 addrspace(3)* %23, align 4, !tbaa !7
  %62 = atomicrmw add i32 addrspace(1)* %60, i32 %61 syncscope("agent-one-as") monotonic, align 4
  %63 = zext i32 %25 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %63
  %65 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !7
  %66 = atomicrmw add i32 addrspace(1)* %64, i32 %65 syncscope("agent-one-as") monotonic, align 4
  %67 = zext i32 %28 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %67
  %69 = load i32, i32 addrspace(3)* %29, align 4, !tbaa !7
  %70 = atomicrmw add i32 addrspace(1)* %68, i32 %69 syncscope("agent-one-as") monotonic, align 4
  %71 = zext i32 %31 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %71
  %73 = load i32, i32 addrspace(3)* %32, align 4, !tbaa !7
  %74 = atomicrmw add i32 addrspace(1)* %72, i32 %73 syncscope("agent-one-as") monotonic, align 4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
