; ModuleID = '../data/hip_kernels/8897/24/main.cu'
source_filename = "../data/hip_kernels/8897/24/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16sd_t_s1_6_kernelmmmmmmmmmmmmmmmmmmPdS_S_mmE6t2_shm = internal unnamed_addr addrspace(3) global [1024 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16sd_t_s1_6_kernelmmmmmmmmmmmmmmmmmmPdS_S_mm(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13, i64 %14, i64 %15, i64 %16, i64 %17, double addrspace(1)* nocapture %18, double addrspace(1)* nocapture readonly %19, double addrspace(1)* nocapture readonly %20, i64 %21, i64 %22) local_unnamed_addr #0 {
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %25 = zext i32 %24 to i64
  %26 = mul i64 %3, %0
  %27 = icmp ugt i64 %26, %25
  br i1 %27, label %28, label %34

28:                                               ; preds = %23
  %29 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %30 = getelementptr i8, i8 addrspace(4)* %29, i64 4
  %31 = bitcast i8 addrspace(4)* %30 to i16 addrspace(4)*
  %32 = load i16, i16 addrspace(4)* %31, align 4, !range !5, !invariant.load !6
  %33 = zext i16 %32 to i64
  br label %62

34:                                               ; preds = %62, %23
  %35 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %36 = zext i32 %35 to i64
  %37 = shl nuw nsw i64 %36, 8
  %38 = add nuw nsw i64 %37, %25
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = icmp eq i64 %22, 0
  br i1 %39, label %70, label %40

40:                                               ; preds = %34
  %41 = icmp eq i64 %0, 0
  %42 = icmp eq i64 %3, 0
  %43 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %44 = getelementptr inbounds i8, i8 addrspace(4)* %43, i64 12
  %45 = bitcast i8 addrspace(4)* %44 to i32 addrspace(4)*
  %46 = load i32, i32 addrspace(4)* %45, align 4, !tbaa !7
  %47 = getelementptr i8, i8 addrspace(4)* %43, i64 4
  %48 = bitcast i8 addrspace(4)* %47 to i16 addrspace(4)*
  %49 = load i16, i16 addrspace(4)* %48, align 4, !range !5, !invariant.load !6
  %50 = zext i16 %49 to i32
  %51 = udiv i32 %46, %50
  %52 = mul i32 %51, %50
  %53 = icmp ugt i32 %46, %52
  %54 = zext i1 %53 to i32
  %55 = add i32 %51, %54
  %56 = mul i32 %55, %50
  %57 = zext i32 %56 to i64
  %58 = and i64 %3, 3
  %59 = icmp ult i64 %3, 4
  %60 = and i64 %3, -4
  %61 = icmp eq i64 %58, 0
  br label %71

62:                                               ; preds = %28, %62
  %63 = phi i64 [ %25, %28 ], [ %68, %62 ]
  %64 = getelementptr inbounds double, double addrspace(1)* %19, i64 %63
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !16, !amdgpu.noclobber !6
  %66 = trunc i64 %63 to i32
  %67 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ16sd_t_s1_6_kernelmmmmmmmmmmmmmmmmmmPdS_S_mmE6t2_shm, i32 0, i32 %66
  store double %65, double addrspace(3)* %67, align 8, !tbaa !16
  %68 = add i64 %63, %33
  %69 = icmp ult i64 %68, %26
  br i1 %69, label %62, label %34, !llvm.loop !20

70:                                               ; preds = %189, %34
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void

71:                                               ; preds = %40, %189
  %72 = phi i64 [ 0, %40 ], [ %190, %189 ]
  %73 = phi i64 [ %38, %40 ], [ %85, %189 ]
  %74 = add i64 %72, %73
  %75 = freeze i64 %74
  %76 = freeze i64 %2
  %77 = udiv i64 %75, %76
  %78 = mul i64 %77, %76
  %79 = sub i64 %75, %78
  %80 = freeze i64 %1
  %81 = udiv i64 %77, %80
  %82 = mul i64 %81, %80
  %83 = sub i64 %77, %82
  %84 = freeze i64 %5
  %85 = udiv i64 %81, %84
  %86 = mul i64 %85, %84
  %87 = sub i64 %81, %86
  %88 = urem i64 %85, %4
  %89 = add i64 %72, %38
  %90 = icmp uge i64 %89, %22
  %91 = select i1 %90, i1 true, i1 %41
  br i1 %91, label %189, label %92

92:                                               ; preds = %71
  %93 = mul i64 %79, %8
  %94 = mul i64 %83, %9
  %95 = add i64 %94, %93
  %96 = mul i64 %87, %10
  %97 = add i64 %95, %96
  %98 = mul i64 %88, %11
  %99 = add i64 %97, %98
  %100 = getelementptr inbounds double, double addrspace(1)* %20, i64 %99
  %101 = mul i64 %79, %12
  %102 = mul i64 %83, %13
  %103 = add i64 %102, %101
  %104 = mul i64 %87, %15
  %105 = mul i64 %88, %16
  %106 = add i64 %103, %104
  %107 = add i64 %106, %105
  br label %108

108:                                              ; preds = %92, %186
  %109 = phi i64 [ 0, %92 ], [ %187, %186 ]
  br i1 %42, label %186, label %110

110:                                              ; preds = %108
  %111 = mul i64 %109, %3
  %112 = mul i64 %109, %14
  %113 = add i64 %107, %112
  br i1 %59, label %167, label %114

114:                                              ; preds = %110, %114
  %115 = phi i64 [ %164, %114 ], [ 0, %110 ]
  %116 = phi i64 [ %165, %114 ], [ 0, %110 ]
  %117 = add i64 %115, %111
  %118 = trunc i64 %117 to i32
  %119 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ16sd_t_s1_6_kernelmmmmmmmmmmmmmmmmmmPdS_S_mmE6t2_shm, i32 0, i32 %118
  %120 = load double, double addrspace(3)* %119, align 8, !tbaa !16
  %121 = load double, double addrspace(1)* %100, align 8, !tbaa !16
  %122 = fmul contract double %120, %121
  %123 = mul i64 %115, %17
  %124 = add i64 %113, %123
  %125 = getelementptr inbounds double, double addrspace(1)* %18, i64 %124
  %126 = load double, double addrspace(1)* %125, align 8, !tbaa !16
  %127 = fsub contract double %126, %122
  store double %127, double addrspace(1)* %125, align 8, !tbaa !16
  %128 = or i64 %115, 1
  %129 = add i64 %128, %111
  %130 = trunc i64 %129 to i32
  %131 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ16sd_t_s1_6_kernelmmmmmmmmmmmmmmmmmmPdS_S_mmE6t2_shm, i32 0, i32 %130
  %132 = load double, double addrspace(3)* %131, align 8, !tbaa !16
  %133 = load double, double addrspace(1)* %100, align 8, !tbaa !16
  %134 = fmul contract double %132, %133
  %135 = mul i64 %128, %17
  %136 = add i64 %113, %135
  %137 = getelementptr inbounds double, double addrspace(1)* %18, i64 %136
  %138 = load double, double addrspace(1)* %137, align 8, !tbaa !16
  %139 = fsub contract double %138, %134
  store double %139, double addrspace(1)* %137, align 8, !tbaa !16
  %140 = or i64 %115, 2
  %141 = add i64 %140, %111
  %142 = trunc i64 %141 to i32
  %143 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ16sd_t_s1_6_kernelmmmmmmmmmmmmmmmmmmPdS_S_mmE6t2_shm, i32 0, i32 %142
  %144 = load double, double addrspace(3)* %143, align 8, !tbaa !16
  %145 = load double, double addrspace(1)* %100, align 8, !tbaa !16
  %146 = fmul contract double %144, %145
  %147 = mul i64 %140, %17
  %148 = add i64 %113, %147
  %149 = getelementptr inbounds double, double addrspace(1)* %18, i64 %148
  %150 = load double, double addrspace(1)* %149, align 8, !tbaa !16
  %151 = fsub contract double %150, %146
  store double %151, double addrspace(1)* %149, align 8, !tbaa !16
  %152 = or i64 %115, 3
  %153 = add i64 %152, %111
  %154 = trunc i64 %153 to i32
  %155 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ16sd_t_s1_6_kernelmmmmmmmmmmmmmmmmmmPdS_S_mmE6t2_shm, i32 0, i32 %154
  %156 = load double, double addrspace(3)* %155, align 8, !tbaa !16
  %157 = load double, double addrspace(1)* %100, align 8, !tbaa !16
  %158 = fmul contract double %156, %157
  %159 = mul i64 %152, %17
  %160 = add i64 %113, %159
  %161 = getelementptr inbounds double, double addrspace(1)* %18, i64 %160
  %162 = load double, double addrspace(1)* %161, align 8, !tbaa !16
  %163 = fsub contract double %162, %158
  store double %163, double addrspace(1)* %161, align 8, !tbaa !16
  %164 = add nuw i64 %115, 4
  %165 = add i64 %116, 4
  %166 = icmp eq i64 %165, %60
  br i1 %166, label %167, label %114, !llvm.loop !22

167:                                              ; preds = %114, %110
  %168 = phi i64 [ 0, %110 ], [ %164, %114 ]
  br i1 %61, label %186, label %169

169:                                              ; preds = %167, %169
  %170 = phi i64 [ %183, %169 ], [ %168, %167 ]
  %171 = phi i64 [ %184, %169 ], [ 0, %167 ]
  %172 = add i64 %170, %111
  %173 = trunc i64 %172 to i32
  %174 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ16sd_t_s1_6_kernelmmmmmmmmmmmmmmmmmmPdS_S_mmE6t2_shm, i32 0, i32 %173
  %175 = load double, double addrspace(3)* %174, align 8, !tbaa !16
  %176 = load double, double addrspace(1)* %100, align 8, !tbaa !16
  %177 = fmul contract double %175, %176
  %178 = mul i64 %170, %17
  %179 = add i64 %113, %178
  %180 = getelementptr inbounds double, double addrspace(1)* %18, i64 %179
  %181 = load double, double addrspace(1)* %180, align 8, !tbaa !16
  %182 = fsub contract double %181, %177
  store double %182, double addrspace(1)* %180, align 8, !tbaa !16
  %183 = add nuw i64 %170, 1
  %184 = add i64 %171, 1
  %185 = icmp eq i64 %184, %58
  br i1 %185, label %186, label %169, !llvm.loop !23

186:                                              ; preds = %167, %169, %108
  %187 = add nuw i64 %109, 1
  %188 = icmp eq i64 %187, %0
  br i1 %188, label %189, label %108, !llvm.loop !25

189:                                              ; preds = %186, %71
  %190 = add i64 %72, %57
  %191 = icmp ult i64 %190, %22
  br i1 %191, label %71, label %70, !llvm.loop !26
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
