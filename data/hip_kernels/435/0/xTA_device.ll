; ModuleID = '../data/hip_kernels/435/0/main.cu'
source_filename = "../data/hip_kernels/435/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z3xTAPdiS_iiS_i(double addrspace(1)* nocapture writeonly %0, i32 %1, double addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, double addrspace(1)* nocapture readonly %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %1
  br i1 %17, label %18, label %153

18:                                               ; preds = %7
  %19 = icmp sgt i32 %3, 0
  br i1 %19, label %20, label %47

20:                                               ; preds = %18
  %21 = and i32 %3, 7
  %22 = icmp ult i32 %3, 8
  br i1 %22, label %25, label %23

23:                                               ; preds = %20
  %24 = and i32 %3, -8
  br label %51

25:                                               ; preds = %51, %20
  %26 = phi i32 [ 0, %20 ], [ %150, %51 ]
  %27 = phi double [ undef, %20 ], [ %149, %51 ]
  %28 = icmp eq i32 %21, 0
  br i1 %28, label %47, label %29

29:                                               ; preds = %25, %29
  %30 = phi i32 [ %44, %29 ], [ %26, %25 ]
  %31 = phi double [ %43, %29 ], [ %27, %25 ]
  %32 = phi i32 [ %45, %29 ], [ 0, %25 ]
  %33 = mul nsw i32 %30, %6
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %5, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !7, !amdgpu.noclobber !5
  %37 = mul nsw i32 %30, %4
  %38 = add nsw i32 %37, %16
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %2, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !7, !amdgpu.noclobber !5
  %42 = fmul contract double %36, %41
  %43 = fadd contract double %31, %42
  %44 = add nuw nsw i32 %30, 1
  %45 = add i32 %32, 1
  %46 = icmp eq i32 %45, %21
  br i1 %46, label %47, label %29, !llvm.loop !11

47:                                               ; preds = %25, %29, %18
  %48 = phi double [ undef, %18 ], [ %27, %25 ], [ %43, %29 ]
  %49 = sext i32 %16 to i64
  %50 = getelementptr inbounds double, double addrspace(1)* %0, i64 %49
  store double %48, double addrspace(1)* %50, align 8, !tbaa !7
  br label %153

51:                                               ; preds = %51, %23
  %52 = phi i32 [ 0, %23 ], [ %150, %51 ]
  %53 = phi double [ undef, %23 ], [ %149, %51 ]
  %54 = phi i32 [ 0, %23 ], [ %151, %51 ]
  %55 = mul nsw i32 %52, %6
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds double, double addrspace(1)* %5, i64 %56
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !7, !amdgpu.noclobber !5
  %59 = mul nsw i32 %52, %4
  %60 = add nsw i32 %59, %16
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds double, double addrspace(1)* %2, i64 %61
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !7, !amdgpu.noclobber !5
  %64 = fmul contract double %58, %63
  %65 = fadd contract double %53, %64
  %66 = or i32 %52, 1
  %67 = mul nsw i32 %66, %6
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds double, double addrspace(1)* %5, i64 %68
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !7, !amdgpu.noclobber !5
  %71 = mul nsw i32 %66, %4
  %72 = add nsw i32 %71, %16
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds double, double addrspace(1)* %2, i64 %73
  %75 = load double, double addrspace(1)* %74, align 8, !tbaa !7, !amdgpu.noclobber !5
  %76 = fmul contract double %70, %75
  %77 = fadd contract double %65, %76
  %78 = or i32 %52, 2
  %79 = mul nsw i32 %78, %6
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds double, double addrspace(1)* %5, i64 %80
  %82 = load double, double addrspace(1)* %81, align 8, !tbaa !7, !amdgpu.noclobber !5
  %83 = mul nsw i32 %78, %4
  %84 = add nsw i32 %83, %16
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds double, double addrspace(1)* %2, i64 %85
  %87 = load double, double addrspace(1)* %86, align 8, !tbaa !7, !amdgpu.noclobber !5
  %88 = fmul contract double %82, %87
  %89 = fadd contract double %77, %88
  %90 = or i32 %52, 3
  %91 = mul nsw i32 %90, %6
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds double, double addrspace(1)* %5, i64 %92
  %94 = load double, double addrspace(1)* %93, align 8, !tbaa !7, !amdgpu.noclobber !5
  %95 = mul nsw i32 %90, %4
  %96 = add nsw i32 %95, %16
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds double, double addrspace(1)* %2, i64 %97
  %99 = load double, double addrspace(1)* %98, align 8, !tbaa !7, !amdgpu.noclobber !5
  %100 = fmul contract double %94, %99
  %101 = fadd contract double %89, %100
  %102 = or i32 %52, 4
  %103 = mul nsw i32 %102, %6
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds double, double addrspace(1)* %5, i64 %104
  %106 = load double, double addrspace(1)* %105, align 8, !tbaa !7, !amdgpu.noclobber !5
  %107 = mul nsw i32 %102, %4
  %108 = add nsw i32 %107, %16
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds double, double addrspace(1)* %2, i64 %109
  %111 = load double, double addrspace(1)* %110, align 8, !tbaa !7, !amdgpu.noclobber !5
  %112 = fmul contract double %106, %111
  %113 = fadd contract double %101, %112
  %114 = or i32 %52, 5
  %115 = mul nsw i32 %114, %6
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds double, double addrspace(1)* %5, i64 %116
  %118 = load double, double addrspace(1)* %117, align 8, !tbaa !7, !amdgpu.noclobber !5
  %119 = mul nsw i32 %114, %4
  %120 = add nsw i32 %119, %16
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds double, double addrspace(1)* %2, i64 %121
  %123 = load double, double addrspace(1)* %122, align 8, !tbaa !7, !amdgpu.noclobber !5
  %124 = fmul contract double %118, %123
  %125 = fadd contract double %113, %124
  %126 = or i32 %52, 6
  %127 = mul nsw i32 %126, %6
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds double, double addrspace(1)* %5, i64 %128
  %130 = load double, double addrspace(1)* %129, align 8, !tbaa !7, !amdgpu.noclobber !5
  %131 = mul nsw i32 %126, %4
  %132 = add nsw i32 %131, %16
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds double, double addrspace(1)* %2, i64 %133
  %135 = load double, double addrspace(1)* %134, align 8, !tbaa !7, !amdgpu.noclobber !5
  %136 = fmul contract double %130, %135
  %137 = fadd contract double %125, %136
  %138 = or i32 %52, 7
  %139 = mul nsw i32 %138, %6
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds double, double addrspace(1)* %5, i64 %140
  %142 = load double, double addrspace(1)* %141, align 8, !tbaa !7, !amdgpu.noclobber !5
  %143 = mul nsw i32 %138, %4
  %144 = add nsw i32 %143, %16
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds double, double addrspace(1)* %2, i64 %145
  %147 = load double, double addrspace(1)* %146, align 8, !tbaa !7, !amdgpu.noclobber !5
  %148 = fmul contract double %142, %147
  %149 = fadd contract double %137, %148
  %150 = add nuw nsw i32 %52, 8
  %151 = add i32 %54, 8
  %152 = icmp eq i32 %151, %24
  br i1 %152, label %25, label %51, !llvm.loop !13

153:                                              ; preds = %47, %7
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
