; ModuleID = '../data/hip_kernels/360/14/main.cu'
source_filename = "../data/hip_kernels/360/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24FindDesirableMergeSplitsiiiiPiS_S_S_S_(i32 %0, i32 %1, i32 %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture writeonly %7, i32 addrspace(1)* nocapture %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = icmp slt i32 %18, %0
  br i1 %19, label %20, label %86

20:                                               ; preds = %9
  %21 = sext i32 %18 to i64
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %21
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = icmp eq i32 %23, 1
  br i1 %24, label %86, label %25

25:                                               ; preds = %20
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %21
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = icmp slt i32 %27, %1
  %29 = icmp sgt i32 %27, %2
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %21
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = add nsw i32 %18, 1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = icmp slt i32 %31, %35
  br i1 %36, label %37, label %40

37:                                               ; preds = %25
  %38 = shl nsw i32 %1, 1
  %39 = shl nsw i32 %2, 1
  br label %43

40:                                               ; preds = %78, %25
  %41 = phi i32 [ -1, %25 ], [ %79, %78 ]
  %42 = icmp eq i32 %41, -1
  br i1 %42, label %83, label %84

43:                                               ; preds = %37, %78
  %44 = phi float [ 0.000000e+00, %37 ], [ %80, %78 ]
  %45 = phi i32 [ -1, %37 ], [ %79, %78 ]
  %46 = phi i32 [ %31, %37 ], [ %81, %78 ]
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !5
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = icmp eq i32 %52, 1
  br i1 %53, label %78, label %54

54:                                               ; preds = %43
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %50
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !5
  %57 = icmp slt i32 %56, %1
  %58 = icmp sgt i32 %56, %2
  %59 = select i1 %57, i1 true, i1 %58
  %60 = add nsw i32 %56, %27
  %61 = select i1 %59, i1 true, i1 %28
  %62 = select i1 %61, i1 true, i1 %29
  %63 = icmp sgt i32 %60, %38
  %64 = select i1 %62, i1 %63, i1 false
  %65 = icmp slt i32 %60, %39
  %66 = select i1 %64, i1 %65, i1 false
  br i1 %66, label %67, label %72

67:                                               ; preds = %54
  %68 = sub nsw i32 %3, %60
  %69 = tail call i32 @llvm.abs.i32(i32 %68, i1 true)
  %70 = sitofp i32 %69 to double
  %71 = fdiv contract double 1.000000e+00, %70
  br label %72

72:                                               ; preds = %54, %67
  %73 = phi contract double [ %71, %67 ], [ 0.000000e+00, %54 ]
  %74 = fptrunc double %73 to float
  %75 = fcmp contract olt float %44, %74
  %76 = select i1 %75, i32 %49, i32 %45
  %77 = select i1 %75, float %74, float %44
  br label %78

78:                                               ; preds = %72, %43
  %79 = phi i32 [ %76, %72 ], [ %45, %43 ]
  %80 = phi float [ %77, %72 ], [ %44, %43 ]
  %81 = add nsw i32 %46, 1
  %82 = icmp slt i32 %81, %35
  br i1 %82, label %43, label %40, !llvm.loop !11

83:                                               ; preds = %40
  store i32 1, i32 addrspace(1)* %22, align 4, !tbaa !7
  br label %84

84:                                               ; preds = %83, %40
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %21
  store i32 %41, i32 addrspace(1)* %85, align 4, !tbaa !7
  br label %86

86:                                               ; preds = %20, %84, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!12 = !{!"llvm.loop.mustprogress"}
