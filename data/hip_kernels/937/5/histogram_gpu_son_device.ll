; ModuleID = '../data/hip_kernels/937/5/main.cu'
source_filename = "../data/hip_kernels/937/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@aa = external hidden addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17histogram_gpu_sonPhPjii(i8 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @aa, i32 0, i32 %5
  store i32 0, i32 addrspace(3)* %13, align 4, !tbaa !7
  %14 = add nuw nsw i32 %5, 256
  %15 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @aa, i32 0, i32 %14
  store i32 0, i32 addrspace(3)* %15, align 4, !tbaa !7
  %16 = add nuw nsw i32 %5, 512
  %17 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @aa, i32 0, i32 %16
  store i32 0, i32 addrspace(3)* %17, align 4, !tbaa !7
  %18 = add nuw nsw i32 %5, 768
  %19 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @aa, i32 0, i32 %18
  store i32 0, i32 addrspace(3)* %19, align 4, !tbaa !7
  %20 = or i32 %5, 1024
  %21 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @aa, i32 0, i32 %20
  store i32 0, i32 addrspace(3)* %21, align 4, !tbaa !7
  %22 = add nuw nsw i32 %5, 1280
  %23 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @aa, i32 0, i32 %22
  store i32 0, i32 addrspace(3)* %23, align 4, !tbaa !7
  %24 = add nuw nsw i32 %5, 1536
  %25 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @aa, i32 0, i32 %24
  store i32 0, i32 addrspace(3)* %25, align 4, !tbaa !7
  %26 = add nuw nsw i32 %5, 1792
  %27 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @aa, i32 0, i32 %26
  store i32 0, i32 addrspace(3)* %27, align 4, !tbaa !7
  %28 = or i32 %5, 2048
  %29 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @aa, i32 0, i32 %28
  store i32 0, i32 addrspace(3)* %29, align 4, !tbaa !7
  %30 = add nuw nsw i32 %5, 2304
  %31 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @aa, i32 0, i32 %30
  store i32 0, i32 addrspace(3)* %31, align 4, !tbaa !7
  %32 = add nuw nsw i32 %5, 2560
  %33 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @aa, i32 0, i32 %32
  store i32 0, i32 addrspace(3)* %33, align 4, !tbaa !7
  %34 = add nuw nsw i32 %5, 2816
  %35 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @aa, i32 0, i32 %34
  store i32 0, i32 addrspace(3)* %35, align 4, !tbaa !7
  %36 = or i32 %5, 3072
  %37 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @aa, i32 0, i32 %36
  store i32 0, i32 addrspace(3)* %37, align 4, !tbaa !7
  %38 = add nuw nsw i32 %5, 3328
  %39 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @aa, i32 0, i32 %38
  store i32 0, i32 addrspace(3)* %39, align 4, !tbaa !7
  %40 = add nuw nsw i32 %5, 3584
  %41 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @aa, i32 0, i32 %40
  store i32 0, i32 addrspace(3)* %41, align 4, !tbaa !7
  %42 = add nuw nsw i32 %5, 3840
  %43 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @aa, i32 0, i32 %42
  store i32 0, i32 addrspace(3)* %43, align 4, !tbaa !7
  %44 = add i32 %12, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = add nsw i32 %44, 1
  %46 = mul nsw i32 %45, %3
  %47 = tail call i32 @llvm.smin.i32(i32 %46, i32 %2)
  %48 = mul nsw i32 %44, %3
  %49 = icmp slt i32 %48, %47
  br i1 %49, label %50, label %64

50:                                               ; preds = %4
  %51 = shl nuw nsw i32 %5, 4
  %52 = and i32 %51, 16128
  br label %53

53:                                               ; preds = %50, %53
  %54 = phi i32 [ %48, %50 ], [ %62, %53 ]
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %55
  %57 = load i8, i8 addrspace(1)* %56, align 1, !tbaa !11, !amdgpu.noclobber !6
  %58 = zext i8 %57 to i32
  %59 = or i32 %52, %58
  %60 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @aa, i32 0, i32 %59
  %61 = atomicrmw add i32 addrspace(3)* %60, i32 1 syncscope("agent-one-as") monotonic, align 4
  %62 = add nsw i32 %54, 1
  %63 = icmp slt i32 %62, %47
  br i1 %63, label %53, label %64, !llvm.loop !12

64:                                               ; preds = %53, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %65 = load i32, i32 addrspace(3)* %29, align 4, !tbaa !7
  %66 = load i32, i32 addrspace(3)* %13, align 4, !tbaa !7
  %67 = add i32 %66, %65
  store i32 %67, i32 addrspace(3)* %13, align 4, !tbaa !7
  %68 = load i32, i32 addrspace(3)* %31, align 4, !tbaa !7
  %69 = load i32, i32 addrspace(3)* %15, align 4, !tbaa !7
  %70 = add i32 %69, %68
  store i32 %70, i32 addrspace(3)* %15, align 4, !tbaa !7
  %71 = load i32, i32 addrspace(3)* %33, align 4, !tbaa !7
  %72 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !7
  %73 = add i32 %72, %71
  store i32 %73, i32 addrspace(3)* %17, align 4, !tbaa !7
  %74 = load i32, i32 addrspace(3)* %35, align 4, !tbaa !7
  %75 = load i32, i32 addrspace(3)* %19, align 4, !tbaa !7
  %76 = add i32 %75, %74
  store i32 %76, i32 addrspace(3)* %19, align 4, !tbaa !7
  %77 = load i32, i32 addrspace(3)* %37, align 4, !tbaa !7
  %78 = load i32, i32 addrspace(3)* %21, align 4, !tbaa !7
  %79 = add i32 %78, %77
  store i32 %79, i32 addrspace(3)* %21, align 4, !tbaa !7
  %80 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !7
  %81 = load i32, i32 addrspace(3)* %23, align 4, !tbaa !7
  %82 = add i32 %81, %80
  store i32 %82, i32 addrspace(3)* %23, align 4, !tbaa !7
  %83 = load i32, i32 addrspace(3)* %41, align 4, !tbaa !7
  %84 = load i32, i32 addrspace(3)* %25, align 4, !tbaa !7
  %85 = add i32 %84, %83
  store i32 %85, i32 addrspace(3)* %25, align 4, !tbaa !7
  %86 = load i32, i32 addrspace(3)* %43, align 4, !tbaa !7
  %87 = load i32, i32 addrspace(3)* %27, align 4, !tbaa !7
  %88 = add i32 %87, %86
  store i32 %88, i32 addrspace(3)* %27, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %89 = load i32, i32 addrspace(3)* %21, align 4, !tbaa !7
  %90 = load i32, i32 addrspace(3)* %13, align 4, !tbaa !7
  %91 = add i32 %90, %89
  store i32 %91, i32 addrspace(3)* %13, align 4, !tbaa !7
  %92 = load i32, i32 addrspace(3)* %23, align 4, !tbaa !7
  %93 = load i32, i32 addrspace(3)* %15, align 4, !tbaa !7
  %94 = add i32 %93, %92
  store i32 %94, i32 addrspace(3)* %15, align 4, !tbaa !7
  %95 = load i32, i32 addrspace(3)* %25, align 4, !tbaa !7
  %96 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !7
  %97 = add i32 %96, %95
  store i32 %97, i32 addrspace(3)* %17, align 4, !tbaa !7
  %98 = load i32, i32 addrspace(3)* %27, align 4, !tbaa !7
  %99 = load i32, i32 addrspace(3)* %19, align 4, !tbaa !7
  %100 = add i32 %99, %98
  store i32 %100, i32 addrspace(3)* %19, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %101 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !7
  %102 = load i32, i32 addrspace(3)* %13, align 4, !tbaa !7
  %103 = add i32 %102, %101
  store i32 %103, i32 addrspace(3)* %13, align 4, !tbaa !7
  %104 = load i32, i32 addrspace(3)* %19, align 4, !tbaa !7
  %105 = load i32, i32 addrspace(3)* %15, align 4, !tbaa !7
  %106 = add i32 %105, %104
  store i32 %106, i32 addrspace(3)* %15, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %107 = load i32, i32 addrspace(3)* %15, align 4, !tbaa !7
  %108 = load i32, i32 addrspace(3)* %13, align 4, !tbaa !7
  %109 = add i32 %108, %107
  store i32 %109, i32 addrspace(3)* %13, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %110 = zext i32 %5 to i64
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %110
  %112 = load i32, i32 addrspace(3)* %13, align 4, !tbaa !7
  %113 = atomicrmw add i32 addrspace(1)* %111, i32 %112 syncscope("agent-one-as") monotonic, align 4
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!9, !9, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
