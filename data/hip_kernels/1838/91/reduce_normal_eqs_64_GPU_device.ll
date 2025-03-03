; ModuleID = '../data/hip_kernels/1838/91/main.cu'
source_filename = "../data/hip_kernels/1838/91/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ24reduce_normal_eqs_64_GPUPfS_iE4DATA = internal unnamed_addr addrspace(3) global [64 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z24reduce_normal_eqs_64_GPUPfS_i(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !5
  %11 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !14, !invariant.load !15
  %14 = zext i16 %13 to i32
  %15 = udiv i32 %10, %14
  %16 = mul i32 %15, %14
  %17 = icmp ugt i32 %10, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %6
  %21 = add i32 %20, %5
  %22 = mul i32 %21, %2
  %23 = icmp sgt i32 %2, 0
  br i1 %23, label %24, label %48

24:                                               ; preds = %3
  %25 = and i32 %2, 7
  %26 = icmp ult i32 %2, 8
  br i1 %26, label %29, label %27

27:                                               ; preds = %24
  %28 = and i32 %2, -8
  br label %52

29:                                               ; preds = %52, %24
  %30 = phi float [ undef, %24 ], [ %118, %52 ]
  %31 = phi i32 [ 0, %24 ], [ %119, %52 ]
  %32 = phi float [ 0.000000e+00, %24 ], [ %118, %52 ]
  %33 = icmp eq i32 %25, 0
  br i1 %33, label %48, label %34

34:                                               ; preds = %29, %34
  %35 = phi i32 [ %45, %34 ], [ %31, %29 ]
  %36 = phi float [ %44, %34 ], [ %32, %29 ]
  %37 = phi i32 [ %46, %34 ], [ 0, %29 ]
  %38 = add i32 %35, %22
  %39 = shl i32 %38, 6
  %40 = add i32 %39, %4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !16, !amdgpu.noclobber !15
  %44 = fadd contract float %36, %43
  %45 = add nuw nsw i32 %35, 1
  %46 = add i32 %37, 1
  %47 = icmp eq i32 %46, %25
  br i1 %47, label %48, label %34, !llvm.loop !20

48:                                               ; preds = %29, %34, %3
  %49 = phi float [ 0.000000e+00, %3 ], [ %30, %29 ], [ %44, %34 ]
  %50 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ24reduce_normal_eqs_64_GPUPfS_iE4DATA, i32 0, i32 %4
  store float %49, float addrspace(3)* %50, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %51 = icmp ult i32 %4, 32
  br i1 %51, label %122, label %153

52:                                               ; preds = %52, %27
  %53 = phi i32 [ 0, %27 ], [ %119, %52 ]
  %54 = phi float [ 0.000000e+00, %27 ], [ %118, %52 ]
  %55 = phi i32 [ 0, %27 ], [ %120, %52 ]
  %56 = add i32 %53, %22
  %57 = shl i32 %56, 6
  %58 = add i32 %57, %4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !16, !amdgpu.noclobber !15
  %62 = fadd contract float %54, %61
  %63 = or i32 %53, 1
  %64 = add i32 %63, %22
  %65 = shl i32 %64, 6
  %66 = add i32 %65, %4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !16, !amdgpu.noclobber !15
  %70 = fadd contract float %62, %69
  %71 = or i32 %53, 2
  %72 = add i32 %71, %22
  %73 = shl i32 %72, 6
  %74 = add i32 %73, %4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !16, !amdgpu.noclobber !15
  %78 = fadd contract float %70, %77
  %79 = or i32 %53, 3
  %80 = add i32 %79, %22
  %81 = shl i32 %80, 6
  %82 = add i32 %81, %4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !16, !amdgpu.noclobber !15
  %86 = fadd contract float %78, %85
  %87 = or i32 %53, 4
  %88 = add i32 %87, %22
  %89 = shl i32 %88, 6
  %90 = add i32 %89, %4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !16, !amdgpu.noclobber !15
  %94 = fadd contract float %86, %93
  %95 = or i32 %53, 5
  %96 = add i32 %95, %22
  %97 = shl i32 %96, 6
  %98 = add i32 %97, %4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %1, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !16, !amdgpu.noclobber !15
  %102 = fadd contract float %94, %101
  %103 = or i32 %53, 6
  %104 = add i32 %103, %22
  %105 = shl i32 %104, 6
  %106 = add i32 %105, %4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %1, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !16, !amdgpu.noclobber !15
  %110 = fadd contract float %102, %109
  %111 = or i32 %53, 7
  %112 = add i32 %111, %22
  %113 = shl i32 %112, 6
  %114 = add i32 %113, %4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %1, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !16, !amdgpu.noclobber !15
  %118 = fadd contract float %110, %117
  %119 = add nuw nsw i32 %53, 8
  %120 = add i32 %55, 8
  %121 = icmp eq i32 %120, %28
  br i1 %121, label %29, label %52, !llvm.loop !22

122:                                              ; preds = %48
  %123 = add nuw nsw i32 %4, 32
  %124 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ24reduce_normal_eqs_64_GPUPfS_iE4DATA, i32 0, i32 %123
  %125 = load float, float addrspace(3)* %124, align 4, !tbaa !16
  %126 = load float, float addrspace(3)* %50, align 4, !tbaa !16
  %127 = fadd contract float %125, %126
  store float %127, float addrspace(3)* %50, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %128 = add nuw nsw i32 %4, 16
  %129 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ24reduce_normal_eqs_64_GPUPfS_iE4DATA, i32 0, i32 %128
  %130 = load float, float addrspace(3)* %129, align 4, !tbaa !16
  %131 = load float, float addrspace(3)* %50, align 4, !tbaa !16
  %132 = fadd contract float %130, %131
  store float %132, float addrspace(3)* %50, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %133 = add nuw nsw i32 %4, 8
  %134 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ24reduce_normal_eqs_64_GPUPfS_iE4DATA, i32 0, i32 %133
  %135 = load float, float addrspace(3)* %134, align 4, !tbaa !16
  %136 = load float, float addrspace(3)* %50, align 4, !tbaa !16
  %137 = fadd contract float %135, %136
  store float %137, float addrspace(3)* %50, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %138 = add nuw nsw i32 %4, 4
  %139 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ24reduce_normal_eqs_64_GPUPfS_iE4DATA, i32 0, i32 %138
  %140 = load float, float addrspace(3)* %139, align 4, !tbaa !16
  %141 = load float, float addrspace(3)* %50, align 4, !tbaa !16
  %142 = fadd contract float %140, %141
  store float %142, float addrspace(3)* %50, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %143 = add nuw nsw i32 %4, 2
  %144 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ24reduce_normal_eqs_64_GPUPfS_iE4DATA, i32 0, i32 %143
  %145 = load float, float addrspace(3)* %144, align 4, !tbaa !16
  %146 = load float, float addrspace(3)* %50, align 4, !tbaa !16
  %147 = fadd contract float %145, %146
  store float %147, float addrspace(3)* %50, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %148 = add nuw nsw i32 %4, 1
  %149 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ24reduce_normal_eqs_64_GPUPfS_iE4DATA, i32 0, i32 %148
  %150 = load float, float addrspace(3)* %149, align 4, !tbaa !16
  %151 = load float, float addrspace(3)* %50, align 4, !tbaa !16
  %152 = fadd contract float %150, %151
  store float %152, float addrspace(3)* %50, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %153

153:                                              ; preds = %122, %48
  %154 = icmp eq i32 %4, 0
  br i1 %154, label %155, label %159

155:                                              ; preds = %153
  %156 = load float, float addrspace(3)* getelementptr inbounds ([64 x float], [64 x float] addrspace(3)* @_ZZ24reduce_normal_eqs_64_GPUPfS_iE4DATA, i32 0, i32 0), align 16, !tbaa !16
  %157 = zext i32 %21 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %0, i64 %157
  store float %156, float addrspace(1)* %158, align 4, !tbaa !16
  br label %159

159:                                              ; preds = %155, %153
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
