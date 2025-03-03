; ModuleID = '../data/hip_kernels/778/0/main.cu'
source_filename = "../data/hip_kernels/778/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18jacobiOnGpuNaive2DPdS_iii(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %7, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = zext i32 %14 to i64
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = shl nuw nsw i32 %22, 2
  %24 = add i32 %21, %23
  %25 = zext i32 %24 to i64
  %26 = sext i32 %3 to i64
  %27 = mul nsw i64 %15, %26
  %28 = add nsw i64 %27, %25
  %29 = add nsw i64 %28, -1
  %30 = add nsw i64 %28, -2
  %31 = add nsw i64 %28, -3
  %32 = icmp sgt i32 %4, 0
  br i1 %32, label %33, label %81

33:                                               ; preds = %5
  %34 = add nuw nsw i64 %15, 1
  %35 = add nsw i64 %15, -1
  %36 = icmp eq i32 %14, 0
  %37 = icmp eq i32 %24, 0
  %38 = select i1 %36, i1 true, i1 %37
  %39 = add nsw i32 %2, -1
  %40 = sext i32 %39 to i64
  %41 = icmp uge i64 %15, %40
  %42 = add nsw i32 %3, -1
  %43 = sext i32 %42 to i64
  %44 = icmp uge i64 %25, %43
  %45 = mul nsw i64 %35, %26
  %46 = add nsw i64 %45, %25
  %47 = getelementptr inbounds double, double addrspace(1)* %0, i64 %46
  %48 = mul nsw i64 %34, %26
  %49 = add nsw i64 %48, %25
  %50 = getelementptr inbounds double, double addrspace(1)* %0, i64 %49
  %51 = getelementptr inbounds double, double addrspace(1)* %0, i64 %29
  %52 = add nsw i64 %28, 1
  %53 = getelementptr inbounds double, double addrspace(1)* %0, i64 %52
  %54 = getelementptr inbounds double, double addrspace(1)* %1, i64 %28
  %55 = getelementptr inbounds double, double addrspace(1)* %0, i64 %30
  %56 = add nsw i64 %28, -4
  %57 = getelementptr inbounds double, double addrspace(1)* %0, i64 %56
  %58 = sext i32 %2 to i64
  %59 = add i64 %31, %58
  %60 = getelementptr inbounds double, double addrspace(1)* %0, i64 %59
  %61 = sub i64 %31, %58
  %62 = getelementptr inbounds double, double addrspace(1)* %0, i64 %61
  %63 = getelementptr inbounds double, double addrspace(1)* %1, i64 %31
  %64 = getelementptr inbounds double, double addrspace(1)* %0, i64 %31
  %65 = add i64 %30, %58
  %66 = getelementptr inbounds double, double addrspace(1)* %0, i64 %65
  %67 = sub i64 %30, %58
  %68 = getelementptr inbounds double, double addrspace(1)* %0, i64 %67
  %69 = getelementptr inbounds double, double addrspace(1)* %1, i64 %30
  %70 = getelementptr inbounds double, double addrspace(1)* %0, i64 %28
  %71 = add i64 %29, %58
  %72 = getelementptr inbounds double, double addrspace(1)* %0, i64 %71
  %73 = sub nsw i64 %29, %58
  %74 = getelementptr inbounds double, double addrspace(1)* %0, i64 %73
  %75 = getelementptr inbounds double, double addrspace(1)* %1, i64 %29
  %76 = mul nsw i32 %3, %2
  %77 = sext i32 %76 to i64
  %78 = icmp ult i64 %28, %77
  %79 = select i1 %38, i1 true, i1 %41
  %80 = select i1 %79, i1 true, i1 %44
  br label %82

81:                                               ; preds = %120, %5
  ret void

82:                                               ; preds = %33, %120
  %83 = phi i32 [ 0, %33 ], [ %121, %120 ]
  br i1 %80, label %117, label %84

84:                                               ; preds = %82
  %85 = load double, double addrspace(1)* %47, align 8, !tbaa !7
  %86 = load double, double addrspace(1)* %50, align 8, !tbaa !7
  %87 = fadd contract double %85, %86
  %88 = load double, double addrspace(1)* %51, align 8, !tbaa !7
  %89 = fadd contract double %87, %88
  %90 = load double, double addrspace(1)* %53, align 8, !tbaa !7
  %91 = fadd contract double %89, %90
  %92 = fmul contract double %91, 2.500000e-01
  store double %92, double addrspace(1)* %54, align 8, !tbaa !7
  %93 = load double, double addrspace(1)* %55, align 8, !tbaa !7
  %94 = load double, double addrspace(1)* %57, align 8, !tbaa !7
  %95 = fadd contract double %93, %94
  %96 = load double, double addrspace(1)* %60, align 8, !tbaa !7
  %97 = fadd contract double %95, %96
  %98 = load double, double addrspace(1)* %62, align 8, !tbaa !7
  %99 = fadd contract double %97, %98
  %100 = fmul contract double %99, 2.500000e-01
  store double %100, double addrspace(1)* %63, align 8, !tbaa !7
  %101 = load double, double addrspace(1)* %51, align 8, !tbaa !7
  %102 = load double, double addrspace(1)* %64, align 8, !tbaa !7
  %103 = fadd contract double %101, %102
  %104 = load double, double addrspace(1)* %66, align 8, !tbaa !7
  %105 = fadd contract double %103, %104
  %106 = load double, double addrspace(1)* %68, align 8, !tbaa !7
  %107 = fadd contract double %105, %106
  %108 = fmul contract double %107, 2.500000e-01
  store double %108, double addrspace(1)* %69, align 8, !tbaa !7
  %109 = load double, double addrspace(1)* %70, align 8, !tbaa !7
  %110 = load double, double addrspace(1)* %55, align 8, !tbaa !7
  %111 = fadd contract double %109, %110
  %112 = load double, double addrspace(1)* %72, align 8, !tbaa !7
  %113 = fadd contract double %111, %112
  %114 = load double, double addrspace(1)* %74, align 8, !tbaa !7
  %115 = fadd contract double %113, %114
  %116 = fmul contract double %115, 2.500000e-01
  store double %116, double addrspace(1)* %75, align 8, !tbaa !7
  br label %117

117:                                              ; preds = %82, %84
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %78, label %118, label %120

118:                                              ; preds = %117
  %119 = load double, double addrspace(1)* %54, align 8, !tbaa !7
  store double %119, double addrspace(1)* %70, align 8, !tbaa !7
  br label %120

120:                                              ; preds = %117, %118
  %121 = add nuw nsw i32 %83, 1
  %122 = icmp eq i32 %121, %4
  br i1 %122, label %81, label %82, !llvm.loop !11
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!12 = !{!"llvm.loop.mustprogress"}
