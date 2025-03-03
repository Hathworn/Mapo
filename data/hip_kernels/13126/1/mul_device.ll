; ModuleID = '../data/hip_kernels/13126/1/main.cu'
source_filename = "../data/hip_kernels/13126/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @mul(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %3
  %15 = icmp sgt i32 %3, 0
  %16 = and i1 %14, %15
  br i1 %16, label %17, label %156

17:                                               ; preds = %4
  %18 = mul nsw i32 %13, %3
  %19 = and i32 %3, 7
  %20 = icmp ult i32 %3, 8
  %21 = and i32 %3, -8
  %22 = icmp eq i32 %19, 0
  br label %23

23:                                               ; preds = %17, %47
  %24 = phi i32 [ 0, %17 ], [ %52, %47 ]
  br i1 %20, label %25, label %54

25:                                               ; preds = %54, %23
  %26 = phi double [ undef, %23 ], [ %152, %54 ]
  %27 = phi i32 [ 0, %23 ], [ %153, %54 ]
  %28 = phi double [ 0.000000e+00, %23 ], [ %152, %54 ]
  br i1 %22, label %47, label %29

29:                                               ; preds = %25, %29
  %30 = phi i32 [ %44, %29 ], [ %27, %25 ]
  %31 = phi double [ %43, %29 ], [ %28, %25 ]
  %32 = phi i32 [ %45, %29 ], [ 0, %25 ]
  %33 = add nsw i32 %30, %18
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %0, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !7
  %37 = mul nsw i32 %30, %3
  %38 = add nsw i32 %37, %24
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %1, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !7
  %42 = fmul contract double %36, %41
  %43 = fadd contract double %31, %42
  %44 = add nuw nsw i32 %30, 1
  %45 = add i32 %32, 1
  %46 = icmp eq i32 %45, %19
  br i1 %46, label %47, label %29, !llvm.loop !11

47:                                               ; preds = %29, %25
  %48 = phi double [ %26, %25 ], [ %43, %29 ]
  %49 = add nsw i32 %24, %18
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds double, double addrspace(1)* %2, i64 %50
  store double %48, double addrspace(1)* %51, align 8, !tbaa !7
  %52 = add nuw nsw i32 %24, 1
  %53 = icmp eq i32 %52, %3
  br i1 %53, label %156, label %23, !llvm.loop !13

54:                                               ; preds = %23, %54
  %55 = phi i32 [ %153, %54 ], [ 0, %23 ]
  %56 = phi double [ %152, %54 ], [ 0.000000e+00, %23 ]
  %57 = phi i32 [ %154, %54 ], [ 0, %23 ]
  %58 = add nsw i32 %55, %18
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double, double addrspace(1)* %0, i64 %59
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !7
  %62 = mul nsw i32 %55, %3
  %63 = add nsw i32 %62, %24
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds double, double addrspace(1)* %1, i64 %64
  %66 = load double, double addrspace(1)* %65, align 8, !tbaa !7
  %67 = fmul contract double %61, %66
  %68 = fadd contract double %56, %67
  %69 = or i32 %55, 1
  %70 = add nsw i32 %69, %18
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds double, double addrspace(1)* %0, i64 %71
  %73 = load double, double addrspace(1)* %72, align 8, !tbaa !7
  %74 = mul nsw i32 %69, %3
  %75 = add nsw i32 %74, %24
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds double, double addrspace(1)* %1, i64 %76
  %78 = load double, double addrspace(1)* %77, align 8, !tbaa !7
  %79 = fmul contract double %73, %78
  %80 = fadd contract double %68, %79
  %81 = or i32 %55, 2
  %82 = add nsw i32 %81, %18
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds double, double addrspace(1)* %0, i64 %83
  %85 = load double, double addrspace(1)* %84, align 8, !tbaa !7
  %86 = mul nsw i32 %81, %3
  %87 = add nsw i32 %86, %24
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds double, double addrspace(1)* %1, i64 %88
  %90 = load double, double addrspace(1)* %89, align 8, !tbaa !7
  %91 = fmul contract double %85, %90
  %92 = fadd contract double %80, %91
  %93 = or i32 %55, 3
  %94 = add nsw i32 %93, %18
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds double, double addrspace(1)* %0, i64 %95
  %97 = load double, double addrspace(1)* %96, align 8, !tbaa !7
  %98 = mul nsw i32 %93, %3
  %99 = add nsw i32 %98, %24
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds double, double addrspace(1)* %1, i64 %100
  %102 = load double, double addrspace(1)* %101, align 8, !tbaa !7
  %103 = fmul contract double %97, %102
  %104 = fadd contract double %92, %103
  %105 = or i32 %55, 4
  %106 = add nsw i32 %105, %18
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds double, double addrspace(1)* %0, i64 %107
  %109 = load double, double addrspace(1)* %108, align 8, !tbaa !7
  %110 = mul nsw i32 %105, %3
  %111 = add nsw i32 %110, %24
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds double, double addrspace(1)* %1, i64 %112
  %114 = load double, double addrspace(1)* %113, align 8, !tbaa !7
  %115 = fmul contract double %109, %114
  %116 = fadd contract double %104, %115
  %117 = or i32 %55, 5
  %118 = add nsw i32 %117, %18
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds double, double addrspace(1)* %0, i64 %119
  %121 = load double, double addrspace(1)* %120, align 8, !tbaa !7
  %122 = mul nsw i32 %117, %3
  %123 = add nsw i32 %122, %24
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds double, double addrspace(1)* %1, i64 %124
  %126 = load double, double addrspace(1)* %125, align 8, !tbaa !7
  %127 = fmul contract double %121, %126
  %128 = fadd contract double %116, %127
  %129 = or i32 %55, 6
  %130 = add nsw i32 %129, %18
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds double, double addrspace(1)* %0, i64 %131
  %133 = load double, double addrspace(1)* %132, align 8, !tbaa !7
  %134 = mul nsw i32 %129, %3
  %135 = add nsw i32 %134, %24
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds double, double addrspace(1)* %1, i64 %136
  %138 = load double, double addrspace(1)* %137, align 8, !tbaa !7
  %139 = fmul contract double %133, %138
  %140 = fadd contract double %128, %139
  %141 = or i32 %55, 7
  %142 = add nsw i32 %141, %18
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds double, double addrspace(1)* %0, i64 %143
  %145 = load double, double addrspace(1)* %144, align 8, !tbaa !7
  %146 = mul nsw i32 %141, %3
  %147 = add nsw i32 %146, %24
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds double, double addrspace(1)* %1, i64 %148
  %150 = load double, double addrspace(1)* %149, align 8, !tbaa !7
  %151 = fmul contract double %145, %150
  %152 = fadd contract double %140, %151
  %153 = add nuw nsw i32 %55, 8
  %154 = add i32 %57, 8
  %155 = icmp eq i32 %154, %21
  br i1 %155, label %25, label %54, !llvm.loop !15

156:                                              ; preds = %47, %4
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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
