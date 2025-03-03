; ModuleID = '../data/hip_kernels/415/6/main.cu'
source_filename = "../data/hip_kernels/415/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15reduceUnrollingPdS_jj(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %3
  %13 = mul i32 %12, %11
  %14 = add i32 %13, %5
  %15 = add i32 %3, -1
  %16 = mul i32 %15, %11
  %17 = add i32 %14, %16
  %18 = icmp ult i32 %17, %2
  %19 = icmp ugt i32 %3, 1
  %20 = select i1 %18, i1 %19, i1 false
  br i1 %20, label %21, label %109

21:                                               ; preds = %4
  %22 = zext i32 %14 to i64
  %23 = getelementptr inbounds double, double addrspace(1)* %0, i64 %22
  %24 = load double, double addrspace(1)* %23, align 8, !tbaa !7
  %25 = add i32 %3, -2
  %26 = and i32 %15, 7
  %27 = icmp ult i32 %25, 7
  br i1 %27, label %92, label %28

28:                                               ; preds = %21
  %29 = and i32 %15, -8
  br label %30

30:                                               ; preds = %30, %28
  %31 = phi double [ %24, %28 ], [ %88, %30 ]
  %32 = phi i32 [ 1, %28 ], [ %89, %30 ]
  %33 = phi i32 [ 0, %28 ], [ %90, %30 ]
  %34 = mul i32 %32, %11
  %35 = add i32 %34, %14
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds double, double addrspace(1)* %0, i64 %36
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !7
  %39 = fadd contract double %38, %31
  store double %39, double addrspace(1)* %23, align 8, !tbaa !7
  %40 = add nuw nsw i32 %32, 1
  %41 = mul i32 %40, %11
  %42 = add i32 %41, %14
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %0, i64 %43
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !7
  %46 = fadd contract double %45, %39
  store double %46, double addrspace(1)* %23, align 8, !tbaa !7
  %47 = add nuw nsw i32 %32, 2
  %48 = mul i32 %47, %11
  %49 = add i32 %48, %14
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds double, double addrspace(1)* %0, i64 %50
  %52 = load double, double addrspace(1)* %51, align 8, !tbaa !7
  %53 = fadd contract double %52, %46
  store double %53, double addrspace(1)* %23, align 8, !tbaa !7
  %54 = add nuw nsw i32 %32, 3
  %55 = mul i32 %54, %11
  %56 = add i32 %55, %14
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %0, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !7
  %60 = fadd contract double %59, %53
  store double %60, double addrspace(1)* %23, align 8, !tbaa !7
  %61 = add nuw nsw i32 %32, 4
  %62 = mul i32 %61, %11
  %63 = add i32 %62, %14
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds double, double addrspace(1)* %0, i64 %64
  %66 = load double, double addrspace(1)* %65, align 8, !tbaa !7
  %67 = fadd contract double %66, %60
  store double %67, double addrspace(1)* %23, align 8, !tbaa !7
  %68 = add nuw nsw i32 %32, 5
  %69 = mul i32 %68, %11
  %70 = add i32 %69, %14
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds double, double addrspace(1)* %0, i64 %71
  %73 = load double, double addrspace(1)* %72, align 8, !tbaa !7
  %74 = fadd contract double %73, %67
  store double %74, double addrspace(1)* %23, align 8, !tbaa !7
  %75 = add nuw nsw i32 %32, 6
  %76 = mul i32 %75, %11
  %77 = add i32 %76, %14
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds double, double addrspace(1)* %0, i64 %78
  %80 = load double, double addrspace(1)* %79, align 8, !tbaa !7
  %81 = fadd contract double %80, %74
  store double %81, double addrspace(1)* %23, align 8, !tbaa !7
  %82 = add nuw nsw i32 %32, 7
  %83 = mul i32 %82, %11
  %84 = add i32 %83, %14
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds double, double addrspace(1)* %0, i64 %85
  %87 = load double, double addrspace(1)* %86, align 8, !tbaa !7
  %88 = fadd contract double %87, %81
  store double %88, double addrspace(1)* %23, align 8, !tbaa !7
  %89 = add nuw nsw i32 %32, 8
  %90 = add i32 %33, 8
  %91 = icmp eq i32 %90, %29
  br i1 %91, label %92, label %30, !llvm.loop !11

92:                                               ; preds = %30, %21
  %93 = phi double [ %24, %21 ], [ %88, %30 ]
  %94 = phi i32 [ 1, %21 ], [ %89, %30 ]
  %95 = icmp eq i32 %26, 0
  br i1 %95, label %109, label %96

96:                                               ; preds = %92, %96
  %97 = phi double [ %105, %96 ], [ %93, %92 ]
  %98 = phi i32 [ %106, %96 ], [ %94, %92 ]
  %99 = phi i32 [ %107, %96 ], [ 0, %92 ]
  %100 = mul i32 %98, %11
  %101 = add i32 %100, %14
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds double, double addrspace(1)* %0, i64 %102
  %104 = load double, double addrspace(1)* %103, align 8, !tbaa !7
  %105 = fadd contract double %104, %97
  store double %105, double addrspace(1)* %23, align 8, !tbaa !7
  %106 = add nuw nsw i32 %98, 1
  %107 = add i32 %99, 1
  %108 = icmp eq i32 %107, %26
  br i1 %108, label %109, label %96, !llvm.loop !13

109:                                              ; preds = %92, %96, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %110 = icmp ult i16 %10, 2
  br i1 %110, label %114, label %111

111:                                              ; preds = %109
  %112 = zext i32 %14 to i64
  %113 = getelementptr inbounds double, double addrspace(1)* %0, i64 %112
  br label %116

114:                                              ; preds = %127, %109
  %115 = icmp eq i32 %5, 0
  br i1 %115, label %129, label %135

116:                                              ; preds = %111, %127
  %117 = phi i32 [ %11, %111 ], [ %118, %127 ]
  %118 = lshr i32 %117, 1
  %119 = icmp ult i32 %5, %118
  br i1 %119, label %120, label %127

120:                                              ; preds = %116
  %121 = add i32 %118, %14
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds double, double addrspace(1)* %0, i64 %122
  %124 = load double, double addrspace(1)* %123, align 8, !tbaa !7
  %125 = load double, double addrspace(1)* %113, align 8, !tbaa !7
  %126 = fadd contract double %124, %125
  store double %126, double addrspace(1)* %113, align 8, !tbaa !7
  br label %127

127:                                              ; preds = %120, %116
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %128 = icmp ult i32 %117, 4
  br i1 %128, label %114, label %116, !llvm.loop !15

129:                                              ; preds = %114
  %130 = zext i32 %14 to i64
  %131 = getelementptr inbounds double, double addrspace(1)* %0, i64 %130
  %132 = load double, double addrspace(1)* %131, align 8, !tbaa !7
  %133 = zext i32 %6 to i64
  %134 = getelementptr inbounds double, double addrspace(1)* %1, i64 %133
  store double %132, double addrspace(1)* %134, align 8, !tbaa !7
  br label %135

135:                                              ; preds = %129, %114
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
