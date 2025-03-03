; ModuleID = '../data/hip_kernels/591/15/main.cu'
source_filename = "../data/hip_kernels/591/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9bootstrapiiiPfPdPj(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = sub i32 %0, %12
  %14 = udiv i32 -1, %13
  %15 = mul i32 %8, %0
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = icmp sgt i32 %0, 0
  br i1 %24, label %27, label %25

25:                                               ; preds = %6
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  br label %60

27:                                               ; preds = %6
  %28 = mul i32 %23, %0
  %29 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %30 = add i32 %28, %29
  %31 = and i32 %0, 7
  %32 = icmp ult i32 %0, 8
  br i1 %32, label %35, label %33

33:                                               ; preds = %27
  %34 = and i32 %0, -8
  br label %71

35:                                               ; preds = %71, %27
  %36 = phi float [ undef, %27 ], [ %161, %71 ]
  %37 = phi float [ 0.000000e+00, %27 ], [ %161, %71 ]
  %38 = phi i32 [ 0, %27 ], [ %162, %71 ]
  %39 = icmp eq i32 %31, 0
  br i1 %39, label %57, label %40

40:                                               ; preds = %35, %40
  %41 = phi float [ %53, %40 ], [ %37, %35 ]
  %42 = phi i32 [ %54, %40 ], [ %38, %35 ]
  %43 = phi i32 [ %55, %40 ], [ 0, %35 ]
  %44 = add nsw i32 %42, %15
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = udiv i32 %47, %14
  %49 = add i32 %30, %48
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %3, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !11, !amdgpu.noclobber !5
  %53 = fadd contract float %41, %52
  %54 = add nuw nsw i32 %42, 1
  %55 = add i32 %43, 1
  %56 = icmp eq i32 %55, %31
  br i1 %56, label %57, label %40, !llvm.loop !13

57:                                               ; preds = %40, %35
  %58 = phi float [ %36, %35 ], [ %53, %40 ]
  %59 = fpext float %58 to double
  br label %60

60:                                               ; preds = %25, %57
  %61 = phi i32 [ %26, %25 ], [ %29, %57 ]
  %62 = phi double [ 0.000000e+00, %25 ], [ %59, %57 ]
  %63 = mul i32 %8, %12
  %64 = mul i32 %23, %2
  %65 = sitofp i32 %1 to double
  %66 = fdiv contract double %62, %65
  %67 = add i32 %63, %61
  %68 = add i32 %67, %64
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds double, double addrspace(1)* %4, i64 %69
  store double %66, double addrspace(1)* %70, align 8, !tbaa !15
  ret void

71:                                               ; preds = %71, %33
  %72 = phi float [ 0.000000e+00, %33 ], [ %161, %71 ]
  %73 = phi i32 [ 0, %33 ], [ %162, %71 ]
  %74 = phi i32 [ 0, %33 ], [ %163, %71 ]
  %75 = add nsw i32 %73, %15
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %76
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = udiv i32 %78, %14
  %80 = add i32 %30, %79
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %3, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !11, !amdgpu.noclobber !5
  %84 = fadd contract float %72, %83
  %85 = or i32 %73, 1
  %86 = add nsw i32 %85, %15
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %87
  %89 = load i32, i32 addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !5
  %90 = udiv i32 %89, %14
  %91 = add i32 %30, %90
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %3, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !11, !amdgpu.noclobber !5
  %95 = fadd contract float %84, %94
  %96 = or i32 %73, 2
  %97 = add nsw i32 %96, %15
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %98
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = udiv i32 %100, %14
  %102 = add i32 %30, %101
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %3, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !11, !amdgpu.noclobber !5
  %106 = fadd contract float %95, %105
  %107 = or i32 %73, 3
  %108 = add nsw i32 %107, %15
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %109
  %111 = load i32, i32 addrspace(1)* %110, align 4, !tbaa !7, !amdgpu.noclobber !5
  %112 = udiv i32 %111, %14
  %113 = add i32 %30, %112
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %3, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !11, !amdgpu.noclobber !5
  %117 = fadd contract float %106, %116
  %118 = or i32 %73, 4
  %119 = add nsw i32 %118, %15
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %120
  %122 = load i32, i32 addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !5
  %123 = udiv i32 %122, %14
  %124 = add i32 %30, %123
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %3, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !11, !amdgpu.noclobber !5
  %128 = fadd contract float %117, %127
  %129 = or i32 %73, 5
  %130 = add nsw i32 %129, %15
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %131
  %133 = load i32, i32 addrspace(1)* %132, align 4, !tbaa !7, !amdgpu.noclobber !5
  %134 = udiv i32 %133, %14
  %135 = add i32 %30, %134
  %136 = zext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %3, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !11, !amdgpu.noclobber !5
  %139 = fadd contract float %128, %138
  %140 = or i32 %73, 6
  %141 = add nsw i32 %140, %15
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %142
  %144 = load i32, i32 addrspace(1)* %143, align 4, !tbaa !7, !amdgpu.noclobber !5
  %145 = udiv i32 %144, %14
  %146 = add i32 %30, %145
  %147 = zext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %3, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !11, !amdgpu.noclobber !5
  %150 = fadd contract float %139, %149
  %151 = or i32 %73, 7
  %152 = add nsw i32 %151, %15
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %153
  %155 = load i32, i32 addrspace(1)* %154, align 4, !tbaa !7, !amdgpu.noclobber !5
  %156 = udiv i32 %155, %14
  %157 = add i32 %30, %156
  %158 = zext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %3, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !11, !amdgpu.noclobber !5
  %161 = fadd contract float %150, %160
  %162 = add nuw nsw i32 %73, 8
  %163 = add i32 %74, 8
  %164 = icmp eq i32 %163, %34
  br i1 %164, label %35, label %71, !llvm.loop !17
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = !{!16, !16, i64 0}
!16 = !{!"double", !9, i64 0}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
