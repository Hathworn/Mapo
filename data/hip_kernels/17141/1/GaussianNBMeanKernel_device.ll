; ModuleID = '../data/hip_kernels/17141/1/main.cu'
source_filename = "../data/hip_kernels/17141/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20GaussianNBMeanKernelPfPiS_jjj(float addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add i32 %14, %7
  %16 = icmp ult i32 %15, %5
  %17 = icmp ne i32 %4, 0
  %18 = select i1 %16, i1 %17, i1 false
  br i1 %18, label %19, label %147

19:                                               ; preds = %6
  %20 = icmp eq i32 %15, 0
  %21 = uitofp i32 %3 to float
  br i1 %20, label %27, label %22

22:                                               ; preds = %19
  %23 = and i32 %4, 3
  %24 = icmp ult i32 %4, 4
  br i1 %24, label %128, label %25

25:                                               ; preds = %22
  %26 = and i32 %4, -4
  br label %32

27:                                               ; preds = %19
  %28 = and i32 %4, 1
  %29 = icmp eq i32 %4, 1
  br i1 %29, label %112, label %30

30:                                               ; preds = %27
  %31 = and i32 %4, -2
  br label %81

32:                                               ; preds = %32, %25
  %33 = phi i32 [ 0, %25 ], [ %78, %32 ]
  %34 = phi i32 [ 0, %25 ], [ %79, %32 ]
  %35 = zext i32 %33 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !6
  %38 = sitofp i32 %37 to float
  %39 = mul i32 %33, %5
  %40 = add i32 %39, %15
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !11
  %44 = fdiv contract float %43, %38
  store float %44, float addrspace(1)* %42, align 4, !tbaa !11
  %45 = or i32 %33, 1
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !6
  %49 = sitofp i32 %48 to float
  %50 = mul i32 %45, %5
  %51 = add i32 %50, %15
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !11
  %55 = fdiv contract float %54, %49
  store float %55, float addrspace(1)* %53, align 4, !tbaa !11
  %56 = or i32 %33, 2
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %57
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !6
  %60 = sitofp i32 %59 to float
  %61 = mul i32 %56, %5
  %62 = add i32 %61, %15
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !11
  %66 = fdiv contract float %65, %60
  store float %66, float addrspace(1)* %64, align 4, !tbaa !11
  %67 = or i32 %33, 3
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !6
  %71 = sitofp i32 %70 to float
  %72 = mul i32 %67, %5
  %73 = add i32 %72, %15
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !11
  %77 = fdiv contract float %76, %71
  store float %77, float addrspace(1)* %75, align 4, !tbaa !11
  %78 = add nuw i32 %33, 4
  %79 = add i32 %34, 4
  %80 = icmp eq i32 %79, %26
  br i1 %80, label %128, label %32, !llvm.loop !13

81:                                               ; preds = %81, %30
  %82 = phi i32 [ 0, %30 ], [ %109, %81 ]
  %83 = phi i32 [ 0, %30 ], [ %110, %81 ]
  %84 = zext i32 %82 to i64
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %84
  %86 = load i32, i32 addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !6
  %87 = sitofp i32 %86 to float
  %88 = mul i32 %82, %5
  %89 = add i32 %88, %15
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !11
  %93 = fdiv contract float %92, %87
  store float %93, float addrspace(1)* %91, align 4, !tbaa !11
  %94 = fdiv contract float %87, %21
  %95 = getelementptr inbounds float, float addrspace(1)* %2, i64 %84
  store float %94, float addrspace(1)* %95, align 4, !tbaa !11
  %96 = or i32 %82, 1
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %97
  %99 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !7, !amdgpu.noclobber !6
  %100 = sitofp i32 %99 to float
  %101 = mul i32 %96, %5
  %102 = add i32 %101, %15
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !11
  %106 = fdiv contract float %105, %100
  store float %106, float addrspace(1)* %104, align 4, !tbaa !11
  %107 = fdiv contract float %100, %21
  %108 = getelementptr inbounds float, float addrspace(1)* %2, i64 %97
  store float %107, float addrspace(1)* %108, align 4, !tbaa !11
  %109 = add nuw i32 %82, 2
  %110 = add i32 %83, 2
  %111 = icmp eq i32 %110, %31
  br i1 %111, label %112, label %81, !llvm.loop !13

112:                                              ; preds = %81, %27
  %113 = phi i32 [ 0, %27 ], [ %109, %81 ]
  %114 = icmp eq i32 %28, 0
  br i1 %114, label %147, label %115

115:                                              ; preds = %112
  %116 = zext i32 %113 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %116
  %118 = load i32, i32 addrspace(1)* %117, align 4, !tbaa !7, !amdgpu.noclobber !6
  %119 = sitofp i32 %118 to float
  %120 = mul i32 %113, %5
  %121 = add i32 %120, %15
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %0, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !11
  %125 = fdiv contract float %124, %119
  store float %125, float addrspace(1)* %123, align 4, !tbaa !11
  %126 = fdiv contract float %119, %21
  %127 = getelementptr inbounds float, float addrspace(1)* %2, i64 %116
  store float %126, float addrspace(1)* %127, align 4, !tbaa !11
  br label %147

128:                                              ; preds = %32, %22
  %129 = phi i32 [ 0, %22 ], [ %78, %32 ]
  %130 = icmp eq i32 %23, 0
  br i1 %130, label %147, label %131

131:                                              ; preds = %128, %131
  %132 = phi i32 [ %144, %131 ], [ %129, %128 ]
  %133 = phi i32 [ %145, %131 ], [ 0, %128 ]
  %134 = zext i32 %132 to i64
  %135 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %134
  %136 = load i32, i32 addrspace(1)* %135, align 4, !tbaa !7, !amdgpu.noclobber !6
  %137 = sitofp i32 %136 to float
  %138 = mul i32 %132, %5
  %139 = add i32 %138, %15
  %140 = zext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %0, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !11
  %143 = fdiv contract float %142, %137
  store float %143, float addrspace(1)* %141, align 4, !tbaa !11
  %144 = add nuw i32 %132, 1
  %145 = add i32 %133, 1
  %146 = icmp eq i32 %145, %23
  br i1 %146, label %147, label %131, !llvm.loop !15

147:                                              ; preds = %112, %115, %131, %128, %6
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
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
