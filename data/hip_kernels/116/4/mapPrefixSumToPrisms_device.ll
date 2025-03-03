; ModuleID = '../data/hip_kernels/116/4/main.cu'
source_filename = "../data/hip_kernels/116/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20mapPrefixSumToPrismsjjjPKjS0_PjS1_(i32 %0, i32 %1, i32 %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture writeonly %5, i32 addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = add i32 %15, %8
  %17 = mul i32 %2, %0
  %18 = icmp ult i32 %16, %17
  br i1 %18, label %19, label %94

19:                                               ; preds = %7
  %20 = sext i32 %16 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %20
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !6
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %20
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !6
  %25 = freeze i32 %16
  %26 = freeze i32 %0
  %27 = udiv i32 %25, %26
  %28 = mul i32 %27, %26
  %29 = sub i32 %25, %28
  %30 = icmp eq i32 %22, 0
  br i1 %30, label %94, label %31

31:                                               ; preds = %19
  %32 = and i32 %22, 7
  %33 = icmp ult i32 %22, 8
  br i1 %33, label %81, label %34

34:                                               ; preds = %31
  %35 = and i32 %22, -8
  br label %36

36:                                               ; preds = %36, %34
  %37 = phi i32 [ 0, %34 ], [ %78, %36 ]
  %38 = phi i32 [ 0, %34 ], [ %79, %36 ]
  %39 = add i32 %37, %24
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %40
  store i32 %29, i32 addrspace(1)* %41, align 4, !tbaa !7
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %40
  store i32 %27, i32 addrspace(1)* %42, align 4, !tbaa !7
  %43 = or i32 %37, 1
  %44 = add i32 %43, %24
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %45
  store i32 %29, i32 addrspace(1)* %46, align 4, !tbaa !7
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %45
  store i32 %27, i32 addrspace(1)* %47, align 4, !tbaa !7
  %48 = or i32 %37, 2
  %49 = add i32 %48, %24
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %50
  store i32 %29, i32 addrspace(1)* %51, align 4, !tbaa !7
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %50
  store i32 %27, i32 addrspace(1)* %52, align 4, !tbaa !7
  %53 = or i32 %37, 3
  %54 = add i32 %53, %24
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %55
  store i32 %29, i32 addrspace(1)* %56, align 4, !tbaa !7
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %55
  store i32 %27, i32 addrspace(1)* %57, align 4, !tbaa !7
  %58 = or i32 %37, 4
  %59 = add i32 %58, %24
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %60
  store i32 %29, i32 addrspace(1)* %61, align 4, !tbaa !7
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %60
  store i32 %27, i32 addrspace(1)* %62, align 4, !tbaa !7
  %63 = or i32 %37, 5
  %64 = add i32 %63, %24
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %65
  store i32 %29, i32 addrspace(1)* %66, align 4, !tbaa !7
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %65
  store i32 %27, i32 addrspace(1)* %67, align 4, !tbaa !7
  %68 = or i32 %37, 6
  %69 = add i32 %68, %24
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %70
  store i32 %29, i32 addrspace(1)* %71, align 4, !tbaa !7
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %70
  store i32 %27, i32 addrspace(1)* %72, align 4, !tbaa !7
  %73 = or i32 %37, 7
  %74 = add i32 %73, %24
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %75
  store i32 %29, i32 addrspace(1)* %76, align 4, !tbaa !7
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %75
  store i32 %27, i32 addrspace(1)* %77, align 4, !tbaa !7
  %78 = add nuw i32 %37, 8
  %79 = add i32 %38, 8
  %80 = icmp eq i32 %79, %35
  br i1 %80, label %81, label %36, !llvm.loop !11

81:                                               ; preds = %36, %31
  %82 = phi i32 [ 0, %31 ], [ %78, %36 ]
  %83 = icmp eq i32 %32, 0
  br i1 %83, label %94, label %84

84:                                               ; preds = %81, %84
  %85 = phi i32 [ %91, %84 ], [ %82, %81 ]
  %86 = phi i32 [ %92, %84 ], [ 0, %81 ]
  %87 = add i32 %85, %24
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %88
  store i32 %29, i32 addrspace(1)* %89, align 4, !tbaa !7
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %88
  store i32 %27, i32 addrspace(1)* %90, align 4, !tbaa !7
  %91 = add nuw i32 %85, 1
  %92 = add i32 %86, 1
  %93 = icmp eq i32 %92, %32
  br i1 %93, label %94, label %84, !llvm.loop !13

94:                                               ; preds = %81, %84, %19, %7
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
