; ModuleID = '../data/hip_kernels/199/17/main.cu'
source_filename = "../data/hip_kernels/199/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10bootstrap3iiiPfPdPj(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = sext i32 %0 to i64
  %8 = sdiv i64 4294967295, %7
  %9 = trunc i64 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = mul i32 %12, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %25 = add i32 %23, %24
  %26 = mul i32 %25, %0
  %27 = icmp sgt i32 %0, 0
  %28 = add i32 %17, %10
  br i1 %27, label %29, label %59

29:                                               ; preds = %6
  %30 = mul nsw i32 %28, %0
  %31 = and i32 %0, 7
  %32 = icmp ult i32 %0, 8
  br i1 %32, label %35, label %33

33:                                               ; preds = %29
  %34 = and i32 %0, -8
  br label %67

35:                                               ; preds = %67, %29
  %36 = phi float [ undef, %29 ], [ %157, %67 ]
  %37 = phi i32 [ 0, %29 ], [ %158, %67 ]
  %38 = icmp eq i32 %31, 0
  br i1 %38, label %56, label %39

39:                                               ; preds = %35, %39
  %40 = phi float [ %52, %39 ], [ %36, %35 ]
  %41 = phi i32 [ %53, %39 ], [ %37, %35 ]
  %42 = phi i32 [ %54, %39 ], [ 0, %35 ]
  %43 = add nsw i32 %41, %30
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !6
  %47 = udiv i32 %46, %9
  %48 = add nsw i32 %47, %26
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %3, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !11, !amdgpu.noclobber !6
  %52 = fadd contract float %40, %51
  %53 = add nuw nsw i32 %41, 1
  %54 = add i32 %42, 1
  %55 = icmp eq i32 %54, %31
  br i1 %55, label %56, label %39, !llvm.loop !13

56:                                               ; preds = %39, %35
  %57 = phi float [ %36, %35 ], [ %52, %39 ]
  %58 = fpext float %57 to double
  br label %59

59:                                               ; preds = %6, %56
  %60 = phi double [ %58, %56 ], [ undef, %6 ]
  %61 = mul i32 %25, %2
  %62 = sitofp i32 %1 to double
  %63 = fdiv contract double %60, %62
  %64 = add i32 %28, %61
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds double, double addrspace(1)* %4, i64 %65
  store double %63, double addrspace(1)* %66, align 8, !tbaa !15
  ret void

67:                                               ; preds = %67, %33
  %68 = phi float [ undef, %33 ], [ %157, %67 ]
  %69 = phi i32 [ 0, %33 ], [ %158, %67 ]
  %70 = phi i32 [ 0, %33 ], [ %159, %67 ]
  %71 = add nsw i32 %69, %30
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %72
  %74 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !6
  %75 = udiv i32 %74, %9
  %76 = add nsw i32 %75, %26
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %3, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !11, !amdgpu.noclobber !6
  %80 = fadd contract float %68, %79
  %81 = or i32 %69, 1
  %82 = add nsw i32 %81, %30
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !6
  %86 = udiv i32 %85, %9
  %87 = add nsw i32 %86, %26
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %3, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !11, !amdgpu.noclobber !6
  %91 = fadd contract float %80, %90
  %92 = or i32 %69, 2
  %93 = add nsw i32 %92, %30
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %94
  %96 = load i32, i32 addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !6
  %97 = udiv i32 %96, %9
  %98 = add nsw i32 %97, %26
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %3, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !11, !amdgpu.noclobber !6
  %102 = fadd contract float %91, %101
  %103 = or i32 %69, 3
  %104 = add nsw i32 %103, %30
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %105
  %107 = load i32, i32 addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !6
  %108 = udiv i32 %107, %9
  %109 = add nsw i32 %108, %26
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %3, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !11, !amdgpu.noclobber !6
  %113 = fadd contract float %102, %112
  %114 = or i32 %69, 4
  %115 = add nsw i32 %114, %30
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %116
  %118 = load i32, i32 addrspace(1)* %117, align 4, !tbaa !7, !amdgpu.noclobber !6
  %119 = udiv i32 %118, %9
  %120 = add nsw i32 %119, %26
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %3, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !11, !amdgpu.noclobber !6
  %124 = fadd contract float %113, %123
  %125 = or i32 %69, 5
  %126 = add nsw i32 %125, %30
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %127
  %129 = load i32, i32 addrspace(1)* %128, align 4, !tbaa !7, !amdgpu.noclobber !6
  %130 = udiv i32 %129, %9
  %131 = add nsw i32 %130, %26
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %3, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !11, !amdgpu.noclobber !6
  %135 = fadd contract float %124, %134
  %136 = or i32 %69, 6
  %137 = add nsw i32 %136, %30
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %138
  %140 = load i32, i32 addrspace(1)* %139, align 4, !tbaa !7, !amdgpu.noclobber !6
  %141 = udiv i32 %140, %9
  %142 = add nsw i32 %141, %26
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %3, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !11, !amdgpu.noclobber !6
  %146 = fadd contract float %135, %145
  %147 = or i32 %69, 7
  %148 = add nsw i32 %147, %30
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %149
  %151 = load i32, i32 addrspace(1)* %150, align 4, !tbaa !7, !amdgpu.noclobber !6
  %152 = udiv i32 %151, %9
  %153 = add nsw i32 %152, %26
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %3, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !11, !amdgpu.noclobber !6
  %157 = fadd contract float %146, %156
  %158 = add nuw nsw i32 %69, 8
  %159 = add i32 %70, 8
  %160 = icmp eq i32 %159, %34
  br i1 %160, label %35, label %67, !llvm.loop !17
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
!14 = !{!"llvm.loop.unroll.disable"}
!15 = !{!16, !16, i64 0}
!16 = !{!"double", !9, i64 0}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
