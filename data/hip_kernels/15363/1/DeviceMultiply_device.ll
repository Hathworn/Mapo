; ModuleID = '../data/hip_kernels/15363/1/main.cu'
source_filename = "../data/hip_kernels/15363/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14DeviceMultiplyPdS_S_iii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 2, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = icmp slt i32 %7, %3
  br i1 %18, label %19, label %32

19:                                               ; preds = %6
  %20 = icmp slt i32 %8, %5
  %21 = icmp sgt i32 %4, 0
  %22 = and i32 %4, 7
  %23 = icmp ult i32 %4, 8
  %24 = and i32 %4, -8
  %25 = icmp eq i32 %22, 0
  br label %26

26:                                               ; preds = %19, %33
  %27 = phi i32 [ %7, %19 ], [ %35, %33 ]
  %28 = phi i32 [ 0, %19 ], [ %34, %33 ]
  br i1 %20, label %29, label %33

29:                                               ; preds = %26
  %30 = mul nsw i32 %27, %4
  %31 = mul nsw i32 %27, %5
  br label %37

32:                                               ; preds = %33, %6
  ret void

33:                                               ; preds = %63, %26
  %34 = add nuw nsw i32 %28, %17
  %35 = add nuw nsw i32 %34, %7
  %36 = icmp slt i32 %35, %3
  br i1 %36, label %26, label %32, !llvm.loop !7

37:                                               ; preds = %29, %63
  %38 = phi i32 [ 0, %29 ], [ %68, %63 ]
  %39 = add nuw i32 %38, %8
  br i1 %21, label %40, label %63

40:                                               ; preds = %37
  br i1 %23, label %41, label %71

41:                                               ; preds = %71, %40
  %42 = phi double [ undef, %40 ], [ %169, %71 ]
  %43 = phi double [ 0.000000e+00, %40 ], [ %169, %71 ]
  %44 = phi i32 [ 0, %40 ], [ %170, %71 ]
  br i1 %25, label %63, label %45

45:                                               ; preds = %41, %45
  %46 = phi double [ %59, %45 ], [ %43, %41 ]
  %47 = phi i32 [ %60, %45 ], [ %44, %41 ]
  %48 = phi i32 [ %61, %45 ], [ 0, %41 ]
  %49 = add nsw i32 %47, %30
  %50 = mul nsw i32 %47, %5
  %51 = add i32 %39, %50
  %52 = sext i32 %49 to i64
  %53 = getelementptr inbounds double, double addrspace(1)* %0, i64 %52
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !9
  %55 = sext i32 %51 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %1, i64 %55
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !9
  %58 = fmul contract double %54, %57
  %59 = fadd contract double %46, %58
  %60 = add nuw nsw i32 %47, 1
  %61 = add i32 %48, 1
  %62 = icmp eq i32 %61, %22
  br i1 %62, label %63, label %45, !llvm.loop !13

63:                                               ; preds = %41, %45, %37
  %64 = phi double [ 0.000000e+00, %37 ], [ %42, %41 ], [ %59, %45 ]
  %65 = add i32 %39, %31
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds double, double addrspace(1)* %2, i64 %66
  store double %64, double addrspace(1)* %67, align 8, !tbaa !9
  %68 = add nuw nsw i32 %38, %13
  %69 = add nuw nsw i32 %68, %8
  %70 = icmp slt i32 %69, %5
  br i1 %70, label %37, label %33, !llvm.loop !15

71:                                               ; preds = %40, %71
  %72 = phi double [ %169, %71 ], [ 0.000000e+00, %40 ]
  %73 = phi i32 [ %170, %71 ], [ 0, %40 ]
  %74 = phi i32 [ %171, %71 ], [ 0, %40 ]
  %75 = add nsw i32 %73, %30
  %76 = mul nsw i32 %73, %5
  %77 = add i32 %39, %76
  %78 = sext i32 %75 to i64
  %79 = getelementptr inbounds double, double addrspace(1)* %0, i64 %78
  %80 = load double, double addrspace(1)* %79, align 8, !tbaa !9
  %81 = sext i32 %77 to i64
  %82 = getelementptr inbounds double, double addrspace(1)* %1, i64 %81
  %83 = load double, double addrspace(1)* %82, align 8, !tbaa !9
  %84 = fmul contract double %80, %83
  %85 = fadd contract double %72, %84
  %86 = or i32 %73, 1
  %87 = add nsw i32 %86, %30
  %88 = mul nsw i32 %86, %5
  %89 = add i32 %39, %88
  %90 = sext i32 %87 to i64
  %91 = getelementptr inbounds double, double addrspace(1)* %0, i64 %90
  %92 = load double, double addrspace(1)* %91, align 8, !tbaa !9
  %93 = sext i32 %89 to i64
  %94 = getelementptr inbounds double, double addrspace(1)* %1, i64 %93
  %95 = load double, double addrspace(1)* %94, align 8, !tbaa !9
  %96 = fmul contract double %92, %95
  %97 = fadd contract double %85, %96
  %98 = or i32 %73, 2
  %99 = add nsw i32 %98, %30
  %100 = mul nsw i32 %98, %5
  %101 = add i32 %39, %100
  %102 = sext i32 %99 to i64
  %103 = getelementptr inbounds double, double addrspace(1)* %0, i64 %102
  %104 = load double, double addrspace(1)* %103, align 8, !tbaa !9
  %105 = sext i32 %101 to i64
  %106 = getelementptr inbounds double, double addrspace(1)* %1, i64 %105
  %107 = load double, double addrspace(1)* %106, align 8, !tbaa !9
  %108 = fmul contract double %104, %107
  %109 = fadd contract double %97, %108
  %110 = or i32 %73, 3
  %111 = add nsw i32 %110, %30
  %112 = mul nsw i32 %110, %5
  %113 = add i32 %39, %112
  %114 = sext i32 %111 to i64
  %115 = getelementptr inbounds double, double addrspace(1)* %0, i64 %114
  %116 = load double, double addrspace(1)* %115, align 8, !tbaa !9
  %117 = sext i32 %113 to i64
  %118 = getelementptr inbounds double, double addrspace(1)* %1, i64 %117
  %119 = load double, double addrspace(1)* %118, align 8, !tbaa !9
  %120 = fmul contract double %116, %119
  %121 = fadd contract double %109, %120
  %122 = or i32 %73, 4
  %123 = add nsw i32 %122, %30
  %124 = mul nsw i32 %122, %5
  %125 = add i32 %39, %124
  %126 = sext i32 %123 to i64
  %127 = getelementptr inbounds double, double addrspace(1)* %0, i64 %126
  %128 = load double, double addrspace(1)* %127, align 8, !tbaa !9
  %129 = sext i32 %125 to i64
  %130 = getelementptr inbounds double, double addrspace(1)* %1, i64 %129
  %131 = load double, double addrspace(1)* %130, align 8, !tbaa !9
  %132 = fmul contract double %128, %131
  %133 = fadd contract double %121, %132
  %134 = or i32 %73, 5
  %135 = add nsw i32 %134, %30
  %136 = mul nsw i32 %134, %5
  %137 = add i32 %39, %136
  %138 = sext i32 %135 to i64
  %139 = getelementptr inbounds double, double addrspace(1)* %0, i64 %138
  %140 = load double, double addrspace(1)* %139, align 8, !tbaa !9
  %141 = sext i32 %137 to i64
  %142 = getelementptr inbounds double, double addrspace(1)* %1, i64 %141
  %143 = load double, double addrspace(1)* %142, align 8, !tbaa !9
  %144 = fmul contract double %140, %143
  %145 = fadd contract double %133, %144
  %146 = or i32 %73, 6
  %147 = add nsw i32 %146, %30
  %148 = mul nsw i32 %146, %5
  %149 = add i32 %39, %148
  %150 = sext i32 %147 to i64
  %151 = getelementptr inbounds double, double addrspace(1)* %0, i64 %150
  %152 = load double, double addrspace(1)* %151, align 8, !tbaa !9
  %153 = sext i32 %149 to i64
  %154 = getelementptr inbounds double, double addrspace(1)* %1, i64 %153
  %155 = load double, double addrspace(1)* %154, align 8, !tbaa !9
  %156 = fmul contract double %152, %155
  %157 = fadd contract double %145, %156
  %158 = or i32 %73, 7
  %159 = add nsw i32 %158, %30
  %160 = mul nsw i32 %158, %5
  %161 = add i32 %39, %160
  %162 = sext i32 %159 to i64
  %163 = getelementptr inbounds double, double addrspace(1)* %0, i64 %162
  %164 = load double, double addrspace(1)* %163, align 8, !tbaa !9
  %165 = sext i32 %161 to i64
  %166 = getelementptr inbounds double, double addrspace(1)* %1, i64 %165
  %167 = load double, double addrspace(1)* %166, align 8, !tbaa !9
  %168 = fmul contract double %164, %167
  %169 = fadd contract double %157, %168
  %170 = add nuw nsw i32 %73, 8
  %171 = add i32 %74, 8
  %172 = icmp eq i32 %171, %24
  br i1 %172, label %41, label %71, !llvm.loop !16
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"double", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !8}
!16 = distinct !{!16, !8}
