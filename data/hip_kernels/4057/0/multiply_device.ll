; ModuleID = '../data/hip_kernels/4057/0/main.cu'
source_filename = "../data/hip_kernels/4057/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ8multiplyPfS_S_iE13Left_shared_t = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ8multiplyPfS_S_iE14Right_shared_t = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8multiplyPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 2, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 4, !tbaa !7
  %22 = mul i32 %14, %18
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %24 = add i32 %22, %23
  %25 = udiv i32 %21, %18
  %26 = mul i32 %25, %18
  %27 = icmp ugt i32 %21, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = icmp eq i32 %29, 0
  %31 = mul nsw i32 %13, %3
  br i1 %30, label %68, label %32

32:                                               ; preds = %4
  %33 = add i32 %31, %23
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE13Left_shared_t, i32 0, i32 %12, i32 %23
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE14Right_shared_t, i32 0, i32 %12, i32 %23
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE13Left_shared_t, i32 0, i32 %12, i32 0
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE14Right_shared_t, i32 0, i32 0, i32 %23
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE13Left_shared_t, i32 0, i32 %12, i32 1
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE14Right_shared_t, i32 0, i32 1, i32 %23
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE13Left_shared_t, i32 0, i32 %12, i32 2
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE14Right_shared_t, i32 0, i32 2, i32 %23
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE13Left_shared_t, i32 0, i32 %12, i32 3
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE14Right_shared_t, i32 0, i32 3, i32 %23
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE13Left_shared_t, i32 0, i32 %12, i32 4
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE14Right_shared_t, i32 0, i32 4, i32 %23
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE13Left_shared_t, i32 0, i32 %12, i32 5
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE14Right_shared_t, i32 0, i32 5, i32 %23
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE13Left_shared_t, i32 0, i32 %12, i32 6
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE14Right_shared_t, i32 0, i32 6, i32 %23
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE13Left_shared_t, i32 0, i32 %12, i32 7
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE14Right_shared_t, i32 0, i32 7, i32 %23
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE13Left_shared_t, i32 0, i32 %12, i32 8
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE14Right_shared_t, i32 0, i32 8, i32 %23
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE13Left_shared_t, i32 0, i32 %12, i32 9
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE14Right_shared_t, i32 0, i32 9, i32 %23
  %56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE13Left_shared_t, i32 0, i32 %12, i32 10
  %57 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE14Right_shared_t, i32 0, i32 10, i32 %23
  %58 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE13Left_shared_t, i32 0, i32 %12, i32 11
  %59 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE14Right_shared_t, i32 0, i32 11, i32 %23
  %60 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE13Left_shared_t, i32 0, i32 %12, i32 12
  %61 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE14Right_shared_t, i32 0, i32 12, i32 %23
  %62 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE13Left_shared_t, i32 0, i32 %12, i32 13
  %63 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE14Right_shared_t, i32 0, i32 13, i32 %23
  %64 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE13Left_shared_t, i32 0, i32 %12, i32 14
  %65 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE14Right_shared_t, i32 0, i32 14, i32 %23
  %66 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE13Left_shared_t, i32 0, i32 %12, i32 15
  %67 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ8multiplyPfS_S_iE14Right_shared_t, i32 0, i32 15, i32 %23
  br label %73

68:                                               ; preds = %73, %4
  %69 = phi float [ 0.000000e+00, %4 ], [ %150, %73 ]
  %70 = add nsw i32 %31, %24
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %2, i64 %71
  store float %69, float addrspace(1)* %72, align 4, !tbaa !16
  ret void

73:                                               ; preds = %32, %73
  %74 = phi i32 [ 0, %32 ], [ %151, %73 ]
  %75 = phi float [ 0.000000e+00, %32 ], [ %150, %73 ]
  %76 = shl nsw i32 %74, 4
  %77 = add nuw i32 %76, %12
  %78 = add i32 %33, %76
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !16, !amdgpu.noclobber !5
  store float %81, float addrspace(3)* %34, align 4, !tbaa !16
  %82 = mul nsw i32 %77, %3
  %83 = add nsw i32 %82, %24
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !16, !amdgpu.noclobber !5
  store float %86, float addrspace(3)* %35, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %87 = load float, float addrspace(3)* %36, align 16, !tbaa !16
  %88 = load float, float addrspace(3)* %37, align 4, !tbaa !16
  %89 = fmul contract float %87, %88
  %90 = fadd contract float %75, %89
  %91 = load float, float addrspace(3)* %38, align 4, !tbaa !16
  %92 = load float, float addrspace(3)* %39, align 4, !tbaa !16
  %93 = fmul contract float %91, %92
  %94 = fadd contract float %90, %93
  %95 = load float, float addrspace(3)* %40, align 8, !tbaa !16
  %96 = load float, float addrspace(3)* %41, align 4, !tbaa !16
  %97 = fmul contract float %95, %96
  %98 = fadd contract float %94, %97
  %99 = load float, float addrspace(3)* %42, align 4, !tbaa !16
  %100 = load float, float addrspace(3)* %43, align 4, !tbaa !16
  %101 = fmul contract float %99, %100
  %102 = fadd contract float %98, %101
  %103 = load float, float addrspace(3)* %44, align 16, !tbaa !16
  %104 = load float, float addrspace(3)* %45, align 4, !tbaa !16
  %105 = fmul contract float %103, %104
  %106 = fadd contract float %102, %105
  %107 = load float, float addrspace(3)* %46, align 4, !tbaa !16
  %108 = load float, float addrspace(3)* %47, align 4, !tbaa !16
  %109 = fmul contract float %107, %108
  %110 = fadd contract float %106, %109
  %111 = load float, float addrspace(3)* %48, align 8, !tbaa !16
  %112 = load float, float addrspace(3)* %49, align 4, !tbaa !16
  %113 = fmul contract float %111, %112
  %114 = fadd contract float %110, %113
  %115 = load float, float addrspace(3)* %50, align 4, !tbaa !16
  %116 = load float, float addrspace(3)* %51, align 4, !tbaa !16
  %117 = fmul contract float %115, %116
  %118 = fadd contract float %114, %117
  %119 = load float, float addrspace(3)* %52, align 16, !tbaa !16
  %120 = load float, float addrspace(3)* %53, align 4, !tbaa !16
  %121 = fmul contract float %119, %120
  %122 = fadd contract float %118, %121
  %123 = load float, float addrspace(3)* %54, align 4, !tbaa !16
  %124 = load float, float addrspace(3)* %55, align 4, !tbaa !16
  %125 = fmul contract float %123, %124
  %126 = fadd contract float %122, %125
  %127 = load float, float addrspace(3)* %56, align 8, !tbaa !16
  %128 = load float, float addrspace(3)* %57, align 4, !tbaa !16
  %129 = fmul contract float %127, %128
  %130 = fadd contract float %126, %129
  %131 = load float, float addrspace(3)* %58, align 4, !tbaa !16
  %132 = load float, float addrspace(3)* %59, align 4, !tbaa !16
  %133 = fmul contract float %131, %132
  %134 = fadd contract float %130, %133
  %135 = load float, float addrspace(3)* %60, align 16, !tbaa !16
  %136 = load float, float addrspace(3)* %61, align 4, !tbaa !16
  %137 = fmul contract float %135, %136
  %138 = fadd contract float %134, %137
  %139 = load float, float addrspace(3)* %62, align 4, !tbaa !16
  %140 = load float, float addrspace(3)* %63, align 4, !tbaa !16
  %141 = fmul contract float %139, %140
  %142 = fadd contract float %138, %141
  %143 = load float, float addrspace(3)* %64, align 8, !tbaa !16
  %144 = load float, float addrspace(3)* %65, align 4, !tbaa !16
  %145 = fmul contract float %143, %144
  %146 = fadd contract float %142, %145
  %147 = load float, float addrspace(3)* %66, align 4, !tbaa !16
  %148 = load float, float addrspace(3)* %67, align 4, !tbaa !16
  %149 = fmul contract float %147, %148
  %150 = fadd contract float %146, %149
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %151 = add nuw nsw i32 %74, 1
  %152 = icmp eq i32 %151, %29
  br i1 %152, label %68, label %73, !llvm.loop !20
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
