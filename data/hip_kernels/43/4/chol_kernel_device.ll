; ModuleID = '../data/hip_kernels/43/4/main.cu'
source_filename = "../data/hip_kernels/43/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11chol_kernelPfi(float addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %3, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = icmp eq i32 %11, 0
  %13 = mul i32 %11, %1
  %14 = add i32 %11, 1
  %15 = mul i32 %14, %1
  br label %16

16:                                               ; preds = %2, %94
  %17 = phi i32 [ %15, %2 ], [ %19, %94 ]
  %18 = phi i32 [ 0, %2 ], [ %62, %94 ]
  %19 = add i32 %17, 1
  br i1 %12, label %22, label %20

20:                                               ; preds = %16
  %21 = add nuw nsw i32 %18, 1
  br label %61

22:                                               ; preds = %16
  %23 = shl nuw nsw i32 %18, 11
  %24 = mul nuw nsw i32 %18, 2049
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7
  %28 = fcmp olt float %27, 0x39F0000000000000
  %29 = select i1 %28, float 0x41F0000000000000, float 1.000000e+00
  %30 = fmul float %27, %29
  %31 = tail call float @llvm.sqrt.f32(float %30)
  %32 = bitcast float %31 to i32
  %33 = add nsw i32 %32, -1
  %34 = bitcast i32 %33 to float
  %35 = add nsw i32 %32, 1
  %36 = bitcast i32 %35 to float
  %37 = tail call i1 @llvm.amdgcn.class.f32(float %30, i32 608)
  %38 = select i1 %28, float 0x3EF0000000000000, float 1.000000e+00
  %39 = fneg float %36
  %40 = tail call float @llvm.fma.f32(float %39, float %31, float %30)
  %41 = fcmp ogt float %40, 0.000000e+00
  %42 = fneg float %34
  %43 = tail call float @llvm.fma.f32(float %42, float %31, float %30)
  %44 = fcmp ole float %43, 0.000000e+00
  %45 = select i1 %44, float %34, float %31
  %46 = select i1 %41, float %36, float %45
  %47 = fmul float %38, %46
  %48 = select i1 %37, float %30, float %47
  store float %48, float addrspace(1)* %26, align 4, !tbaa !7
  %49 = add nuw nsw i32 %18, 1
  %50 = icmp ult i32 %18, 2047
  br i1 %50, label %51, label %61

51:                                               ; preds = %22, %51
  %52 = phi i32 [ %59, %51 ], [ %49, %22 ]
  %53 = load float, float addrspace(1)* %26, align 4, !tbaa !7
  %54 = add nuw nsw i32 %52, %23
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7
  %58 = fdiv contract float %57, %53
  store float %58, float addrspace(1)* %56, align 4, !tbaa !7
  %59 = add nuw nsw i32 %52, 1
  %60 = icmp ult i32 %52, 2047
  br i1 %60, label %51, label %61, !llvm.loop !11

61:                                               ; preds = %51, %20, %22
  %62 = phi i32 [ %21, %20 ], [ %49, %22 ], [ %49, %51 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %63 = add i32 %62, %13
  %64 = add nsw i32 %63, %1
  %65 = icmp ult i32 %63, %64
  br i1 %65, label %66, label %94

66:                                               ; preds = %61
  %67 = shl i32 %18, 11
  br label %68

68:                                               ; preds = %66, %91
  %69 = phi i32 [ %63, %66 ], [ %92, %91 ]
  %70 = icmp ult i32 %69, 2048
  br i1 %70, label %71, label %91

71:                                               ; preds = %68
  %72 = add i32 %69, %67
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = shl nuw nsw i32 %69, 11
  br label %76

76:                                               ; preds = %71, %76
  %77 = phi i32 [ %69, %71 ], [ %89, %76 ]
  %78 = load float, float addrspace(1)* %74, align 4, !tbaa !7
  %79 = add nuw i32 %77, %67
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = fmul contract float %78, %82
  %84 = add nuw i32 %77, %75
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7
  %88 = fsub contract float %87, %83
  store float %88, float addrspace(1)* %86, align 4, !tbaa !7
  %89 = add nuw nsw i32 %77, 1
  %90 = icmp ult i32 %77, 2047
  br i1 %90, label %76, label %91, !llvm.loop !13

91:                                               ; preds = %76, %68
  %92 = add i32 %69, 1
  %93 = icmp eq i32 %69, %17
  br i1 %93, label %94, label %68, !llvm.loop !14

94:                                               ; preds = %91, %61
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %95 = icmp eq i32 %62, 2048
  br i1 %95, label %96, label %16, !llvm.loop !15

96:                                               ; preds = %94
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %97 = add nsw i32 %13, %1
  %98 = icmp ult i32 %13, %97
  br i1 %98, label %99, label %165

99:                                               ; preds = %96
  %100 = add i32 %13, -1
  br label %101

101:                                              ; preds = %99, %161
  %102 = phi i32 [ 0, %99 ], [ %164, %161 ]
  %103 = phi i32 [ %13, %99 ], [ %162, %161 ]
  %104 = icmp eq i32 %103, 0
  br i1 %104, label %161, label %105

105:                                              ; preds = %101
  %106 = add i32 %100, %102
  %107 = shl i32 %103, 11
  %108 = and i32 %103, 7
  %109 = icmp ult i32 %106, 7
  br i1 %109, label %149, label %110

110:                                              ; preds = %105
  %111 = and i32 %103, -8
  br label %112

112:                                              ; preds = %112, %110
  %113 = phi i32 [ 0, %110 ], [ %146, %112 ]
  %114 = phi i32 [ 0, %110 ], [ %147, %112 ]
  %115 = add i32 %113, %107
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  store float 0.000000e+00, float addrspace(1)* %117, align 4, !tbaa !7
  %118 = or i32 %113, 1
  %119 = add i32 %118, %107
  %120 = zext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %0, i64 %120
  store float 0.000000e+00, float addrspace(1)* %121, align 4, !tbaa !7
  %122 = or i32 %113, 2
  %123 = add i32 %122, %107
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 %124
  store float 0.000000e+00, float addrspace(1)* %125, align 4, !tbaa !7
  %126 = or i32 %113, 3
  %127 = add i32 %126, %107
  %128 = zext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %0, i64 %128
  store float 0.000000e+00, float addrspace(1)* %129, align 4, !tbaa !7
  %130 = or i32 %113, 4
  %131 = add i32 %130, %107
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %0, i64 %132
  store float 0.000000e+00, float addrspace(1)* %133, align 4, !tbaa !7
  %134 = or i32 %113, 5
  %135 = add i32 %134, %107
  %136 = zext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %0, i64 %136
  store float 0.000000e+00, float addrspace(1)* %137, align 4, !tbaa !7
  %138 = or i32 %113, 6
  %139 = add i32 %138, %107
  %140 = zext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %0, i64 %140
  store float 0.000000e+00, float addrspace(1)* %141, align 4, !tbaa !7
  %142 = or i32 %113, 7
  %143 = add i32 %142, %107
  %144 = zext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %0, i64 %144
  store float 0.000000e+00, float addrspace(1)* %145, align 4, !tbaa !7
  %146 = add nuw i32 %113, 8
  %147 = add i32 %114, 8
  %148 = icmp eq i32 %147, %111
  br i1 %148, label %149, label %112, !llvm.loop !16

149:                                              ; preds = %112, %105
  %150 = phi i32 [ 0, %105 ], [ %146, %112 ]
  %151 = icmp eq i32 %108, 0
  br i1 %151, label %161, label %152

152:                                              ; preds = %149, %152
  %153 = phi i32 [ %158, %152 ], [ %150, %149 ]
  %154 = phi i32 [ %159, %152 ], [ 0, %149 ]
  %155 = add i32 %153, %107
  %156 = zext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %0, i64 %156
  store float 0.000000e+00, float addrspace(1)* %157, align 4, !tbaa !7
  %158 = add nuw i32 %153, 1
  %159 = add i32 %154, 1
  %160 = icmp eq i32 %159, %108
  br i1 %160, label %161, label %152, !llvm.loop !17

161:                                              ; preds = %149, %152, %101
  %162 = add nuw i32 %103, 1
  %163 = icmp eq i32 %162, %15
  %164 = add i32 %102, 1
  br i1 %163, label %165, label %101, !llvm.loop !19

165:                                              ; preds = %161, %96
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.unroll.disable"}
!19 = distinct !{!19, !12}
