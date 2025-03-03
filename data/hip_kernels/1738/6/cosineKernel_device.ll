; ModuleID = '../data/hip_kernels/1738/6/main.cu'
source_filename = "../data/hip_kernels/1738/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12cosineKernelPfS_S_S_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture writeonly %3, float addrspace(1)* nocapture writeonly %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !7
  %17 = shl i32 %8, 1
  %18 = mul i32 %17, %13
  %19 = add i32 %18, %7
  %20 = udiv i32 %16, %13
  %21 = mul i32 %20, %13
  %22 = icmp ugt i32 %16, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %13
  %26 = icmp ult i32 %19, %5
  br i1 %26, label %27, label %164

27:                                               ; preds = %6
  %28 = mul nuw nsw i32 %7, 3
  %29 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %28
  %30 = add nuw nsw i32 %28, 1
  %31 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %30
  %32 = add nuw nsw i32 %28, 2
  %33 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %32
  %34 = icmp ugt i16 %12, 193
  %35 = icmp ult i32 %7, 32
  %36 = add nuw nsw i32 %28, 96
  %37 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %36
  %38 = add nuw nsw i32 %28, 97
  %39 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %38
  %40 = add nuw nsw i32 %28, 98
  %41 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %40
  %42 = add nuw nsw i32 %28, 48
  %43 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %42
  %44 = add nuw nsw i32 %28, 49
  %45 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %44
  %46 = add nuw nsw i32 %28, 50
  %47 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %46
  %48 = add nuw nsw i32 %28, 24
  %49 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %48
  %50 = add nuw nsw i32 %28, 25
  %51 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %50
  %52 = add nuw nsw i32 %28, 26
  %53 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %52
  %54 = add nuw nsw i32 %28, 12
  %55 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %54
  %56 = add nuw nsw i32 %28, 13
  %57 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %56
  %58 = add nuw nsw i32 %28, 14
  %59 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %58
  %60 = add nuw nsw i32 %28, 6
  %61 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %60
  %62 = add nuw nsw i32 %28, 7
  %63 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %62
  %64 = add nuw nsw i32 %28, 8
  %65 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %64
  %66 = add nuw nsw i32 %28, 3
  %67 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %66
  %68 = add nuw nsw i32 %28, 4
  %69 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %68
  %70 = add nuw nsw i32 %28, 5
  %71 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %70
  %72 = icmp eq i32 %7, 0
  %73 = zext i32 %8 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %2, i64 %73
  %75 = getelementptr inbounds float, float addrspace(1)* %3, i64 %73
  %76 = getelementptr inbounds float, float addrspace(1)* %4, i64 %73
  br label %77

77:                                               ; preds = %27, %161
  %78 = phi i32 [ %19, %27 ], [ %162, %161 ]
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !16
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !16
  %84 = fmul contract float %81, %83
  %85 = add i32 %78, %13
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !16
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16
  %91 = fmul contract float %88, %90
  %92 = fadd contract float %84, %91
  store float %92, float addrspace(3)* %29, align 4, !tbaa !16
  store float %92, float addrspace(3)* %31, align 4, !tbaa !16
  store float %92, float addrspace(3)* %33, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %34, label %94, label %93

93:                                               ; preds = %114, %77
  br i1 %35, label %116, label %156

94:                                               ; preds = %77, %114
  %95 = phi i32 [ %96, %114 ], [ %13, %77 ]
  %96 = lshr i32 %95, 1
  %97 = icmp ult i32 %7, %96
  br i1 %97, label %98, label %114

98:                                               ; preds = %94
  %99 = add nuw nsw i32 %96, %28
  %100 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %99
  %101 = load float, float addrspace(3)* %100, align 4, !tbaa !16
  %102 = load float, float addrspace(3)* %29, align 4, !tbaa !16
  %103 = fadd contract float %101, %102
  store float %103, float addrspace(3)* %29, align 4, !tbaa !16
  %104 = add nuw nsw i32 %99, 1
  %105 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %104
  %106 = load float, float addrspace(3)* %105, align 4, !tbaa !16
  %107 = load float, float addrspace(3)* %31, align 4, !tbaa !16
  %108 = fadd contract float %106, %107
  store float %108, float addrspace(3)* %31, align 4, !tbaa !16
  %109 = add nuw nsw i32 %99, 2
  %110 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %109
  %111 = load float, float addrspace(3)* %110, align 4, !tbaa !16
  %112 = load float, float addrspace(3)* %33, align 4, !tbaa !16
  %113 = fadd contract float %111, %112
  store float %113, float addrspace(3)* %33, align 4, !tbaa !16
  br label %114

114:                                              ; preds = %94, %98
  %115 = icmp ugt i32 %95, 387
  br i1 %115, label %94, label %93, !llvm.loop !20

116:                                              ; preds = %93
  %117 = load float, float addrspace(3)* %37, align 4, !tbaa !16
  %118 = load float, float addrspace(3)* %29, align 4, !tbaa !16
  %119 = fadd contract float %117, %118
  %120 = load float, float addrspace(3)* %39, align 4, !tbaa !16
  %121 = load float, float addrspace(3)* %31, align 4, !tbaa !16
  %122 = fadd contract float %120, %121
  %123 = load float, float addrspace(3)* %41, align 4, !tbaa !16
  %124 = load float, float addrspace(3)* %33, align 4, !tbaa !16
  %125 = fadd contract float %123, %124
  %126 = load float, float addrspace(3)* %43, align 4, !tbaa !16
  %127 = fadd contract float %119, %126
  %128 = load float, float addrspace(3)* %45, align 4, !tbaa !16
  %129 = fadd contract float %122, %128
  %130 = load float, float addrspace(3)* %47, align 4, !tbaa !16
  %131 = fadd contract float %125, %130
  %132 = load float, float addrspace(3)* %49, align 4, !tbaa !16
  %133 = fadd contract float %127, %132
  %134 = load float, float addrspace(3)* %51, align 4, !tbaa !16
  %135 = fadd contract float %129, %134
  %136 = load float, float addrspace(3)* %53, align 4, !tbaa !16
  %137 = fadd contract float %131, %136
  %138 = load float, float addrspace(3)* %55, align 4, !tbaa !16
  %139 = fadd contract float %133, %138
  %140 = load float, float addrspace(3)* %57, align 4, !tbaa !16
  %141 = fadd contract float %135, %140
  %142 = load float, float addrspace(3)* %59, align 4, !tbaa !16
  %143 = fadd contract float %137, %142
  %144 = load float, float addrspace(3)* %61, align 4, !tbaa !16
  %145 = fadd contract float %139, %144
  %146 = load float, float addrspace(3)* %63, align 4, !tbaa !16
  %147 = fadd contract float %141, %146
  %148 = load float, float addrspace(3)* %65, align 4, !tbaa !16
  %149 = fadd contract float %143, %148
  %150 = load float, float addrspace(3)* %67, align 4, !tbaa !16
  %151 = fadd contract float %145, %150
  store float %151, float addrspace(3)* %29, align 4, !tbaa !16
  %152 = load float, float addrspace(3)* %69, align 4, !tbaa !16
  %153 = fadd contract float %147, %152
  store float %153, float addrspace(3)* %31, align 4, !tbaa !16
  %154 = load float, float addrspace(3)* %71, align 4, !tbaa !16
  %155 = fadd contract float %149, %154
  store float %155, float addrspace(3)* %33, align 4, !tbaa !16
  br label %156

156:                                              ; preds = %116, %93
  br i1 %72, label %157, label %161

157:                                              ; preds = %156
  %158 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 0), align 4, !tbaa !16
  store float %158, float addrspace(1)* %74, align 4, !tbaa !16
  %159 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 1), align 4, !tbaa !16
  store float %159, float addrspace(1)* %75, align 4, !tbaa !16
  %160 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 2), align 4, !tbaa !16
  store float %160, float addrspace(1)* %76, align 4, !tbaa !16
  br label %161

161:                                              ; preds = %157, %156
  %162 = add i32 %78, %25
  %163 = icmp ult i32 %162, %5
  br i1 %163, label %77, label %164, !llvm.loop !22

164:                                              ; preds = %161, %6
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
!22 = distinct !{!22, !21}
