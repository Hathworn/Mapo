; ModuleID = '../data/hip_kernels/11812/1/main.cu'
source_filename = "../data/hip_kernels/11812/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z34find_advection_point_location_cudaPdS_S_S_jjPjS0_S0_ddddj(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 addrspace(1)* nocapture writeonly %6, i32 addrspace(1)* nocapture writeonly %7, i32 addrspace(1)* nocapture writeonly %8, double %9, double %10, double %11, double %12, i32 %13) local_unnamed_addr #0 {
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %19 = mul i32 %15, %13
  %20 = add i32 %19, %17
  %21 = mul i32 %16, %13
  %22 = add i32 %21, %18
  %23 = mul i32 %22, %4
  %24 = add i32 %20, %23
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds double, double addrspace(1)* %2, i64 %25
  %27 = load double, double addrspace(1)* %26, align 8, !tbaa !5, !amdgpu.noclobber !9
  %28 = fcmp contract ule double %27, %9
  %29 = fcmp contract uge double %27, %10
  %30 = select i1 %28, i1 true, i1 %29
  %31 = getelementptr inbounds double, double addrspace(1)* %3, i64 %25
  %32 = load double, double addrspace(1)* %31, align 8, !tbaa !5, !amdgpu.noclobber !9
  %33 = fcmp contract ule double %32, %11
  %34 = fcmp contract uge double %32, %12
  %35 = select i1 %33, i1 true, i1 %34
  %36 = or i1 %30, %35
  br i1 %36, label %62, label %37

37:                                               ; preds = %14
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %25
  store i32 1, i32 addrspace(1)* %38, align 4, !tbaa !10
  br label %39

39:                                               ; preds = %39, %37
  %40 = phi i32 [ 0, %37 ], [ %47, %39 ]
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds double, double addrspace(1)* %0, i64 %41
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !5, !amdgpu.noclobber !9
  %44 = fcmp contract olt double %43, %27
  %45 = icmp ult i32 %40, %4
  %46 = select i1 %44, i1 %45, i1 false
  %47 = add nuw i32 %40, 1
  br i1 %46, label %39, label %48, !llvm.loop !12

48:                                               ; preds = %39
  %49 = tail call i32 @llvm.usub.sat.i32(i32 %40, i32 1)
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %25
  store i32 %49, i32 addrspace(1)* %50, align 4, !tbaa !10
  br label %51

51:                                               ; preds = %51, %48
  %52 = phi i32 [ 0, %48 ], [ %59, %51 ]
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds double, double addrspace(1)* %1, i64 %53
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !5, !amdgpu.noclobber !9
  %56 = fcmp contract olt double %55, %32
  %57 = icmp ult i32 %52, %5
  %58 = select i1 %56, i1 %57, i1 false
  %59 = add nuw i32 %52, 1
  br i1 %58, label %51, label %60, !llvm.loop !12

60:                                               ; preds = %51
  %61 = tail call i32 @llvm.usub.sat.i32(i32 %52, i32 1)
  br label %108

62:                                               ; preds = %14
  %63 = xor i1 %35, true
  %64 = or i1 %30, %63
  br i1 %64, label %84, label %65

65:                                               ; preds = %62
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %25
  store i32 2, i32 addrspace(1)* %66, align 4, !tbaa !10
  br label %67

67:                                               ; preds = %67, %65
  %68 = phi i32 [ 0, %65 ], [ %75, %67 ]
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds double, double addrspace(1)* %0, i64 %69
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !5, !amdgpu.noclobber !9
  %72 = fcmp contract olt double %71, %27
  %73 = icmp ult i32 %68, %4
  %74 = select i1 %72, i1 %73, i1 false
  %75 = add nuw i32 %68, 1
  br i1 %74, label %67, label %76, !llvm.loop !12

76:                                               ; preds = %67
  %77 = tail call i32 @llvm.usub.sat.i32(i32 %68, i32 1)
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %25
  store i32 %77, i32 addrspace(1)* %78, align 4, !tbaa !10
  %79 = fcmp contract ugt double %32, %11
  br i1 %79, label %80, label %108

80:                                               ; preds = %76
  %81 = fcmp contract ult double %32, %12
  br i1 %81, label %112, label %82

82:                                               ; preds = %80
  %83 = add i32 %5, -2
  br label %108

84:                                               ; preds = %62
  %85 = xor i1 %30, true
  %86 = or i1 %35, %85
  br i1 %86, label %106, label %87

87:                                               ; preds = %84
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %25
  store i32 3, i32 addrspace(1)* %88, align 4, !tbaa !10
  br label %89

89:                                               ; preds = %89, %87
  %90 = phi i32 [ 0, %87 ], [ %97, %89 ]
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds double, double addrspace(1)* %1, i64 %91
  %93 = load double, double addrspace(1)* %92, align 8, !tbaa !5, !amdgpu.noclobber !9
  %94 = fcmp contract olt double %93, %32
  %95 = icmp ult i32 %90, %5
  %96 = select i1 %94, i1 %95, i1 false
  %97 = add nuw i32 %90, 1
  br i1 %96, label %89, label %98, !llvm.loop !12

98:                                               ; preds = %89
  %99 = tail call i32 @llvm.usub.sat.i32(i32 %90, i32 1)
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %25
  store i32 %99, i32 addrspace(1)* %100, align 4, !tbaa !10
  %101 = fcmp contract ugt double %27, %9
  br i1 %101, label %102, label %108

102:                                              ; preds = %98
  %103 = fcmp contract ult double %27, %10
  br i1 %103, label %112, label %104

104:                                              ; preds = %102
  %105 = add i32 %4, -2
  br label %108

106:                                              ; preds = %84
  %107 = or i1 %85, %63
  br i1 %107, label %112, label %108

108:                                              ; preds = %106, %98, %76, %60, %104, %82
  %109 = phi i32 addrspace(1)* [ %7, %82 ], [ %6, %104 ], [ %7, %60 ], [ %7, %76 ], [ %6, %98 ], [ %8, %106 ]
  %110 = phi i32 [ %83, %82 ], [ %105, %104 ], [ %61, %60 ], [ 0, %76 ], [ 0, %98 ], [ 4, %106 ]
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %109, i64 %25
  store i32 %110, i32 addrspace(1)* %111, align 4, !tbaa !10
  br label %112

112:                                              ; preds = %108, %106, %80, %102
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.usub.sat.i32(i32, i32) #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !7, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
