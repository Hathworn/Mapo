; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/6426/18/horizOrKernel.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/6426/18/horizOrKernel.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13horizOrKernelPKjPjjj(i32 addrspace(1)* noalias nocapture readonly %0, i32 addrspace(1)* noalias nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = mul i32 %13, %2
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  %17 = icmp ult i32 %13, %3
  br i1 %17, label %18, label %91

18:                                               ; preds = %4
  %19 = icmp eq i32 %2, 0
  br i1 %19, label %41, label %20

20:                                               ; preds = %18
  %21 = and i32 %2, 7
  %22 = icmp ult i32 %2, 8
  br i1 %22, label %25, label %23

23:                                               ; preds = %20
  %24 = and i32 %2, -8
  br label %45

25:                                               ; preds = %45, %20
  %26 = phi i32 [ undef, %20 ], [ %87, %45 ]
  %27 = phi i32 [ 0, %20 ], [ %88, %45 ]
  %28 = phi i32 [ 0, %20 ], [ %87, %45 ]
  %29 = icmp eq i32 %21, 0
  br i1 %29, label %41, label %30

30:                                               ; preds = %25, %30
  %31 = phi i32 [ %38, %30 ], [ %27, %25 ]
  %32 = phi i32 [ %37, %30 ], [ %28, %25 ]
  %33 = phi i32 [ %39, %30 ], [ 0, %25 ]
  %34 = zext i32 %31 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = or i32 %36, %32
  %38 = add nuw i32 %31, 1
  %39 = add i32 %33, 1
  %40 = icmp eq i32 %39, %21
  br i1 %40, label %41, label %30, !llvm.loop !11

41:                                               ; preds = %25, %30, %18
  %42 = phi i32 [ 0, %18 ], [ %26, %25 ], [ %37, %30 ]
  %43 = zext i32 %13 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %43
  store i32 %42, i32 addrspace(1)* %44, align 4, !tbaa !7
  br label %91

45:                                               ; preds = %45, %23
  %46 = phi i32 [ 0, %23 ], [ %88, %45 ]
  %47 = phi i32 [ 0, %23 ], [ %87, %45 ]
  %48 = phi i32 [ 0, %23 ], [ %89, %45 ]
  %49 = zext i32 %46 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %49
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = or i32 %51, %47
  %53 = or i32 %46, 1
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !5
  %57 = or i32 %56, %52
  %58 = or i32 %46, 2
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %62 = or i32 %61, %57
  %63 = or i32 %46, 3
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %64
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !5
  %67 = or i32 %66, %62
  %68 = or i32 %46, 4
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !5
  %72 = or i32 %71, %67
  %73 = or i32 %46, 5
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !5
  %77 = or i32 %76, %72
  %78 = or i32 %46, 6
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !5
  %82 = or i32 %81, %77
  %83 = or i32 %46, 7
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %84
  %86 = load i32, i32 addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !5
  %87 = or i32 %86, %82
  %88 = add nuw i32 %46, 8
  %89 = add i32 %48, 8
  %90 = icmp eq i32 %89, %24
  br i1 %90, label %25, label %45, !llvm.loop !13

91:                                               ; preds = %41, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
