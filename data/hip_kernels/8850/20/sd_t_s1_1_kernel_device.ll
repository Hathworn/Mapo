; ModuleID = '../data/hip_kernels/8850/20/main.cu'
source_filename = "../data/hip_kernels/8850/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16sd_t_s1_1_kerneliiiiiiiiiiiiiiiPdS_iiS_E6t2_shm = internal unnamed_addr addrspace(3) global [512 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16sd_t_s1_1_kerneliiiiiiiiiiiiiiiPdS_iiS_(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14, double addrspace(1)* nocapture readonly %15, double addrspace(1)* nocapture readonly %16, i32 %17, i32 %18, double addrspace(1)* nocapture %19) local_unnamed_addr #0 {
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %22 = mul nsw i32 %3, %0
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %30

24:                                               ; preds = %20
  %25 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %26 = getelementptr i8, i8 addrspace(4)* %25, i64 4
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 4, !range !5, !invariant.load !6
  %29 = zext i16 %28 to i32
  br label %56

30:                                               ; preds = %56, %20
  %31 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %32 = shl nsw i32 %31, 8
  %33 = add i32 %32, %21
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %34 = icmp sgt i32 %18, 0
  br i1 %34, label %35, label %64

35:                                               ; preds = %30
  %36 = icmp slt i32 %0, 1
  %37 = icmp sgt i32 %3, 0
  %38 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %39 = getelementptr inbounds i8, i8 addrspace(4)* %38, i64 12
  %40 = bitcast i8 addrspace(4)* %39 to i32 addrspace(4)*
  %41 = load i32, i32 addrspace(4)* %40, align 4, !tbaa !7
  %42 = getelementptr i8, i8 addrspace(4)* %38, i64 4
  %43 = bitcast i8 addrspace(4)* %42 to i16 addrspace(4)*
  %44 = load i16, i16 addrspace(4)* %43, align 4, !range !5, !invariant.load !6
  %45 = zext i16 %44 to i32
  %46 = udiv i32 %41, %45
  %47 = mul i32 %46, %45
  %48 = icmp ugt i32 %41, %47
  %49 = zext i1 %48 to i32
  %50 = add i32 %46, %49
  %51 = mul i32 %50, %45
  %52 = and i32 %3, 3
  %53 = icmp ult i32 %3, 4
  %54 = and i32 %3, -4
  %55 = icmp eq i32 %52, 0
  br label %65

56:                                               ; preds = %24, %56
  %57 = phi i32 [ %21, %24 ], [ %62, %56 ]
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds double, double addrspace(1)* %15, i64 %58
  %60 = load double, double addrspace(1)* %59, align 8, !tbaa !16, !amdgpu.noclobber !6
  %61 = getelementptr inbounds [512 x double], [512 x double] addrspace(3)* @_ZZ16sd_t_s1_1_kerneliiiiiiiiiiiiiiiPdS_iiS_E6t2_shm, i32 0, i32 %57
  store double %60, double addrspace(3)* %61, align 8, !tbaa !16
  %62 = add i32 %57, %29
  %63 = icmp slt i32 %62, %22
  br i1 %63, label %56, label %30, !llvm.loop !20

64:                                               ; preds = %176, %30
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void

65:                                               ; preds = %35, %176
  %66 = phi i32 [ 0, %35 ], [ %177, %176 ]
  %67 = phi i32 [ %33, %35 ], [ %75, %176 ]
  %68 = add nsw i32 %66, %67
  %69 = freeze i32 %68
  %70 = freeze i32 %2
  %71 = sdiv i32 %69, %70
  %72 = mul i32 %71, %70
  %73 = sub i32 %69, %72
  %74 = freeze i32 %1
  %75 = sdiv i32 %71, %74
  %76 = mul i32 %75, %74
  %77 = sub i32 %71, %76
  %78 = srem i32 %75, %4
  %79 = add nsw i32 %66, %33
  %80 = icmp sge i32 %79, %18
  %81 = select i1 %80, i1 true, i1 %36
  br i1 %81, label %176, label %82

82:                                               ; preds = %65
  %83 = mul nsw i32 %73, %7
  %84 = mul nsw i32 %77, %8
  %85 = add nsw i32 %84, %83
  %86 = mul nsw i32 %78, %9
  %87 = add nsw i32 %85, %86
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds double, double addrspace(1)* %16, i64 %88
  %90 = mul nsw i32 %73, %10
  %91 = mul nsw i32 %77, %11
  %92 = add nsw i32 %91, %90
  %93 = mul nsw i32 %78, %13
  %94 = add i32 %92, %93
  br label %95

95:                                               ; preds = %82, %173
  %96 = phi i32 [ 0, %82 ], [ %174, %173 ]
  br i1 %37, label %97, label %173

97:                                               ; preds = %95
  %98 = mul nsw i32 %96, %3
  %99 = mul nsw i32 %96, %12
  %100 = add i32 %94, %99
  br i1 %53, label %154, label %101

101:                                              ; preds = %97, %101
  %102 = phi i32 [ %151, %101 ], [ 0, %97 ]
  %103 = phi i32 [ %152, %101 ], [ 0, %97 ]
  %104 = add nsw i32 %102, %98
  %105 = getelementptr inbounds [512 x double], [512 x double] addrspace(3)* @_ZZ16sd_t_s1_1_kerneliiiiiiiiiiiiiiiPdS_iiS_E6t2_shm, i32 0, i32 %104
  %106 = load double, double addrspace(3)* %105, align 8, !tbaa !16
  %107 = load double, double addrspace(1)* %89, align 8, !tbaa !16
  %108 = fmul contract double %106, %107
  %109 = mul nsw i32 %102, %14
  %110 = add i32 %100, %109
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds double, double addrspace(1)* %19, i64 %111
  %113 = load double, double addrspace(1)* %112, align 8, !tbaa !16
  %114 = fadd contract double %113, %108
  store double %114, double addrspace(1)* %112, align 8, !tbaa !16
  %115 = or i32 %102, 1
  %116 = add nsw i32 %115, %98
  %117 = getelementptr inbounds [512 x double], [512 x double] addrspace(3)* @_ZZ16sd_t_s1_1_kerneliiiiiiiiiiiiiiiPdS_iiS_E6t2_shm, i32 0, i32 %116
  %118 = load double, double addrspace(3)* %117, align 8, !tbaa !16
  %119 = load double, double addrspace(1)* %89, align 8, !tbaa !16
  %120 = fmul contract double %118, %119
  %121 = mul nsw i32 %115, %14
  %122 = add i32 %100, %121
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds double, double addrspace(1)* %19, i64 %123
  %125 = load double, double addrspace(1)* %124, align 8, !tbaa !16
  %126 = fadd contract double %125, %120
  store double %126, double addrspace(1)* %124, align 8, !tbaa !16
  %127 = or i32 %102, 2
  %128 = add nsw i32 %127, %98
  %129 = getelementptr inbounds [512 x double], [512 x double] addrspace(3)* @_ZZ16sd_t_s1_1_kerneliiiiiiiiiiiiiiiPdS_iiS_E6t2_shm, i32 0, i32 %128
  %130 = load double, double addrspace(3)* %129, align 8, !tbaa !16
  %131 = load double, double addrspace(1)* %89, align 8, !tbaa !16
  %132 = fmul contract double %130, %131
  %133 = mul nsw i32 %127, %14
  %134 = add i32 %100, %133
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds double, double addrspace(1)* %19, i64 %135
  %137 = load double, double addrspace(1)* %136, align 8, !tbaa !16
  %138 = fadd contract double %137, %132
  store double %138, double addrspace(1)* %136, align 8, !tbaa !16
  %139 = or i32 %102, 3
  %140 = add nsw i32 %139, %98
  %141 = getelementptr inbounds [512 x double], [512 x double] addrspace(3)* @_ZZ16sd_t_s1_1_kerneliiiiiiiiiiiiiiiPdS_iiS_E6t2_shm, i32 0, i32 %140
  %142 = load double, double addrspace(3)* %141, align 8, !tbaa !16
  %143 = load double, double addrspace(1)* %89, align 8, !tbaa !16
  %144 = fmul contract double %142, %143
  %145 = mul nsw i32 %139, %14
  %146 = add i32 %100, %145
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds double, double addrspace(1)* %19, i64 %147
  %149 = load double, double addrspace(1)* %148, align 8, !tbaa !16
  %150 = fadd contract double %149, %144
  store double %150, double addrspace(1)* %148, align 8, !tbaa !16
  %151 = add nuw nsw i32 %102, 4
  %152 = add i32 %103, 4
  %153 = icmp eq i32 %152, %54
  br i1 %153, label %154, label %101, !llvm.loop !22

154:                                              ; preds = %101, %97
  %155 = phi i32 [ 0, %97 ], [ %151, %101 ]
  br i1 %55, label %173, label %156

156:                                              ; preds = %154, %156
  %157 = phi i32 [ %170, %156 ], [ %155, %154 ]
  %158 = phi i32 [ %171, %156 ], [ 0, %154 ]
  %159 = add nsw i32 %157, %98
  %160 = getelementptr inbounds [512 x double], [512 x double] addrspace(3)* @_ZZ16sd_t_s1_1_kerneliiiiiiiiiiiiiiiPdS_iiS_E6t2_shm, i32 0, i32 %159
  %161 = load double, double addrspace(3)* %160, align 8, !tbaa !16
  %162 = load double, double addrspace(1)* %89, align 8, !tbaa !16
  %163 = fmul contract double %161, %162
  %164 = mul nsw i32 %157, %14
  %165 = add i32 %100, %164
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds double, double addrspace(1)* %19, i64 %166
  %168 = load double, double addrspace(1)* %167, align 8, !tbaa !16
  %169 = fadd contract double %168, %163
  store double %169, double addrspace(1)* %167, align 8, !tbaa !16
  %170 = add nuw nsw i32 %157, 1
  %171 = add i32 %158, 1
  %172 = icmp eq i32 %171, %52
  br i1 %172, label %173, label %156, !llvm.loop !23

173:                                              ; preds = %154, %156, %95
  %174 = add nuw nsw i32 %96, 1
  %175 = icmp eq i32 %174, %0
  br i1 %175, label %176, label %95, !llvm.loop !25

176:                                              ; preds = %173, %65
  %177 = add i32 %51, %66
  %178 = icmp slt i32 %177, %18
  br i1 %178, label %65, label %64, !llvm.loop !26
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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.unroll.disable"}
!25 = distinct !{!25, !21}
!26 = distinct !{!26, !21}
