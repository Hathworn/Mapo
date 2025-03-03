; ModuleID = '../data/hip_kernels/8897/26/main.cu'
source_filename = "../data/hip_kernels/8897/26/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16sd_t_s1_8_kernelmmmmmmmmmmmmmmmPdS_S_mmE6t2_shm = internal unnamed_addr addrspace(3) global [1024 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16sd_t_s1_8_kernelmmmmmmmmmmmmmmmPdS_S_mm(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13, i64 %14, double addrspace(1)* nocapture %15, double addrspace(1)* nocapture readonly %16, double addrspace(1)* nocapture readonly %17, i64 %18, i64 %19) local_unnamed_addr #0 {
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %22 = zext i32 %21 to i64
  %23 = mul i64 %3, %0
  %24 = icmp ugt i64 %23, %22
  br i1 %24, label %25, label %31

25:                                               ; preds = %20
  %26 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %27 = getelementptr i8, i8 addrspace(4)* %26, i64 4
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = load i16, i16 addrspace(4)* %28, align 4, !range !5, !invariant.load !6
  %30 = zext i16 %29 to i64
  br label %59

31:                                               ; preds = %59, %20
  %32 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %33 = zext i32 %32 to i64
  %34 = shl nuw nsw i64 %33, 8
  %35 = add nuw nsw i64 %34, %22
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = icmp eq i64 %19, 0
  br i1 %36, label %67, label %37

37:                                               ; preds = %31
  %38 = icmp eq i64 %0, 0
  %39 = icmp eq i64 %3, 0
  %40 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %41 = getelementptr inbounds i8, i8 addrspace(4)* %40, i64 12
  %42 = bitcast i8 addrspace(4)* %41 to i32 addrspace(4)*
  %43 = load i32, i32 addrspace(4)* %42, align 4, !tbaa !7
  %44 = getelementptr i8, i8 addrspace(4)* %40, i64 4
  %45 = bitcast i8 addrspace(4)* %44 to i16 addrspace(4)*
  %46 = load i16, i16 addrspace(4)* %45, align 4, !range !5, !invariant.load !6
  %47 = zext i16 %46 to i32
  %48 = udiv i32 %43, %47
  %49 = mul i32 %48, %47
  %50 = icmp ugt i32 %43, %49
  %51 = zext i1 %50 to i32
  %52 = add i32 %48, %51
  %53 = mul i32 %52, %47
  %54 = zext i32 %53 to i64
  %55 = and i64 %3, 3
  %56 = icmp ult i64 %3, 4
  %57 = and i64 %3, -4
  %58 = icmp eq i64 %55, 0
  br label %68

59:                                               ; preds = %25, %59
  %60 = phi i64 [ %22, %25 ], [ %65, %59 ]
  %61 = getelementptr inbounds double, double addrspace(1)* %16, i64 %60
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !16, !amdgpu.noclobber !6
  %63 = trunc i64 %60 to i32
  %64 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ16sd_t_s1_8_kernelmmmmmmmmmmmmmmmPdS_S_mmE6t2_shm, i32 0, i32 %63
  store double %62, double addrspace(3)* %64, align 8, !tbaa !16
  %65 = add i64 %60, %30
  %66 = icmp ult i64 %65, %23
  br i1 %66, label %59, label %31, !llvm.loop !20

67:                                               ; preds = %178, %31
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void

68:                                               ; preds = %37, %178
  %69 = phi i64 [ 0, %37 ], [ %179, %178 ]
  %70 = phi i64 [ %35, %37 ], [ %78, %178 ]
  %71 = add i64 %69, %70
  %72 = freeze i64 %71
  %73 = freeze i64 %2
  %74 = udiv i64 %72, %73
  %75 = mul i64 %74, %73
  %76 = sub i64 %72, %75
  %77 = freeze i64 %1
  %78 = udiv i64 %74, %77
  %79 = mul i64 %78, %77
  %80 = sub i64 %74, %79
  %81 = urem i64 %78, %4
  %82 = add i64 %69, %35
  %83 = icmp uge i64 %82, %19
  %84 = select i1 %83, i1 true, i1 %38
  br i1 %84, label %178, label %85

85:                                               ; preds = %68
  %86 = mul i64 %76, %7
  %87 = mul i64 %80, %8
  %88 = add i64 %87, %86
  %89 = mul i64 %81, %9
  %90 = add i64 %88, %89
  %91 = getelementptr inbounds double, double addrspace(1)* %17, i64 %90
  %92 = mul i64 %76, %10
  %93 = mul i64 %80, %11
  %94 = add i64 %93, %92
  %95 = mul i64 %81, %13
  %96 = add i64 %94, %95
  br label %97

97:                                               ; preds = %85, %175
  %98 = phi i64 [ 0, %85 ], [ %176, %175 ]
  br i1 %39, label %175, label %99

99:                                               ; preds = %97
  %100 = mul i64 %98, %3
  %101 = mul i64 %98, %12
  %102 = add i64 %96, %101
  br i1 %56, label %156, label %103

103:                                              ; preds = %99, %103
  %104 = phi i64 [ %153, %103 ], [ 0, %99 ]
  %105 = phi i64 [ %154, %103 ], [ 0, %99 ]
  %106 = add i64 %104, %100
  %107 = trunc i64 %106 to i32
  %108 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ16sd_t_s1_8_kernelmmmmmmmmmmmmmmmPdS_S_mmE6t2_shm, i32 0, i32 %107
  %109 = load double, double addrspace(3)* %108, align 8, !tbaa !16
  %110 = load double, double addrspace(1)* %91, align 8, !tbaa !16
  %111 = fmul contract double %109, %110
  %112 = mul i64 %104, %14
  %113 = add i64 %102, %112
  %114 = getelementptr inbounds double, double addrspace(1)* %15, i64 %113
  %115 = load double, double addrspace(1)* %114, align 8, !tbaa !16
  %116 = fsub contract double %115, %111
  store double %116, double addrspace(1)* %114, align 8, !tbaa !16
  %117 = or i64 %104, 1
  %118 = add i64 %117, %100
  %119 = trunc i64 %118 to i32
  %120 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ16sd_t_s1_8_kernelmmmmmmmmmmmmmmmPdS_S_mmE6t2_shm, i32 0, i32 %119
  %121 = load double, double addrspace(3)* %120, align 8, !tbaa !16
  %122 = load double, double addrspace(1)* %91, align 8, !tbaa !16
  %123 = fmul contract double %121, %122
  %124 = mul i64 %117, %14
  %125 = add i64 %102, %124
  %126 = getelementptr inbounds double, double addrspace(1)* %15, i64 %125
  %127 = load double, double addrspace(1)* %126, align 8, !tbaa !16
  %128 = fsub contract double %127, %123
  store double %128, double addrspace(1)* %126, align 8, !tbaa !16
  %129 = or i64 %104, 2
  %130 = add i64 %129, %100
  %131 = trunc i64 %130 to i32
  %132 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ16sd_t_s1_8_kernelmmmmmmmmmmmmmmmPdS_S_mmE6t2_shm, i32 0, i32 %131
  %133 = load double, double addrspace(3)* %132, align 8, !tbaa !16
  %134 = load double, double addrspace(1)* %91, align 8, !tbaa !16
  %135 = fmul contract double %133, %134
  %136 = mul i64 %129, %14
  %137 = add i64 %102, %136
  %138 = getelementptr inbounds double, double addrspace(1)* %15, i64 %137
  %139 = load double, double addrspace(1)* %138, align 8, !tbaa !16
  %140 = fsub contract double %139, %135
  store double %140, double addrspace(1)* %138, align 8, !tbaa !16
  %141 = or i64 %104, 3
  %142 = add i64 %141, %100
  %143 = trunc i64 %142 to i32
  %144 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ16sd_t_s1_8_kernelmmmmmmmmmmmmmmmPdS_S_mmE6t2_shm, i32 0, i32 %143
  %145 = load double, double addrspace(3)* %144, align 8, !tbaa !16
  %146 = load double, double addrspace(1)* %91, align 8, !tbaa !16
  %147 = fmul contract double %145, %146
  %148 = mul i64 %141, %14
  %149 = add i64 %102, %148
  %150 = getelementptr inbounds double, double addrspace(1)* %15, i64 %149
  %151 = load double, double addrspace(1)* %150, align 8, !tbaa !16
  %152 = fsub contract double %151, %147
  store double %152, double addrspace(1)* %150, align 8, !tbaa !16
  %153 = add nuw i64 %104, 4
  %154 = add i64 %105, 4
  %155 = icmp eq i64 %154, %57
  br i1 %155, label %156, label %103, !llvm.loop !22

156:                                              ; preds = %103, %99
  %157 = phi i64 [ 0, %99 ], [ %153, %103 ]
  br i1 %58, label %175, label %158

158:                                              ; preds = %156, %158
  %159 = phi i64 [ %172, %158 ], [ %157, %156 ]
  %160 = phi i64 [ %173, %158 ], [ 0, %156 ]
  %161 = add i64 %159, %100
  %162 = trunc i64 %161 to i32
  %163 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ16sd_t_s1_8_kernelmmmmmmmmmmmmmmmPdS_S_mmE6t2_shm, i32 0, i32 %162
  %164 = load double, double addrspace(3)* %163, align 8, !tbaa !16
  %165 = load double, double addrspace(1)* %91, align 8, !tbaa !16
  %166 = fmul contract double %164, %165
  %167 = mul i64 %159, %14
  %168 = add i64 %102, %167
  %169 = getelementptr inbounds double, double addrspace(1)* %15, i64 %168
  %170 = load double, double addrspace(1)* %169, align 8, !tbaa !16
  %171 = fsub contract double %170, %166
  store double %171, double addrspace(1)* %169, align 8, !tbaa !16
  %172 = add nuw i64 %159, 1
  %173 = add i64 %160, 1
  %174 = icmp eq i64 %173, %55
  br i1 %174, label %175, label %158, !llvm.loop !23

175:                                              ; preds = %156, %158, %97
  %176 = add nuw i64 %98, 1
  %177 = icmp eq i64 %176, %0
  br i1 %177, label %178, label %97, !llvm.loop !25

178:                                              ; preds = %175, %68
  %179 = add i64 %69, %54
  %180 = icmp ult i64 %179, %19
  br i1 %180, label %68, label %67, !llvm.loop !26
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
