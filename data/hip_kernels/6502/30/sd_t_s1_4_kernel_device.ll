; ModuleID = '../data/hip_kernels/6502/30/main.cu'
source_filename = "../data/hip_kernels/6502/30/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16sd_t_s1_4_kerneliiiiiiiiiiiiiiiiiiPdS_S_iiE6t2_shm = internal unnamed_addr addrspace(3) global [512 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16sd_t_s1_4_kerneliiiiiiiiiiiiiiiiiiPdS_S_ii(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 %15, i32 %16, i32 %17, double addrspace(1)* nocapture %18, double addrspace(1)* nocapture readonly %19, double addrspace(1)* nocapture readonly %20, i32 %21, i32 %22) local_unnamed_addr #0 {
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %25 = mul nsw i32 %3, %0
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %33

27:                                               ; preds = %23
  %28 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %29 = getelementptr i8, i8 addrspace(4)* %28, i64 4
  %30 = bitcast i8 addrspace(4)* %29 to i16 addrspace(4)*
  %31 = load i16, i16 addrspace(4)* %30, align 4, !range !5, !invariant.load !6
  %32 = zext i16 %31 to i32
  br label %59

33:                                               ; preds = %59, %23
  %34 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %35 = shl nsw i32 %34, 8
  %36 = add i32 %35, %24
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %37 = icmp sgt i32 %22, 0
  br i1 %37, label %38, label %67

38:                                               ; preds = %33
  %39 = icmp slt i32 %0, 1
  %40 = icmp sgt i32 %3, 0
  %41 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %42 = getelementptr inbounds i8, i8 addrspace(4)* %41, i64 12
  %43 = bitcast i8 addrspace(4)* %42 to i32 addrspace(4)*
  %44 = load i32, i32 addrspace(4)* %43, align 4, !tbaa !7
  %45 = getelementptr i8, i8 addrspace(4)* %41, i64 4
  %46 = bitcast i8 addrspace(4)* %45 to i16 addrspace(4)*
  %47 = load i16, i16 addrspace(4)* %46, align 4, !range !5, !invariant.load !6
  %48 = zext i16 %47 to i32
  %49 = udiv i32 %44, %48
  %50 = mul i32 %49, %48
  %51 = icmp ugt i32 %44, %50
  %52 = zext i1 %51 to i32
  %53 = add i32 %49, %52
  %54 = mul i32 %53, %48
  %55 = and i32 %3, 3
  %56 = icmp ult i32 %3, 4
  %57 = and i32 %3, -4
  %58 = icmp eq i32 %55, 0
  br label %68

59:                                               ; preds = %27, %59
  %60 = phi i32 [ %24, %27 ], [ %65, %59 ]
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds double, double addrspace(1)* %19, i64 %61
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !16, !amdgpu.noclobber !6
  %64 = getelementptr inbounds [512 x double], [512 x double] addrspace(3)* @_ZZ16sd_t_s1_4_kerneliiiiiiiiiiiiiiiiiiPdS_S_iiE6t2_shm, i32 0, i32 %60
  store double %63, double addrspace(3)* %64, align 8, !tbaa !16
  %65 = add i32 %60, %32
  %66 = icmp slt i32 %65, %25
  br i1 %66, label %59, label %33, !llvm.loop !20

67:                                               ; preds = %187, %33
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void

68:                                               ; preds = %38, %187
  %69 = phi i32 [ 0, %38 ], [ %188, %187 ]
  %70 = phi i32 [ %36, %38 ], [ %82, %187 ]
  %71 = add nsw i32 %69, %70
  %72 = freeze i32 %71
  %73 = freeze i32 %2
  %74 = sdiv i32 %72, %73
  %75 = mul i32 %74, %73
  %76 = sub i32 %72, %75
  %77 = freeze i32 %1
  %78 = sdiv i32 %74, %77
  %79 = mul i32 %78, %77
  %80 = sub i32 %74, %79
  %81 = freeze i32 %5
  %82 = sdiv i32 %78, %81
  %83 = mul i32 %82, %81
  %84 = sub i32 %78, %83
  %85 = srem i32 %82, %4
  %86 = add nsw i32 %69, %36
  %87 = icmp sge i32 %86, %22
  %88 = select i1 %87, i1 true, i1 %39
  br i1 %88, label %187, label %89

89:                                               ; preds = %68
  %90 = mul nsw i32 %76, %8
  %91 = mul nsw i32 %80, %9
  %92 = add nsw i32 %91, %90
  %93 = mul nsw i32 %84, %10
  %94 = add nsw i32 %92, %93
  %95 = mul nsw i32 %85, %11
  %96 = add nsw i32 %94, %95
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds double, double addrspace(1)* %20, i64 %97
  %99 = mul nsw i32 %76, %12
  %100 = mul nsw i32 %80, %13
  %101 = add nsw i32 %100, %99
  %102 = mul nsw i32 %84, %15
  %103 = mul nsw i32 %85, %16
  %104 = add i32 %101, %102
  %105 = add i32 %104, %103
  br label %106

106:                                              ; preds = %89, %184
  %107 = phi i32 [ 0, %89 ], [ %185, %184 ]
  br i1 %40, label %108, label %184

108:                                              ; preds = %106
  %109 = mul nsw i32 %107, %3
  %110 = mul nsw i32 %107, %14
  %111 = add i32 %105, %110
  br i1 %56, label %165, label %112

112:                                              ; preds = %108, %112
  %113 = phi i32 [ %162, %112 ], [ 0, %108 ]
  %114 = phi i32 [ %163, %112 ], [ 0, %108 ]
  %115 = add nsw i32 %113, %109
  %116 = getelementptr inbounds [512 x double], [512 x double] addrspace(3)* @_ZZ16sd_t_s1_4_kerneliiiiiiiiiiiiiiiiiiPdS_S_iiE6t2_shm, i32 0, i32 %115
  %117 = load double, double addrspace(3)* %116, align 8, !tbaa !16
  %118 = load double, double addrspace(1)* %98, align 8, !tbaa !16
  %119 = fmul contract double %117, %118
  %120 = mul nsw i32 %113, %17
  %121 = add i32 %111, %120
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds double, double addrspace(1)* %18, i64 %122
  %124 = load double, double addrspace(1)* %123, align 8, !tbaa !16
  %125 = fsub contract double %124, %119
  store double %125, double addrspace(1)* %123, align 8, !tbaa !16
  %126 = or i32 %113, 1
  %127 = add nsw i32 %126, %109
  %128 = getelementptr inbounds [512 x double], [512 x double] addrspace(3)* @_ZZ16sd_t_s1_4_kerneliiiiiiiiiiiiiiiiiiPdS_S_iiE6t2_shm, i32 0, i32 %127
  %129 = load double, double addrspace(3)* %128, align 8, !tbaa !16
  %130 = load double, double addrspace(1)* %98, align 8, !tbaa !16
  %131 = fmul contract double %129, %130
  %132 = mul nsw i32 %126, %17
  %133 = add i32 %111, %132
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds double, double addrspace(1)* %18, i64 %134
  %136 = load double, double addrspace(1)* %135, align 8, !tbaa !16
  %137 = fsub contract double %136, %131
  store double %137, double addrspace(1)* %135, align 8, !tbaa !16
  %138 = or i32 %113, 2
  %139 = add nsw i32 %138, %109
  %140 = getelementptr inbounds [512 x double], [512 x double] addrspace(3)* @_ZZ16sd_t_s1_4_kerneliiiiiiiiiiiiiiiiiiPdS_S_iiE6t2_shm, i32 0, i32 %139
  %141 = load double, double addrspace(3)* %140, align 8, !tbaa !16
  %142 = load double, double addrspace(1)* %98, align 8, !tbaa !16
  %143 = fmul contract double %141, %142
  %144 = mul nsw i32 %138, %17
  %145 = add i32 %111, %144
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds double, double addrspace(1)* %18, i64 %146
  %148 = load double, double addrspace(1)* %147, align 8, !tbaa !16
  %149 = fsub contract double %148, %143
  store double %149, double addrspace(1)* %147, align 8, !tbaa !16
  %150 = or i32 %113, 3
  %151 = add nsw i32 %150, %109
  %152 = getelementptr inbounds [512 x double], [512 x double] addrspace(3)* @_ZZ16sd_t_s1_4_kerneliiiiiiiiiiiiiiiiiiPdS_S_iiE6t2_shm, i32 0, i32 %151
  %153 = load double, double addrspace(3)* %152, align 8, !tbaa !16
  %154 = load double, double addrspace(1)* %98, align 8, !tbaa !16
  %155 = fmul contract double %153, %154
  %156 = mul nsw i32 %150, %17
  %157 = add i32 %111, %156
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds double, double addrspace(1)* %18, i64 %158
  %160 = load double, double addrspace(1)* %159, align 8, !tbaa !16
  %161 = fsub contract double %160, %155
  store double %161, double addrspace(1)* %159, align 8, !tbaa !16
  %162 = add nuw nsw i32 %113, 4
  %163 = add i32 %114, 4
  %164 = icmp eq i32 %163, %57
  br i1 %164, label %165, label %112, !llvm.loop !22

165:                                              ; preds = %112, %108
  %166 = phi i32 [ 0, %108 ], [ %162, %112 ]
  br i1 %58, label %184, label %167

167:                                              ; preds = %165, %167
  %168 = phi i32 [ %181, %167 ], [ %166, %165 ]
  %169 = phi i32 [ %182, %167 ], [ 0, %165 ]
  %170 = add nsw i32 %168, %109
  %171 = getelementptr inbounds [512 x double], [512 x double] addrspace(3)* @_ZZ16sd_t_s1_4_kerneliiiiiiiiiiiiiiiiiiPdS_S_iiE6t2_shm, i32 0, i32 %170
  %172 = load double, double addrspace(3)* %171, align 8, !tbaa !16
  %173 = load double, double addrspace(1)* %98, align 8, !tbaa !16
  %174 = fmul contract double %172, %173
  %175 = mul nsw i32 %168, %17
  %176 = add i32 %111, %175
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds double, double addrspace(1)* %18, i64 %177
  %179 = load double, double addrspace(1)* %178, align 8, !tbaa !16
  %180 = fsub contract double %179, %174
  store double %180, double addrspace(1)* %178, align 8, !tbaa !16
  %181 = add nuw nsw i32 %168, 1
  %182 = add i32 %169, 1
  %183 = icmp eq i32 %182, %55
  br i1 %183, label %184, label %167, !llvm.loop !23

184:                                              ; preds = %165, %167, %106
  %185 = add nuw nsw i32 %107, 1
  %186 = icmp eq i32 %185, %0
  br i1 %186, label %187, label %106, !llvm.loop !25

187:                                              ; preds = %184, %68
  %188 = add i32 %54, %69
  %189 = icmp slt i32 %188, %22
  br i1 %189, label %68, label %67, !llvm.loop !26
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
