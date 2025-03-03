; ModuleID = '../data/hip_kernels/755/0/main.cu'
source_filename = "../data/hip_kernels/755/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14calc_histogramPcPjjf(i8 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, float %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = uitofp i32 %13 to float
  %15 = fmul contract float %14, %3
  %16 = fptoui float %15 to i32
  %17 = uitofp i32 %16 to float
  %18 = fadd contract float %17, %3
  %19 = fptoui float %18 to i32
  %20 = tail call i32 @llvm.umin.i32(i32 %19, i32 %2)
  %21 = icmp ugt i32 %20, %16
  br i1 %21, label %62, label %22

22:                                               ; preds = %97, %4
  %23 = phi i32 [ 0, %4 ], [ %98, %97 ]
  %24 = phi i32 [ 0, %4 ], [ %99, %97 ]
  %25 = phi i32 [ 0, %4 ], [ %100, %97 ]
  %26 = phi i32 [ 0, %4 ], [ %101, %97 ]
  %27 = phi i32 [ 0, %4 ], [ %102, %97 ]
  %28 = phi i32 [ 0, %4 ], [ %103, %97 ]
  %29 = phi i32 [ 0, %4 ], [ %104, %97 ]
  %30 = phi i32 [ 0, %4 ], [ %105, %97 ]
  %31 = phi i32 [ 0, %4 ], [ %106, %97 ]
  %32 = phi i32 [ 0, %4 ], [ %107, %97 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %33 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = add i32 %33, %23
  store i32 %34, i32 addrspace(1)* %1, align 4, !tbaa !7
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 1
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = add i32 %36, %24
  store i32 %37, i32 addrspace(1)* %35, align 4, !tbaa !7
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 2
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = add i32 %39, %25
  store i32 %40, i32 addrspace(1)* %38, align 4, !tbaa !7
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 3
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = add i32 %42, %26
  store i32 %43, i32 addrspace(1)* %41, align 4, !tbaa !7
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 4
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = add i32 %45, %27
  store i32 %46, i32 addrspace(1)* %44, align 4, !tbaa !7
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 5
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = add i32 %48, %28
  store i32 %49, i32 addrspace(1)* %47, align 4, !tbaa !7
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 6
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = add i32 %51, %29
  store i32 %52, i32 addrspace(1)* %50, align 4, !tbaa !7
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 7
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = add i32 %54, %30
  store i32 %55, i32 addrspace(1)* %53, align 4, !tbaa !7
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 8
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !5
  %58 = add i32 %57, %31
  store i32 %58, i32 addrspace(1)* %56, align 4, !tbaa !7
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 9
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !5
  %61 = add i32 %60, %32
  store i32 %61, i32 addrspace(1)* %59, align 4, !tbaa !7
  ret void

62:                                               ; preds = %4, %97
  %63 = phi i32 [ %108, %97 ], [ %16, %4 ]
  %64 = phi i32 [ %107, %97 ], [ 0, %4 ]
  %65 = phi i32 [ %106, %97 ], [ 0, %4 ]
  %66 = phi i32 [ %105, %97 ], [ 0, %4 ]
  %67 = phi i32 [ %104, %97 ], [ 0, %4 ]
  %68 = phi i32 [ %103, %97 ], [ 0, %4 ]
  %69 = phi i32 [ %102, %97 ], [ 0, %4 ]
  %70 = phi i32 [ %101, %97 ], [ 0, %4 ]
  %71 = phi i32 [ %100, %97 ], [ 0, %4 ]
  %72 = phi i32 [ %99, %97 ], [ 0, %4 ]
  %73 = phi i32 [ %98, %97 ], [ 0, %4 ]
  %74 = zext i32 %63 to i64
  %75 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %74
  %76 = load i8, i8 addrspace(1)* %75, align 1, !tbaa !11, !amdgpu.noclobber !5
  switch i8 %76, label %97 [
    i8 48, label %77
    i8 49, label %79
    i8 50, label %81
    i8 51, label %83
    i8 52, label %85
    i8 53, label %87
    i8 54, label %89
    i8 55, label %91
    i8 56, label %93
    i8 57, label %95
  ]

77:                                               ; preds = %62
  %78 = add i32 %73, 1
  br label %97

79:                                               ; preds = %62
  %80 = add i32 %72, 1
  br label %97

81:                                               ; preds = %62
  %82 = add i32 %71, 1
  br label %97

83:                                               ; preds = %62
  %84 = add i32 %70, 1
  br label %97

85:                                               ; preds = %62
  %86 = add i32 %69, 1
  br label %97

87:                                               ; preds = %62
  %88 = add i32 %68, 1
  br label %97

89:                                               ; preds = %62
  %90 = add i32 %67, 1
  br label %97

91:                                               ; preds = %62
  %92 = add i32 %66, 1
  br label %97

93:                                               ; preds = %62
  %94 = add i32 %65, 1
  br label %97

95:                                               ; preds = %62
  %96 = add i32 %64, 1
  br label %97

97:                                               ; preds = %62, %77, %81, %85, %89, %93, %95, %91, %87, %83, %79
  %98 = phi i32 [ %78, %77 ], [ %73, %79 ], [ %73, %81 ], [ %73, %83 ], [ %73, %85 ], [ %73, %87 ], [ %73, %89 ], [ %73, %91 ], [ %73, %93 ], [ %73, %95 ], [ %73, %62 ]
  %99 = phi i32 [ %72, %77 ], [ %80, %79 ], [ %72, %81 ], [ %72, %83 ], [ %72, %85 ], [ %72, %87 ], [ %72, %89 ], [ %72, %91 ], [ %72, %93 ], [ %72, %95 ], [ %72, %62 ]
  %100 = phi i32 [ %71, %77 ], [ %71, %79 ], [ %82, %81 ], [ %71, %83 ], [ %71, %85 ], [ %71, %87 ], [ %71, %89 ], [ %71, %91 ], [ %71, %93 ], [ %71, %95 ], [ %71, %62 ]
  %101 = phi i32 [ %70, %77 ], [ %70, %79 ], [ %70, %81 ], [ %84, %83 ], [ %70, %85 ], [ %70, %87 ], [ %70, %89 ], [ %70, %91 ], [ %70, %93 ], [ %70, %95 ], [ %70, %62 ]
  %102 = phi i32 [ %69, %77 ], [ %69, %79 ], [ %69, %81 ], [ %69, %83 ], [ %86, %85 ], [ %69, %87 ], [ %69, %89 ], [ %69, %91 ], [ %69, %93 ], [ %69, %95 ], [ %69, %62 ]
  %103 = phi i32 [ %68, %77 ], [ %68, %79 ], [ %68, %81 ], [ %68, %83 ], [ %68, %85 ], [ %88, %87 ], [ %68, %89 ], [ %68, %91 ], [ %68, %93 ], [ %68, %95 ], [ %68, %62 ]
  %104 = phi i32 [ %67, %77 ], [ %67, %79 ], [ %67, %81 ], [ %67, %83 ], [ %67, %85 ], [ %67, %87 ], [ %90, %89 ], [ %67, %91 ], [ %67, %93 ], [ %67, %95 ], [ %67, %62 ]
  %105 = phi i32 [ %66, %77 ], [ %66, %79 ], [ %66, %81 ], [ %66, %83 ], [ %66, %85 ], [ %66, %87 ], [ %66, %89 ], [ %92, %91 ], [ %66, %93 ], [ %66, %95 ], [ %66, %62 ]
  %106 = phi i32 [ %65, %77 ], [ %65, %79 ], [ %65, %81 ], [ %65, %83 ], [ %65, %85 ], [ %65, %87 ], [ %65, %89 ], [ %65, %91 ], [ %94, %93 ], [ %65, %95 ], [ %65, %62 ]
  %107 = phi i32 [ %64, %77 ], [ %64, %79 ], [ %64, %81 ], [ %64, %83 ], [ %64, %85 ], [ %64, %87 ], [ %64, %89 ], [ %64, %91 ], [ %64, %93 ], [ %96, %95 ], [ %64, %62 ]
  %108 = add nuw i32 %63, 1
  %109 = icmp ult i32 %108, %20
  br i1 %109, label %62, label %22, !llvm.loop !12
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umin.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!11 = !{!9, !9, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
